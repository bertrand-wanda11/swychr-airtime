<template>
  <div class="home-view-wrapper">
    <!-- Hero Section -->
    <section class="full-bleed-hero">
      <div class="hero-container">
        <!-- Hero Text Column -->
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
              <span v-if="selectedCountry" class="flag-icon">{{ selectedCountry.flag }}</span>
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
              <span class="country-flag">{{ country.flag }}</span>
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

const currentTab = ref('topup')
const openFaqIndex = ref(null)

function toggleFaq(index) {
  openFaqIndex.value = openFaqIndex.value === index ? null : index
}

// ── Country Selector Modal State ──────────────────────────────────────────
const isModalOpen = ref(false)
const countrySearchQuery = ref('')
const selectedCountry = ref(null)
const searchInputRef = ref(null)

const countries = ref([
  { name: 'Afghanistan', code: 'AF', dialCode: '+93', flag: '🇦🇫' },
  { name: 'Albania', code: 'AL', dialCode: '+355', flag: '🇦🇱' },
  { name: 'Algeria', code: 'DZ', dialCode: '+213', flag: '🇩🇿' },
  { name: 'Cameroon', code: 'CM', dialCode: '+237', flag: '🇨🇲' },
  { name: 'Ghana', code: 'GH', dialCode: '+233', flag: '🇬🇭' },
  { name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪' },
  { name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬' },
  { name: 'South Africa', code: 'ZA', dialCode: '+27', flag: '🇿🇦' },
  { name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧' },
  { name: 'United States', code: 'US', dialCode: '+1', flag: '🇺🇸' }
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
      "An international top-up is a service that allows you to send mobile credit or data balances to a phone line registered in a completely different country."
    ]
  },
  {
    question: "Can I send mobile recharges from abroad?",
    answer: [
      "Yes, absolutely! SwyChr is built exactly for cross-border needs. You can safely send a top-up balance to over 140 supported global destinations in seconds."
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
  color: #00e676;
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