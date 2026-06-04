<template>
  <section class="full-bleed-hero">
    <div class="overlay"></div> 
    
    <div class="hero-container">
      <div class="text-block">
        <h1 class="hero-title">The swiftest way to send mobile top-up worldwide</h1>
        <p class="hero-subtitle">99% of mobile recharges sent online with SwyChr arrive in 3 seconds.</p>
        
        <div class="services-toggle-container">
          <p class="services-label">New Services to send on SwyChr</p>
          <div class="toggle-buttons-row">
            
              <button 
              class="toggle-pill voucher-pill" 
              :class="{ active: currentTab === 'vouchers' }"
              @click="currentTab = 'vouchers'"
            >
              <span class="icon-circle orange-bg">📱</span>
              <span class="pill-text">Airtime</span>
            </button>

                 <button 
              class="toggle-pill topup-pill" 
              :class="{ active: currentTab === 'topup' }"
              @click="currentTab = 'topup'"
            >
              <span class="icon-circle blue-bg">📱</span>
              <span class="pill-text">Data</span>
            </button>
          
            <button 
              class="toggle-pill voucher-pill" 
              :class="{ active: currentTab === 'vouchers' }"
              @click="currentTab = 'vouchers'"
            >
              <span class="icon-circle orange-bg">🎟️</span>
              <span class="pill-text">Gift Cards</span>
              <span class="pill-badge">Soon</span>
            </button>

        

          </div>
        </div>

        <div class="topup-card">
          <h2 class="card-title">
            {{ currentTab === 'topup' ? 'Ready to send a top-up?' : 'Ready to buy a voucher?' }}
          </h2>
          <div class="input-wrapper">
            <span class="search-icon">🔍</span>
            <input 
              type="text" 
              :placeholder="currentTab === 'topup' ? 'Enter number' : 'Search vouchers...'" 
              class="phone-input" 
            />
          </div>
          <button class="cta-button">
            {{ currentTab === 'topup' ? 'Start top-up' : 'View vouchers' }}
          </button>
        </div>

      </div>
    </div>
  </section>


  <section class="app-promo-section">
    <div class="promo-card">
      
    
      <div class="promo-left">
        <h2 class="promo-title">Top-up wherever, whenever</h2>
        <p class="promo-text">Get the SwyChr App for the fastest, easiest way to top-up any phone.</p>
        
  
        <div class="download-badges">
          <a href="https://apps.apple.com/ae/app/swychr/id1586029318" class="store-badge">
            <img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg" alt="Download on the App Store" />
          </a>
          <a href="https://play.google.com/store/apps/details?id=com.innobins.jtqwallet" class="store-badge">
            <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Get it on Google Play" />
          </a>
        </div>
      </div>

  
      <div class="promo-right">
        <div class="phone-mockup-wrapper">
          <img src="https://swychr.com/img/coded2.15c40309.png" alt="SwyChr App Screen" class="mockup-screen" />
        </div>
      </div>

    </div>
  </section>



<section class="faq-section">
    <div class="faq-container">
      <h2 class="faq-main-title">Have a question about sending mobile recharge with SwyChr?</h2>


      <div class="faq-accordion-list">
        <div 
          v-for="(item, index) in faqData" 
          :key="index" 
          class="faq-item"
          :class="{ 'is-open': openFaqIndex === index }"
        >
  
          <button class="faq-header" @click="toggleFaq(index)">
            <span class="faq-question">{{ item.question }}</span>
            <span class="faq-chevron">▼</span>
          </button>

     
          <div class="faq-body" :style="{ maxHeight: openFaqIndex === index ? '300px' : '0px' }">
            <div class="faq-content-inner">
              <p v-for="(paragraph, pIdx) in item.answer" :key="pIdx" class="faq-answer-text">
                {{ paragraph }}
              </p>
            </div>
          </div>
          
        </div>
      </div>

    </div>
  </section>

</template>

<script setup>
import { ref } from 'vue'

