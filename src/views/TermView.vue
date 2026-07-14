<template>
  <div class="terms-page">
    <!-- 📄 Hero Banner Header -->
    <header class="terms-hero">
      <div class="terms-hero-container">
        <span class="terms-tagline">Terms of Use</span>
        <h1 class="terms-main-title">TERMS AND CONDITIONS</h1>
        <p class="terms-update-date">Last Updated: July 14, 2026</p>
      </div>
    </header>

    <!-- 📐 Split-Screen Content Chassis -->
    <main class="terms-split-container">
      
      <!-- 📌 Left Sticky Sidebar Navigation (Desktop) -->
      <aside class="terms-sidebar-nav">
        <div class="sticky-wrapper">
          <h4 class="nav-header">Agreement Sections</h4>
          <ul class="nav-links-list">
            <li v-for="(section, index) in termsSections" :key="'nav-' + index">
              <a :href="'#' + section.id" class="nav-anchor-link" @click.prevent="scrollToSection(section.id)">
                {{ section.title }}
              </a>
            </li>
          </ul>
        </div>
      </aside>

      <!-- 📝 Right Legal Content Column -->
      <article class="terms-content-body">
        <div class="terms-intro-block">
          <p>
            These Terms and Conditions (“Terms”) govern your access to and use of the website, applications, and services (collectively, the “Services”) owned and operated by <strong>Swychr Technology USA LLC</strong> (“Swychr”, “we”, “us”, or “our”).
          </p>
          <p class="intro-accent">
            By accessing or using our Services to purchase mobile airtime top-ups, mobile data packages, international bill payment services, eSIM profiles, or other digital products, you agree to be bound by these Terms. If you do not agree, do not use the Services.
          </p>
        </div>

        <!-- Dynamic Content Sections -->
        <section v-for="(section, index) in termsSections" :key="'sec-' + index" :id="section.id" class="content-section">
          <h2 class="section-block-title">{{ section.title }}</h2>
          <div class="section-block-text" v-html="section.content"></div>
        </section>
      </article>

    </main>
  </div>
</template>


