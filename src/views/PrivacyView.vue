<template>
  <div class="privacy-page">
    <header class="privacy-hero">
      <div class="privacy-hero-container">
        <span class="privacy-tagline">Data Protection</span>
        <h1 class="privacy-main-title">PRIVACY POLICY</h1>
        <p class="privacy-update-date">Last Updated: July 14, 2026</p>
      </div>
    </header>

    <main class="privacy-split-container">
      
      <aside class="privacy-sidebar-nav">
        <div class="sticky-wrapper">
          <h4 class="nav-header">Policy Sections</h4>
          <ul class="nav-links-list">
            <li v-for="(section, index) in privacySections" :key="'nav-' + index">
              <a :href="'#' + section.id" class="nav-anchor-link" @click.prevent="scrollToSection(section.id)">
                {{ section.title }}
              </a>
            </li>
          </ul>
        </div>
      </aside>

      <article class="privacy-content-body">
        <div class="privacy-intro-block">
          <p>
            At <strong>Swychr Technology USA LLC</strong> (“Swychr”, “we”, “us”, or “our”), we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your personal information when you use our website, mobile application, and digital services.
          </p>
        </div>

        <section v-for="(section, index) in privacySections" :key="'sec-' + index" :id="section.id" class="content-section">
          <h2 class="section-block-title">{{ section.title }}</h2>
          <div class="section-block-text" v-html="section.content"></div>
        </section>
      </article>

    </main>
  </div>
</template>


