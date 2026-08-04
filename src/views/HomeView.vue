<template>
  <div class="home-view-wrapper">
    <!-- Hero Section -->
    <section class="full-bleed-hero">
      <div class="hero-container">
        
        <div class="text-block">
          <span class="badge">FAST & SECURE</span>
          <h1>Send Airtime & Bundles Globally</h1>
          <p class="hero-subtitle">
            Recharge mobile numbers instantly across 150+ countries with top tier reliability.
          </p>
        </div>

        <!-- 🌟 Updated Mobile Airtime Country Selector Card -->
        <div class="topup-card">
          <div class="card-header">
            <span class="section-label">DESTINATION</span>
          </div>

          <!-- Country Selector Box -->
          <div class="destination-select-box" @click="openCountryModal">
            <div class="dest-icon-wrapper">
              <img 
  v-if="selectedCountry" 
  :src="`https://flagcdn.com/w40/${selectedCountry.code.toLowerCase()}.png`" 
  :alt="selectedCountry.name"
  class="country-flag-img"
/>
              <span v-else class="globe-icon">🌐</span>
            </div>
            <div class="dest-info">
              <small>Select Country</small>
              <strong v-if="selectedCountry">{{ selectedCountry.name }} ({{ selectedCountry.dialCode }})</strong>
              <span v-else class="placeholder-text">Tap to choose destination</span>
            </div>
            <div class="dropdown-chevron">▼</div>
          </div>

          <!-- Action CTA Button -->
          <button 
            class="cta-button" 
            :disabled="!selectedCountry"
            @click="handleStartTopup"
          >
            {{ selectedCountry ? 'Continue to Top-up' : 'Select Destination' }}
          </button>
        </div>
      </div>
    </section>

    <!-- FAQ Accordion Section -->
    <section class="faq-section">
      <div class="container">
        <h2 class="section-heading">Frequently Asked Questions</h2>
        <div class="faq-accordion">
          <div 
            v-for="(faq, index) in faqData" 
            :key="index" 
            class="faq-item"
            :class="{ active: openFaqIndex === index }"
            @click="toggleFaq(index)"
          >
            <div class="faq-header">
              <h3>{{ faq.question }}</h3>
              <span class="faq-icon">{{ openFaqIndex === index ? '−' : '+' }}</span>
            </div>
            <div v-show="openFaqIndex === index" class="faq-body">
              <p v-for="(p, pIdx) in faq.answer" :key="pIdx">{{ p }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 🌍 Country Selector Modal -->
    <Teleport to="body">
      <div v-if="isModalOpen" class="country-modal-overlay" @click.self="closeCountryModal">
        <div class="country-modal-card">
          <div class="modal-handle-bar"></div>
          
          <div class="modal-header">
            <h3>Select Country</h3>
            <button class="close-modal-btn" @click="closeCountryModal">✕</button>
          </div>

          <!-- Search Input -->
          <div class="modal-search-wrapper">
            <span class="search-lens">🔍</span>
            <input 
              type="text" 
              v-model="countrySearchQuery" 
              placeholder="Search countries..." 
              class="modal-search-input"
              ref="searchInputRef"
            />
          </div>

          <!-- Country List -->
          <div class="country-list-scroll">
            <div 
              v-for="country in filteredCountries" 
              :key="country.code" 
              class="country-item-row"
              @click="selectCountry(country)"
            >
             <img 
  :src="`https://flagcdn.com/w40/${country.code.toLowerCase()}.png`" 
  :alt="country.name"
  class="country-flag-img"
/>
              <div class="country-meta">
                <span class="country-name">{{ country.name }}</span>
                <small class="country-code">{{ country.code }} · {{ country.dialCode }}</small>
              </div>
              <span class="item-arrow">›</span>
            </div>

            <div v-if="filteredCountries.length === 0" class="no-countries-found">
              No countries found matching "{{ countrySearchQuery }}"
            </div>
          </div>
        </div>
      </div>
    </Teleport>
  </div>
</template>

<script setup>
import { ref, computed, nextTick } from 'vue'

const openFaqIndex = ref(null)

function toggleFaq(index) {
  openFaqIndex.value = openFaqIndex.value === index ? null : index
}

// ── Country Selector Modal State ──────────────────────────────────────────
const isModalOpen = ref(false)
const countrySearchQuery = ref('')
const selectedCountry = ref(null)
const searchInputRef = ref(null)

// 🌍 Expanded 100+ Global Countries List
const countries = ref([
  { name: 'Afghanistan', code: 'AF', dialCode: '+93', flag: '🇦🇫' },
  { name: 'Albania', code: 'AL', dialCode: '+355', flag: '🇦🇱' },
  { name: 'Algeria', code: 'DZ', dialCode: '+213', flag: '🇩🇿' },
  { name: 'Andorra', code: 'AD', dialCode: '+376', flag: '🇦🇩' },
  { name: 'Angola', code: 'AO', dialCode: '+244', flag: '🇦🇴' },
  { name: 'Argentina', code: 'AR', dialCode: '+54', flag: '🇦🇷' },
  { name: 'Armenia', code: 'AM', dialCode: '+374', flag: '🇦🇲' },
  { name: 'Australia', code: 'AU', dialCode: '+61', flag: '🇦🇺' },
  { name: 'Austria', code: 'AT', dialCode: '+43', flag: '🇦🇹' },
  { name: 'Azerbaijan', code: 'AZ', dialCode: '+994', flag: '🇦🇿' },
  { name: 'Bahamas', code: 'BS', dialCode: '+1-242', flag: '🇧🇸' },
  { name: 'Bahrain', code: 'BH', dialCode: '+973', flag: '🇧🇭' },
  { name: 'Bangladesh', code: 'BD', dialCode: '+880', flag: '🇧🇩' },
  { name: 'Barbados', code: 'BB', dialCode: '+1-246', flag: '🇧🇧' },
  { name: 'Belgium', code: 'BE', dialCode: '+32', flag: '🇧🇪' },
  { name: 'Belize', code: 'BZ', dialCode: '+501', flag: '🇧🇿' },
  { name: 'Benin', code: 'BJ', dialCode: '+229', flag: '🇧🇯' },
  { name: 'Bolivia', code: 'BO', dialCode: '+591', flag: '🇧🇴' },
  { name: 'Brazil', code: 'BR', dialCode: '+55', flag: '🇧🇷' },
  { name: 'Bulgaria', code: 'BG', dialCode: '+359', flag: '🇧🇬' },
  { name: 'Burkina Faso', code: 'BF', dialCode: '+226', flag: '🇧🇫' },
  { name: 'Burundi', code: 'BI', dialCode: '+257', flag: '🇧🇮' },
  { name: 'Cambodia', code: 'KH', dialCode: '+855', flag: '🇰🇭' },
  { name: 'Cameroon', code: 'CM', dialCode: '+237', flag: '🇨🇲' },
  { name: 'Canada', code: 'CA', dialCode: '+1', flag: '🇨🇦' },
  { name: 'Chad', code: 'TD', dialCode: '+235', flag: '🇹🇩' },
  { name: 'Chile', code: 'CL', dialCode: '+56', flag: '🇨🇱' },
  { name: 'China', code: 'CN', dialCode: '+86', flag: '🇨🇳' },
  { name: 'Colombia', code: 'CO', dialCode: '+57', flag: '🇨🇴' },
  { name: 'Congo (DRC)', code: 'CD', dialCode: '+243', flag: '🇨🇩' },
  { name: 'Costa Rica', code: 'CR', dialCode: '+506', flag: '🇨🇷' },
  { name: 'Cote d\'Ivoire', code: 'CI', dialCode: '+225', flag: '🇨🇮' },
  { name: 'Croatia', code: 'HR', dialCode: '+385', flag: '🇭🇷' },
  { name: 'Cyprus', code: 'CY', dialCode: '+357', flag: '🇨🇾' },
  { name: 'Denmark', code: 'DK', dialCode: '+45', flag: '🇩🇰' },
  { name: 'Dominican Republic', code: 'DO', dialCode: '+1-809', flag: '🇩🇴' },
  { name: 'Ecuador', code: 'EC', dialCode: '+593', flag: '🇪🇨' },
  { name: 'Egypt', code: 'EG', dialCode: '+20', flag: '🇪🇬' },
  { name: 'El Salvador', code: 'SV', dialCode: '+503', flag: '🇸🇻' },
  { name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: '🇪🇹' },
  { name: 'Finland', code: 'FI', dialCode: '+358', flag: '🇫🇮' },
  { name: 'France', code: 'FR', dialCode: '+33', flag: '🇫🇷' },
  { name: 'Gabon', code: 'GA', dialCode: '+241', flag: '🇬🇦' },
  { name: 'Gambia', code: 'GM', dialCode: '+220', flag: '🇬🇲' },
  { name: 'Georgia', code: 'GE', dialCode: '+995', flag: '🇬🇪' },
  { name: 'Germany', code: 'DE', dialCode: '+49', flag: '🇩🇪' },
  { name: 'Ghana', code: 'GH', dialCode: '+233', flag: '🇬🇭' },
  { name: 'Greece', code: 'GR', dialCode: '+30', flag: '🇬🇷' },
  { name: 'Guatemala', code: 'GT', dialCode: '+502', flag: '🇬🇹' },
  { name: 'Guinea', code: 'GN', dialCode: '+224', flag: '🇬🇳' },
  { name: 'Haiti', code: 'HT', dialCode: '+509', flag: '🇭🇹' },
  { name: 'Honduras', code: 'HN', dialCode: '+504', flag: '🇭🇳' },
  { name: 'Hungary', code: 'HU', dialCode: '+36', flag: '🇭🇺' },
  { name: 'India', code: 'IN', dialCode: '+91', flag: '🇮🇳' },
  { name: 'Indonesia', code: 'ID', dialCode: '+62', flag: '🇮🇩' },
  { name: 'Iraq', code: 'IQ', dialCode: '+964', flag: '🇮🇶' },
  { name: 'Ireland', code: 'IE', dialCode: '+353', flag: '🇮🇪' },
  { name: 'Israel', code: 'IL', dialCode: '+972', flag: '🇮🇱' },
  { name: 'Italy', code: 'IT', dialCode: '+39', flag: '🇮🇹' },
  { name: 'Jamaica', code: 'JM', dialCode: '+1-876', flag: '🇯🇲' },
  { name: 'Japan', code: 'JP', dialCode: '+81', flag: '🇯🇵' },
  { name: 'Jordan', code: 'JO', dialCode: '+962', flag: '🇯🇴' },
  { name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪' },
  { name: 'Kuwait', code: 'KW', dialCode: '+965', flag: '🇰🇼' },
  { name: 'Lebanon', code: 'LB', dialCode: '+961', flag: '🇱🇧' },
  { name: 'Liberia', code: 'LR', dialCode: '+231', flag: '🇱🇷' },
  { name: 'Madagascar', code: 'MG', dialCode: '+261', flag: '🇲🇬' },
  { name: 'Malaysia', code: 'MY', dialCode: '+60', flag: '🇲🇾' },
  { name: 'Mali', code: 'ML', dialCode: '+223', flag: '🇲🇱' },
  { name: 'Mexico', code: 'MX', dialCode: '+52', flag: '🇲🇽' },
  { name: 'Morocco', code: 'MA', dialCode: '+212', flag: '🇲🇦' },
  { name: 'Mozambique', code: 'MZ', dialCode: '+258', flag: '🇲🇿' },
  { name: 'Nepal', code: 'NP', dialCode: '+977', flag: '🇳🇵' },
  { name: 'Netherlands', code: 'NL', dialCode: '+31', flag: '🇳🇱' },
  { name: 'New Zealand', code: 'NZ', dialCode: '+64', flag: '🇳🇿' },
  { name: 'Nicaragua', code: 'NI', dialCode: '+505', flag: '🇳🇮' },
  { name: 'Niger', code: 'NE', dialCode: '+227', flag: '🇳🇪' },
  { name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬' },
  { name: 'Norway', code: 'NO', dialCode: '+47', flag: '🇳🇴' },
  { name: 'Oman', code: 'OM', dialCode: '+968', flag: '🇴🇲' },
  { name: 'Pakistan', code: 'PK', dialCode: '+92', flag: '🇵🇰' },
  { name: 'Panama', code: 'PA', dialCode: '+507', flag: '🇵🇦' },
  { name: 'Paraguay', code: 'PY', dialCode: '+595', flag: '🇵🇾' },
  { name: 'Peru', code: 'PE', dialCode: '+51', flag: '🇵🇪' },
  { name: 'Philippines', code: 'PH', dialCode: '+63', flag: '🇵🇭' },
  { name: 'Poland', code: 'PL', dialCode: '+48', flag: '🇵🇱' },
  { name: 'Portugal', code: 'PT', dialCode: '+351', flag: '🇵🇹' },
  { name: 'Qatar', code: 'QA', dialCode: '+974', flag: '🇶🇦' },
  { name: 'Romania', code: 'RO', dialCode: '+40', flag: '🇷🇴' },
  { name: 'Rwanda', code: 'RW', dialCode: '+250', flag: '🇷🇼' },
  { name: 'Saudi Arabia', code: 'SA', dialCode: '+966', flag: '🇸🇦' },
  { name: 'Senegal', code: 'SN', dialCode: '+221', flag: '🇸🇳' },
  { name: 'Sierra Leone', code: 'SL', dialCode: '+232', flag: '🇸🇱' },
  { name: 'South Africa', code: 'ZA', dialCode: '+27', flag: '🇿🇦' },
  { name: 'Spain', code: 'ES', dialCode: '+34', flag: '🇪🇸' },
  { name: 'Sri Lanka', code: 'LK', dialCode: '+94', flag: '🇱🇰' },
  { name: 'Tanzania', code: 'TZ', dialCode: '+255', flag: '🇹🇿' },
  { name: 'Uganda', code: 'UG', dialCode: '+256', flag: '🇺🇬' },
  { name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧' },
  { name: 'United States', code: 'US', dialCode: '+1', flag: '🇺🇸' },
  { name: 'Zambia', code: 'ZM', dialCode: '+260', flag: '🇿🇲' },
  { name: 'Zimbabwe', code: 'ZW', dialCode: '+263', flag: '🇿🇼' }
])

const filteredCountries = computed(() => {
  if (!countrySearchQuery.value) return countries.value
  const q = countrySearchQuery.value.toLowerCase()
  return countries.value.filter(c => 
    c.name.toLowerCase().includes(q) || 
    c.code.toLowerCase().includes(q) || 
    c.dialCode.includes(q)
  )
})

const openCountryModal = () => {
  isModalOpen.value = true
  nextTick(() => {
    if (searchInputRef.value) searchInputRef.value.focus()
  })
}

const closeCountryModal = () => {
  isModalOpen.value = false
  countrySearchQuery.value = ''
}

const selectCountry = (country) => {
  selectedCountry.value = country
  closeCountryModal()
}

const handleStartTopup = () => {
  if (selectedCountry.value) {
    alert(`Proceeding to top-up for ${selectedCountry.value.name} (${selectedCountry.value.dialCode})`)
  }
}

// ❓ Expanded 15 FAQ Questions & Answers
const faqData = ref([
  {
    question: "What is SwyChr?",
    answer: [
      "SwyChr is a leading global fintech platform designed for fast, borderless digital top-ups and financial connectivity.",
      "With SwyChr, you can instantly buy mobile top-ups for your own phone or send a prepaid mobile recharge online to friends and family across the globe."
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
      "It only takes three simple steps: select your destination country, enter the target phone number, select your desired top-up package, and complete payment."
    ]
  },
  {
    question: "Can I also send data bundles?",
    answer: [
      "Yes! Depending on the regional mobile operator assigned to the network line number you input, you can choose to send standard airtime credits or specific data-bundle packages."
    ]
  },
  {
    question: "How fast is the airtime delivered?",
    answer: [
      "Most top-ups are processed and delivered instantly in less than 10 seconds. The recipient receives a text message confirmation directly from their mobile operator."
    ]
  },
  {
    question: "What payment methods are supported?",
    answer: [
      "We accept all major credit and debit cards (Visa, Mastercard, American Express), digital wallets, and local bank payment methods depending on your region."
    ]
  },
  {
    question: "Are there any hidden fees when sending top-ups?",
    answer: [
      "No. SwyChr practices 100% rate transparency. The total amount displayed during checkout is the final cost—there are no extra hidden charges."
    ]
  },
  {
    question: "What happens if I enter the wrong phone number?",
    answer: [
      "Because top-ups are processed automatically with mobile carriers in real-time, completed transfers cannot be reversed. Please double-check the recipient phone number before confirming payment."
    ]
  },
  {
    question: "Do I need to create an account to send a top-up?",
    answer: [
      "You can complete guest top-ups instantly, but creating a free SwyChr account allows you to save recipient contacts, view transaction history, and earn loyalty rewards."
    ]
  },
  {
    question: "Which mobile operators are supported?",
    answer: [
      "We connect directly with over 600 global mobile carriers including MTN, Airtel, Orange, Vodafone, Digicel, Safaricom, Globe, Telcel, and T-Mobile."
    ]
  },
  {
    question: "Can I set up automatic recurring top-ups?",
    answer: [
      "Yes! Inside the official SwyChr mobile app, you can schedule weekly or monthly automated recharges so your loved ones never run out of data or airtime."
    ]
  },
  {
    question: "Is my payment information safe on SwyChr?",
    answer: [
      "Yes. SwyChr utilizes 256-bit SSL encryption and strict PCI-DSS banking compliance standards to ensure all financial credentials remain completely protected."
    ]
  },
  {
    question: "What should I do if the recipient did not receive their top-up?",
    answer: [
      "First check your email receipt to verify the phone number. If correct, wait 5 minutes for carrier network delays. If still unreceived, contact our 24/7 support team with your reference ID."
    ]
  },
  {
    question: "How do I contact SwyChr customer support?",
    answer: [
      "You can reach our 24/7 support team anytime via live chat inside our app, through the Help page, or by emailing support@swychr.com."
    ]
  }
])
</script>

<style scoped>
.home-view-wrapper {
  font-family: 'Montserrat', sans-serif;
  color: #1a1a2e;
}

.full-bleed-hero {
  background: linear-gradient(135deg, #0f0c20 0%, #2a114d 100%);
  color: #ffffff;
  padding: 80px 20px;
  display: flex;
  justify-content: center;
}

.hero-container {
  max-width: 1100px;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 40px;
}

.text-block {
  max-width: 500px;
}

.badge {
  background: rgba(255, 255, 255, 0.12);
  color: #b042c9;
  padding: 6px 14px;
  border-radius: 100px;
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
}

.text-block h1 {
  font-size: 2.5rem;
  font-weight: 800;
  margin: 16px 0;
  line-height: 1.2;
}

.hero-subtitle {
  font-size: 1.05rem;
  color: rgba(255, 255, 255, 0.85);
  line-height: 1.6;
}

/* ── Destination Selector Card ─────────────────────────────────── */
.topup-card {
  background: #ffffff;
  padding: 2rem;
  border-radius: 24px;
  width: 100%;
  max-width: 460px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
  color: #1a1a2e;
}

.card-header {
  margin-bottom: 12px;
  text-align: left;
}

.section-label {
  font-size: 0.75rem;
  font-weight: 800;
  letter-spacing: 0.08em;
  color: #8e8e93;
}

.destination-select-box {
  display: flex;
  align-items: center;
  gap: 14px;
  background: #f8fafc;
  border: 1.5px solid #e2e8f0;
  border-radius: 16px;
  padding: 14px 18px;
  cursor: pointer;
  margin-bottom: 20px;
  transition: border-color 0.2s, background 0.2s;
}

.destination-select-box:hover {
  border-color: #b042c9;
  background: #ffffff;
}

.dest-icon-wrapper {
  width: 42px;
  height: 42px;
  background: #f1f5f9;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.4rem;
  flex-shrink: 0;
}

.dest-info {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  text-align: left;
}

.dest-info small {
  font-size: 0.75rem;
  color: #64748b;
  font-weight: 600;
}

.dest-info strong {
  font-size: 0.95rem;
  color: #0f172a;
}

.placeholder-text {
  font-size: 0.9rem;
  color: #94a3b8;
}

.dropdown-chevron {
  color: #94a3b8;
  font-size: 0.75rem;
}

.cta-button {
  width: 100%;
  padding: 14px;
  border-radius: 100px;
  border: none;
  background: #8c1bc1;
  color: #ffffff;
  font-weight: 700;
  font-size: 1rem;
  cursor: pointer;
  transition: opacity 0.2s;
}

.cta-button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* ── FAQ Section ─────────────────────────────────────────────── */
.faq-section {
  padding: 60px 20px;
  background: #fafafa;
}

.container {
  max-width: 850px;
  margin: 0 auto;
}

.section-heading {
  text-align: center;
  font-size: 1.8rem;
  margin-bottom: 30px;
}

.faq-item {
  background: #ffffff;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 16px 20px;
  margin-bottom: 12px;
  cursor: pointer;
}

.faq-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.faq-header h3 {
  font-size: 1.05rem;
  margin: 0;
  color: #8c1bc1;
}

.faq-body {
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid #f0e6f5;
  color: #555;
  font-size: 0.92rem;
  line-height: 1.6;
}

/* ── Modal Overlay & Card ─────────────────────────────────────── */
.country-modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(15, 23, 42, 0.5);
  backdrop-filter: blur(4px);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  padding: 20px;
}

.country-modal-card {
  background: #ffffff;
  width: 100%;
  max-width: 480px;
  border-radius: 24px;
  padding: 24px;
  box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
  max-height: 80vh;
  display: flex;
  flex-direction: column;
}


.country-flag-img {
  width: 28px;
  height: 20px;
  object-fit: cover;
  border-radius: 3px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
  flex-shrink: 0;
}


.modal-handle-bar {
  width: 36px;
  height: 4px;
  background: #cbd5e1;
  border-radius: 100px;
  margin: 0 auto 16px;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.modal-header h3 {
  font-size: 1.2rem;
  font-weight: 700;
  margin: 0;
}

.close-modal-btn {
  background: #f1f5f9;
  border: none;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  cursor: pointer;
}

.modal-search-wrapper {
  position: relative;
  margin-bottom: 16px;
}

.search-lens {
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
}

.modal-search-input {
  width: 100%;
  padding: 12px 14px 12px 40px;
  border-radius: 12px;
  border: 1px solid #e2e8f0;
  background: #f8fafc;
  outline: none;
  box-sizing: border-box;
}

.country-list-scroll {
  overflow-y: auto;
  display: flex;
  flex-direction: column;
}

.country-item-row {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 12px;
  border-radius: 10px;
  cursor: pointer;
}

.country-item-row:hover {
  background: #f8fafc;
}

.country-flag {
  font-size: 1.4rem;
}

.country-meta {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

.country-name {
  font-size: 0.95rem;
  font-weight: 600;
}

.country-code {
  font-size: 0.75rem;
  color: #94a3b8;
}

/* 📱 Mobile Layout Rules */
@media (max-width: 820px) {
  .hero-container {
    flex-direction: column;
    text-align: center;
  }

  .text-block h1 {
    font-size: 1.8rem;
  }
}
</style>