<script>
export default {
  name: "TermView",
  data() {
    return {
      termsSections: [
        {
          id: "eligibility",
          title: "1. ELIGIBILITY AND ACCOUNT REGISTRATION",
          content: `
            <ul>
              <li><strong>Age Requirement:</strong> You must be at least 18 years old (or the age of majority in your jurisdiction) to use our Services.</li>
              <li><strong>Account Accuracy:</strong> If you create an account, you must provide accurate, current, and complete information. You are solely responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</li>
              <li><strong>Compliance:</strong> You agree to use the Services only for lawful purposes and in compliance with all applicable local, national, and international laws.</li>
            </ul>
          `
        },
        {
          id: "description-of-services",
          title: "2. DESCRIPTION OF SERVICES & DIGITAL PRODUCTS",
          content: `
            <p>Swychr operates an online marketplace providing digital products including, but not limited to:</p>
            <ul>
              <li><strong>Airtime Top-Up & Data:</strong> Reloading prepaid mobile credit and data plans for numbers across over 125 supported countries.</li>
              <li><strong>International Bill Payments:</strong> Facilitating payments to third-party utility providers, government entities, and other billers globally.</li>
              <li><strong>eSIMs (Embedded SIM cards):</strong> Providing digital cellular profiles allowing data connectivity on compatible, carrier-unlocked devices.</li>
            </ul>
          `
        },
        {
          id: "fees-payments-taxes",
          title: "3. FEES, PAYMENTS, AND TAXES",
          content: `
            <ul>
              <li><strong>Pricing:</strong> All prices for digital products are displayed on the website prior to purchase. Prices may vary depending on foreign exchange rates, local taxes, or fees imposed by mobile network operators (MNOs) or billers.</li>
              <li><strong>Payment Methods:</strong> We accept various payment methods (including credit/debit cards, digital wallets, and local payment options). By submitting a payment, you warrant that you are authorized to use the designated payment method.</li>
              <li><strong>Foreign Exchange Rates:</strong> If a transaction involves a currency conversion, Swychr applies a commercial exchange rate which includes a service margin. This rate will be displayed at the checkout page.</li>
            </ul>
          `
        },
        {
          id: "delivery-fulfillment",
          title: "4. DELIVERY AND FULFILLMENT",
          content: `
            <ul>
              <li><strong>Immediate Processing:</strong> Due to the nature of digital products, delivery instructions are processed instantly upon successful payment.</li>
              <li><strong>Recipient Information Accuracy:</strong> You are solely responsible for entering the correct phone number, account number, biller details, or device compatibility (for eSIMs). <span class="warning-text">Swychr cannot reverse, refund, or recall transfers sent to an incorrect number, account, or incompatible device.</span></li>
              <li><strong>Service Delivery Failures:</strong> If a transaction fails due to a technical error on our platform or from our provider's end, we will issue a full refund to your original payment method.</li>
            </ul>
          `
        },
        {
          id: "no-refund-policy",
          title: "5. NO REFUND POLICY (FINAL SALES)",
          content: `
            <p>Given the instant and irreversible nature of the digital goods sold:</p>
            <ul>
              <li><strong>Airtime & Data:</strong> All successful top-up transactions are <strong>final and non-refundable</strong>.</li>
              <li><strong>Bill Payments:</strong> Settle payments with billers at your own risk. Once processed, payments cannot be recalled.</li>
              <li><strong>eSIMs:</strong> eSIM profiles are deemed "consumed" once the QR code or manual activation code is displayed or delivered. No refunds will be provided unless there is a proven technical defect with the eSIM profile itself, and you have contacted support for troubleshooting first. No refunds are given for incompatible or carrier-locked devices.</li>
            </ul>
          `
        },
        {
          id: "limitation-of-liability",
          title: "6. LIMITATION OF LIABILITY",
          content: `
            <ul>
              <li><strong>Disclaimer of Warranties:</strong> The Services are provided on an "as-is" and "as-available" basis. Swychr makes no representation that the services of third-party telecom operators or utility companies will be uninterrupted or error-free.</li>
              <li><strong>Limitation:</strong> To the maximum extent permitted by law, Swychr Technology USA LLC, its affiliates, directors, or employees shall not be liable for any indirect, incidental, special, or consequential damages, including loss of revenue, profits, or data arising out of or in connection with the use of the Services.</li>
            </ul>
          `
        },
        {
          id: "intellectual-property",
          title: "7. INTELLECTUAL PROPERTY",
          content: `
            <p>All content, software, graphics, trademarks (including "Swychr"), and logos on our platform are the intellectual property of Swychr Technology USA LLC or its licensors. You may not copy, modify, distribute, or reverse engineer any part of our platform without our prior written consent.</p>
          `
        },
        {
          id: "governing-law",
          title: "8. GOVERNING LAW AND DISPUTE RESOLUTION",
          content: `
            <p>These Terms shall be governed by and construed in accordance with the laws of the State where Swychr Technology USA LLC is registered, without regard to its conflict of law principles. Any disputes arising out of these Terms shall be resolved exclusively through binding arbitration in accordance with the rules of the American Arbitration Association (AAA).</p>
          `
        }
      ]
    };
  },
  methods: {
    scrollToSection(id) {
      const element = document.getElementById(id);
      if (element) {
        const topOffset = element.getBoundingClientRect().top + window.scrollY - 100;
        window.scrollTo({
          top: topOffset,
          behavior: "smooth"
        });
      }
    }
  }
};
</script>



<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap');
.terms-page {
  width: 100%;
  background-color: #ffffff;
  font-family: 'Montserrat', sans-serif; 
  box-sizing: border-box;
}

.terms-hero {
  width: 100%;
  background-color: #fcfbfe; 
  border-bottom: 1px solid #efeaf6;
  padding: 7rem 2rem 4rem 2rem;
  display: flex;
  justify-content: center;
}

.terms-hero-container {
  max-width: 1200px;
  width: 100%;
  text-align: left;
}

.terms-tagline {
  font-size: 0.85rem;
  font-weight: 700;
  color: #00d293; /* Swychr Mint Green */
  text-transform: uppercase;
  letter-spacing: 0.08em;
  display: block;
  margin-bottom: 0.5rem;
}