<script>
export default {
  name: "PrivacyView",
  data() {
    return {
      privacySections: [
        {
          id: "information-we-collect",
          title: "1. INFORMATION WE COLLECT",
          content: `
            <p>We collect information to provide a seamless transaction experience:</p>
            <ul>
              <li><strong>Personal Identity Data:</strong> Name, email address, physical address, phone number, and date of birth (when registering an account or complying with KYC regulations).</li>
              <li><strong>Recipient Information:</strong> The phone numbers, account details, or carrier specifications of the third parties you top up, pay bills for, or register eSIM profiles for.</li>
              <li><strong>Payment & Transaction Data:</strong> Payment card details (processed securely via PCI-DSS compliant third-party gateways), transaction history, and currency preferences.</li>
              <li><strong>Technical Data:</strong> IP address, device type, operating system, browser type, and cookie data to improve website functionality and prevent fraud.</li>
            </ul>
          `
        },
        {
          id: "how-we-use-information",
          title: "2. HOW WE USE YOUR INFORMATION",
          content: `
            <p>We use your information for the following purposes:</p>
            <ul>
              <li><strong>To Fulfill Services:</strong> To deliver airtime, mobile data, process utility bill payments, and generate eSIM activation profiles.</li>
              <li><strong>To Process Payments:</strong> To authorize transactions and prevent fraudulent charges.</li>
              <li><strong>Customer Support:</strong> To investigate and resolve transaction issues or technical failures.</li>
              <li><strong>Compliance & Fraud Prevention:</strong> To verify identities, screen for sanctions, and comply with international Anti-Money Laundering (AML) and Counter-Terrorism Financing (CTF) laws.</li>
              <li><strong>Marketing Communications:</strong> With your explicit consent, to send you updates, promotional offers, and newsletters. You can opt out at any time.</li>
            </ul>
          `
        },
        {
          id: "how-we-share-information",
          title: "3. HOW WE SHARE YOUR INFORMATION",
          content: `
            <p>We do not sell your personal data. We only share your information in the following limited circumstances:</p>
            <ul>
              <li><strong>Third-Party Infrastructure Providers:</strong> With mobile network operators (MNOs), global aggregators, utility billing networks, and eSIM providers to fulfill your order.</li>
              <li><strong>Payment Processors:</strong> With authorized payment gateways to securely process your transactions.</li>
              <li><strong>Legal Compliance:</strong> With regulatory bodies, law enforcement, or judicial authorities if required to do so by applicable law, or to protect the safety and rights of Swychr, our users, or the public.</li>
            </ul>
          `
        },
        {
          id: "data-retention-security",
          title: "4. DATA RETENTION AND SECURITY",
          content: `
            <ul>
              <li><strong>Security Measures:</strong> We implement industry-standard administrative, technical, and physical security measures (including SSL encryption) designed to protect your personal data from unauthorized access, disclosure, or alteration.</li>
              <li><strong>Retention Period:</strong> We retain your personal and transaction data only as long as necessary to fulfill the purposes outlined in this policy, or to satisfy legal, regulatory, tax, or accounting requirements.</li>
            </ul>
          `
        },
        {
          id: "your-privacy-rights",
          title: "5. YOUR PRIVACY RIGHTS",
          content: `
            <p>Depending on your residency (e.g., California Consumer Privacy Act - CCPA, General Data Protection Regulation - GDPR), you may have the following rights:</p>
            <ul>
              <li><strong>Access:</strong> The right to request copies of your personal data held by us.</li>
              <li><strong>Correction:</strong> The right to request that we correct any inaccurate or incomplete information.</li>
              <li><strong>Deletion:</strong> The right to request that we erase your personal data under certain conditions, subject to our overriding legal retention obligations.</li>
              <li><strong>Data Portability:</strong> The right to request that we transfer your collected data to another organization.</li>
            </ul>
            <p class="rights-outro">To exercise any of these rights, please contact our Data Protection Officer at the email provided below.</p>
          `
        },
        {
          id: "cookies-tracking",
          title: "6. COOKIES AND TRACKING TECHNOLOGIES",
          content: `
            <p>We use cookies to analyze site traffic, remember your preferences, and optimize your overall experience. You can adjust your browser settings to refuse cookies, but some features of our website may not function correctly as a result.</p>
          `
        },
        {
          id: "contact-us",
          title: "7. CONTACT US",
          content: `
            <p>If you have any questions or concerns regarding these Terms and Conditions or this Privacy Policy, please contact us at:</p>
            <ul>
              <li><strong>Company Name:</strong> Swychr Technology USA LLC</li>
              <li><strong>Email:</strong> info@swychr.com</li>
            </ul>
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
.privacy-page {
  width: 100%;
  background-color: #ffffff;
  font-family: 'Montserrat', sans-serif; 
  box-sizing: border-box;
}


.privacy-hero {
  width: 100%;
  background-color: #fcfbfe; 
  border-bottom: 1px solid #efeaf6;
  padding: 7rem 2rem 4rem 2rem;
  display: flex;
  justify-content: center;
}

.privacy-hero-container {
  max-width: 1200px;
  width: 100%;
  text-align: left;
}

.privacy-tagline {
  font-size: 0.85rem;
  font-weight: 700;
   color: #b042c9; 
  text-transform: uppercase;
  letter-spacing: 0.08em;
  display: block;
  margin-bottom: 0.5rem;
}

.privacy-main-title {
  font-size: 2.8rem;
  font-weight: 800;
  color: #1a0830; 
  margin: 0 0 0.75rem 0;
  letter-spacing: -0.02em;
}

.privacy-update-date {
  font-size: 0.95rem;
  color: #6c5e7e;
  margin: 0;
}


.privacy-split-container {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 4rem 2rem 6rem 2rem;
  display: flex;
  gap: 4rem;
  box-sizing: border-box;
}

.privacy-sidebar-nav {
  width: 280px;
  flex-shrink: 0;
  text-align: left;
}

.sticky-wrapper {
  position: sticky;
  top: 100px; 
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
  color: #3b1565;
  padding-left: 4px;
}


.privacy-content-body {
  flex: 1;
  text-align: left;
}

.privacy-intro-block {
  margin-bottom: 3.5rem;
  border-left: 3px solid #3b1565;
  padding-left: 1.5rem;
}

.privacy-intro-block p {
  font-size: 1.1rem;
  line-height: 1.7;
  color: #3b1565;
  font-weight: 500;
  margin: 0;
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
  color: #00d293;
  font-size: 1.5rem;
  position: absolute;
  left: 0;
  top: -2px;
}

.section-block-text::v-html li strong,
.section-block-text li strong {
  color: #1a0830;
}

.rights-outro {
  font-weight: 500;
  color: #3b1565 !important;
  margin-top: 1rem;
}


@media (max-width: 850px) {
  .terms-split-container {
    flex-direction: column;
    padding: 3rem 1.25rem;
    gap: 2rem;
  }

  .privacy-sidebar-nav {
    display: none; 
  }

  .privacy-hero {
    padding: 5rem 1.25rem 3rem 1.25rem;
  }

  .privacy-main-title {
    font-size: 2rem;
  }

  .privacy-intro-block {
    padding-left: 1rem;
  }

  .privacy-intro-block p {
    font-size: 1rem;
  }

  .section-block-title {
    font-size: 1.25rem;
  }
}
</style>