const currentTab = ref('topup')

const openFaqIndex = ref(null)

function toggleFaq(index) {

  openFaqIndex.value = openFaqIndex.value === index ? null : index
}

const faqData = ref([
  {
    question: "What is SwyChr?",
    answer: [
      "SwyChr is a leading global fintech platform designed for fast, borderless digital top-ups and financial connectivity.",
      "With SwyChr, you can instantly buy mobile top-ups for your own phone or send a prepaid mobile recharge online to friends and family across the globe. You can do it at any time, on any device that suits you."
    ]
  },
  {
    question: "What is an international top-up?",
    answer: [
      "An international top-up is a service that allows you to send mobile credit or data balances to a phone line registered in a completely different country.",
      "Once purchased, the airtime credit is processed instantly and added safely directly to the recipient's phone number balance profile abroad."
    ]
  },
  {
    question: "Can I send mobile recharges from abroad?",
    answer: [
      "Yes, absolutely! SwyChr is built exactly for cross-border needs. You can be anywhere in the world and safely send a top-up balance to over 140 supported global destinations in seconds."
    ]
  },
  {
    question: "How to send a top-up online?",
    answer: [
      "It only takes three simple steps: select your service preference (top-up or voucher), enter the phone number with country area prefix code, choose your desired top-up amount, and complete your secure checkout process."
    ]
  },
  {
    question: "Can I also send data?",
    answer: [
      "Yes! Depending on the regional mobile operator assigned to the network line number you input, you can choose to send standard airtime credits or specific data-bundle bundles."
    ]
  },
  {
    question: "What are the most popular countries that our users recharge?",
    answer: [
      "Our users regularly send top-ups to lines across Nigeria, Ghana, India, Mexico, the Philippines, Kenya, and Jamaica, among many other international locations."
    ]
  },
  {
    question: "What are the most popular mobile operators?",
    answer: [
      "We support premium connectivity integrations across thousands of operators globally, including major carriers like MTN, Airtel, Vodafone, Safaricom, Globe, Telcel, and Digicel."
    ]
  },
  {
    question: "Can I pay for a mobile recharge with my credit card?",
    answer: [
      "Yes. SwyChr relies on banking standard payment gateways. We accept all major international credit/debit cards, secure wallets, and localized instant funding methods securely."
    ]
  },
  {
    question: "How can I get exclusive SwyChr promotions?",
    answer: [
      "You can opt-in to marketing alerts in your settings panel or look directly inside your SwyChr app drawer to find regular operator discount codes and seasonal bonus balance events."
    ]
  },
  {
    question: "Can I also buy gift cards online with SwyChr?",
    answer: [
      "Yes! By simply toggling over to our digital Vouchers tab menu right inside the hero card layout box, you can browse premium gaming passes, streaming service gift vouchers, and shopping gift cards instantly."
    ]
  }
])
</script>

<style scoped>
.full-bleed-hero {
  position: relative;
  width: 100%;
  min-height: calc(100vh - 70px);
  background: url('https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=1600&auto=format&fit=crop') no-repeat center center;
  background-size: cover;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 4rem 1rem;
}


.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(180deg, rgba(176, 66, 201, 0.4) 0%, rgba(15, 23, 42, 0.85) 100%);
  z-index: 1;
}

.hero-container {
  position: relative;
  max-width: 1200px;
  width: 100%;
  display: flex;
  justify-content: center;
  z-index: 2;
}

.text-block {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 850px;
  width: 100%;
}

.hero-title {
  font-size: 3.5rem;
  font-weight: 800;
  color: #ffffff;
  line-height: 1.15;
  margin-bottom: 1.2rem;
  letter-spacing: -1px;
}

.hero-subtitle {
  font-size: 1.35rem;
  font-weight: 600;
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.4;
  max-width: 680px;
  margin-bottom: 2.5rem;
}

.services-toggle-container {
  margin-bottom: 1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.8rem;
}