.terms-main-title {
  font-size: 2.8rem;
  font-weight: 800;
  color: #1a0830; /* Swychr Deep Purple Slate */
  margin: 0 0 0.75rem 0;
  letter-spacing: -0.02em;
}

.terms-update-date {
  font-size: 0.95rem;
  color: #6c5e7e;
  margin: 0;
}

/* Split-Screen Main Container */
.terms-split-container {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 4rem 2rem 6rem 2rem;
  display: flex;
  gap: 4rem;
  box-sizing: border-box;
}

/* Left Sticky Sidebar */
.terms-sidebar-nav {
  width: 280px;
  flex-shrink: 0;
  text-align: left;
}

.sticky-wrapper {
  position: sticky;
  top: 100px; /* Anchors the document sidebar on scroll */
}

.nav-header {
  font-size: 1rem;
  font-weight: 700;
  color: #1a0830;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin: 0 0 1.25rem 0;
  border-bottom: 2px solid #efeaf6;
  padding-bottom: 0.5rem;
}

.nav-links-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.nav-anchor-link {
  font-size: 0.9rem;
  font-weight: 600;
  color: #6c5e7e;
  text-decoration: none;
  transition: color 0.2s ease, padding-left 0.2s ease;
  line-height: 1.4;
}

.nav-anchor-link:hover {
  color: #3b1565; /* Swychr Brand Purple */
  padding-left: 4px;
}

/* Right Content Body Column */
.terms-content-body {
  flex: 1;
  text-align: left;
}

.terms-intro-block {
  margin-bottom: 3.5rem;
}

.terms-intro-block p {
  font-size: 1.1rem;
  line-height: 1.7;
  color: #5c4e6e;
  margin-bottom: 1.25rem;
}

.terms-intro-block .intro-accent {
  font-size: 1.15rem;
  font-weight: 500;
  border-left: 3px solid #3b1565;
  padding-left: 1.5rem;
  color: #3b1565;
}

.content-section {
  margin-bottom: 3.5rem;
  border-bottom: 1px solid #f5f3f7;
  padding-bottom: 2.5rem;
}

.content-section:last-child {
  margin-bottom: 0;
  border-bottom: none;
  padding-bottom: 0;
}

.section-block-title {
  font-size: 1.4rem;
  font-weight: 700;
  color: #1a0830;
  margin: 0 0 1.5rem 0;
}

/* Nested lists and content blocks inside terms content scope */
.section-block-text::v-html p,
.section-block-text p {
  font-size: 1rem;
  line-height: 1.7;
  color: #5c4e6e;
  margin: 0 0 1.25rem 0;
}

.section-block-text::v-html ul,
.section-block-text ul {
  list-style: none;
  padding: 0;
  margin: 0 0 1.5rem 0;
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
}

.section-block-text::v-html li,
.section-block-text li {
  font-size: 1rem;
  line-height: 1.65;
  color: #5c4e6e;
  padding-left: 1.5rem;
  position: relative;
}

.section-block-text::v-html li::before,
.section-block-text li::before {
  content: "•";
  color: #00d293; /* Brand green bullet points */
  font-size: 1.5rem;
  position: absolute;
  left: 0;
  top: -2px;
}

.warning-text {
  color: #d11a2a;
  font-weight: 600;
}

/* ==========================================================================
   📱 TABLET & MOBILE RESPONSIVE ADAPTATIONS
   ========================================================================== */
@media (max-width: 850px) {
  .terms-split-container {
    flex-direction: column;
    padding: 3rem 1.25rem;
    gap: 2rem;
  }

  .terms-sidebar-nav {
    display: none; /* Auto-collapses the navigation sidebar on smaller viewports */
  }

  .terms-hero {
    padding: 5rem 1.25rem 3rem 1.25rem;
  }

  .terms-main-title {
    font-size: 2rem;
  }

  .terms-intro-block p {
    font-size: 1rem;
  }

  .terms-intro-block .intro-accent {
    font-size: 1.05rem;
    padding-left: 1rem;
  }

  .section-block-title {
    font-size: 1.25rem;
  }
}

</style>