.services-label {
  color: #ffffff;
  font-size: 1.1rem;
  font-weight: 700;
  opacity: 0.95;
}

.toggle-buttons-row {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.toggle-pill {
  display: flex;
  align-items: center;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  padding: 6px 20px 6px 6px;
  border-radius: 40px;
  cursor: pointer;
  position: relative;
  transition: all 0.25s ease;
}

.pill-text {
  color: #ffffff;
  font-size: 1.05rem;
  font-weight: 700;
  margin-left: 10px;
}

.icon-circle {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
}


.orange-bg { background-color: #e0532b; }
.blue-bg { background-color: #1a5699; }

.pill-badge {
  position: absolute;
  top: -8px;
  right: 15px;
  background-color: #d6007d;
  color: white;
  font-size: 0.6rem;
  font-weight: 800;
  padding: 1px 5px;
  border-radius: 8px;
  text-transform: uppercase;
}


.voucher-pill.active {
  background: #ffffff;
  border-color: #ffffff;
}
.voucher-pill.active .pill-text { color: #111827; }

.topup-pill.active {
  background: #1e293b; 
  border-color: #1e293b;
}


.topup-card {
  background: #ffffff;
  border-radius: 28px;
  padding: 2.5rem;
  width: 100%;
  max-width: 520px;
  box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
  text-align: center;
}

.card-title {
  font-size: 1.4rem;
  font-weight: 700;
  color: #0f172a;
  margin-bottom: 1.8rem;
}

.input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
  margin-bottom: 1.5rem;
}

.search-icon {
  position: absolute;
  left: 22px;
  color: #64748b;
  font-size: 1.2rem;
}

.phone-input {
  width: 100%;
  padding: 1.2rem 1rem 1.2rem 60px;
  font-size: 1.15rem;
  border: 2px solid #e2e8f0;
  border-radius: 40px;
  outline: none;
  background-color: #f8fafc;
  transition: all 0.2s;
}

.phone-input:focus {
  border-color: #b042c9;
  background-color: #ffffff;
}

.cta-button {
  width: 100%;
  padding: 1.2rem;
  background-color:  #b042c9; 
  color:  #ffffff;
  font-weight: 800;
  font-size: 1.2rem;
  border: none;
  border-radius: 40px;
  cursor: pointer;
  transition: transform 0.1s, background-color 0.2s;
}

.cta-button:hover {
  background-color: #13113c;
  transform: translateY(-1px);
}


@media (max-width: 768px) {
  .full-bleed-hero { padding: 3rem 1rem; }
  .hero-title { font-size: 1.9rem; line-height: 1.25; }
  .hero-subtitle { font-size: 1rem; margin-bottom: 2rem; }
  .services-label { font-size: 0.95rem; }
  .toggle-pill { padding: 5px 15px 5px 5px; }
  .pill-text { font-size: 0.9rem; }
  .icon-circle { width: 30px; height: 30px; font-size: 0.95rem; }
  .topup-card { padding: 1.8rem 1.2rem; border-radius: 20px; }
  .card-title { font-size: 1.15rem; margin-bottom: 1.2rem; }
  .phone-input { padding: 0.95rem 1rem 0.95rem 50px; font-size: 1rem; }
  .search-icon { left: 18px; font-size: 1rem; }
  .cta-button { padding: 1rem; font-size: 1.05rem; }
}



.app-promo-section {
  width: 100%;
  background-color: #ffffff;
  padding: 5rem 1.5rem; 
  display: flex;
  justify-content: center;
  align-items: center;
}

.promo-card {
  background-color: #b042c9; 
  max-width: 1100px;
  width: 100%;
  border-radius: 28px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 3.5rem 4rem 0 4rem;
  overflow: hidden; 
  gap: 2rem;
}

.promo-left {
  flex: 1.2;
  display: flex;
  flex-direction: column;
  padding-bottom: 3.5rem;
}

.promo-title {
  font-size: 2.2rem;
  font-weight: 800;
  color: #ffffff; 
  margin-bottom: 1rem;
  line-height: 1.2;
}

.promo-text {
  font-size: 1.15rem;
  font-weight: 600;
  color: rgba(255, 255, 255, 0.9);
  line-height: 1.5;
  max-width: 450px;
  margin-bottom: 2rem;
}

.download-badges {
  display: flex;
  gap: 1rem;
}

.store-badge img {
  height: 42px;
  display: block;
}

.promo-right {
  flex: 0.8;
  display: flex;
  justify-content: center;
  align-items: flex-end;
  align-self: flex-end;
}

.phone-mockup-wrapper {
  width: 250px;
  height: 300px;
  border-bottom: none;
  border-top-left-radius: 36px;
  border-top-right-radius: 36px;
  overflow: hidden;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

.mockup-screen {
  width: 100%;
  height: 100%;
  object-fit: cover;
}


@media (max-width: 900px) {
  .app-promo-section {
    padding: 2.5rem 1rem; 
  }
  
  .promo-card {
    flex-direction: column;
    padding: 3rem 1.5rem 0 1.5rem; 
    text-align: center;
    gap: 2rem;
    width: 100%;
    max-width: 100%;
  }

  .promo-left {
    align-items: center;
    padding-bottom: 0px; 
    width: 100%;
  }

  .promo-title {
    font-size: 1.8rem;
    max-width: 100%;
  }

  .promo-text {
    font-size: 1rem;
    max-width: 100%;
    margin-bottom: 1.5rem;
  }

  .download-badges {
    justify-content: center;
    width: 100%;
    gap: 0.8rem;
  }

  .store-badge img {
    height: 36px; 
    max-width: 135px;
    object-fit: contain;
  }

  .promo-right {
    width: 100%;
    justify-content: center;
    margin-top: 1rem;
  }

  .phone-mockup-wrapper {
    width: 210px; 
    height: 260px;
  }
}


.faq-section {
  width: 100%;
  background-color: #ffffff;
  padding: 6rem 1.5rem;
  display: flex;
  justify-content: center;
}

.faq-container {
  max-width: 900px; 
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.faq-main-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: #b042c9;
  text-align: center;
  line-height: 1.25;
  margin-bottom: 4rem;
  max-width: 800px;
}

.faq-accordion-list {
  width: 100%;
  display: flex;
  flex-direction: column;
}

.faq-item {
  width: 100%;
  border-bottom: 1px solid #e2e8f0; 
}

.faq-header {
  width: 100%;
  background: transparent;
  border: none;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.8rem 0.5rem;
  cursor: pointer;
  text-align: left;
  outline: none;
}

.faq-question {
  font-size: 1.35rem;
  font-weight: 700;
  color: #b042c9; 
  line-height: 1.3;
  transition: color 0.2s ease;
}

.faq-header:hover .faq-question {
    color: #034354;
}

.faq-chevron {
  font-size: 0.75rem;
  color: #64748b;
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.faq-item.is-open .faq-chevron {
  transform: rotate(180deg);
  color: #b042c9;
}


.faq-body {
  overflow: hidden;
  transition: max-height 0.3s cubic-bezier(0.4, 0, 0.2, 1); 
}

.faq-content-inner {
  padding: 0 0.5rem 2rem 0.5rem; 
}

.faq-answer-text {
  font-size: 1.1rem;
  font-weight: 500;
  color: #334155;
  line-height: 1.6;
  margin-bottom: 1rem;
}

.faq-answer-text:last-child {
  margin-bottom: 0px;
}


@media (max-width: 768px) {
  .faq-section {
    padding: 4rem 1rem;
  }

  .faq-main-title {
    font-size: 1.8rem;
    margin-bottom: 2.5rem;
  }

  .faq-header {
    padding: 1.4rem 0.2rem;
  }

  .faq-question {
    font-size: 1.1rem;
    padding-right: 1rem;
  }

  .faq-answer-text {
    font-size: 0.95rem;
    line-height: 1.5;
  }
}
</style>