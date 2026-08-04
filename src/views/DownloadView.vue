<template>
  <div class="download-page">
    <!-- Hero Download Section -->
    <section class="download-hero">
      <div class="container hero-grid">
        <div class="hero-content">
          <span class="app-badge">📱 Official Mobile App</span>
          <h1>Get SwyChr hub On Your Mobile Device</h1>
          <p class="hero-desc">
            Send airtime, bundle data, and top up mobile numbers globally in seconds. Enjoy exclusive in-app discounts, automated recurring top-ups, and instant notifications.
          </p>

          <!-- Store Buttons -->
          <div class="store-buttons">
            <a href="https://urlgeni.us/swychr" target="_blank" rel="noopener" class="store-btn ios">
              <span class="store-icon">🍏</span>
              <div class="store-text">
                <small>Download on the</small>
                <strong>App Store</strong>
              </div>
            </a>

            <a href="https://urlgeni.us/swychr" target="_blank" rel="noopener" class="store-btn android">
              <span class="store-icon">🤖</span>
              <div class="store-text">
                <small>GET IT ON</small>
                <strong>Google Play</strong>
              </div>
            </a>
          </div>

          <!-- Quick QR Code Option -->
          <div class="qr-box">
            <img 
              src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://urlgeni.us/swychr" 
              alt="Scan to Download SwyChrairtime" 
              class="qr-img"
            />
            <div class="qr-text">
              <h4>Scan to download</h4>
              <p>Point your smartphone camera to install directly from your app store.</p>
            </div>
          </div>
        </div>

        <!-- Phone Mockup Frame -->
        <div class="hero-mockup">
          <div class="mockup-card">
            <div class="mockup-header">
              <span class="status-dot"></span>
              <span class="mockup-title">SwyChr hub  App</span>
            </div>
            <div class="mockup-body">
              <div class="app-screen-item highlight">
                <span>⚡ Instant Top-Up</span>
                <strong>600+ Operators</strong>
              </div>
              <div class="app-screen-item">
                <span>🌍 Global Reach</span>
                <strong>150+ Countries</strong>
              </div>
              <div class="app-screen-item">
                <span>🔒 Secure Checkout</span>
                <strong>Encrypted Payment</strong>
              </div>
              <div class="app-screen-action">
                <span>Download App Now</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- App Highlights Grid -->
    <section class="app-highlights">
      <div class="container">
        <h2 class="section-title">Built for Speed and Convenience</h2>
        <div class="highlights-grid">
          <div class="highlight-card">
            <div class="h-icon">🚀</div>
            <h3>1-Tap Recharges</h3>
            <p>Save your favorite contacts and repeat frequent top-ups with a single tap.</p>
          </div>

          <div class="highlight-card">
            <div class="h-icon">🔔</div>
            <h3>Live Status Alerts</h3>
            <p>Get instant push notifications the exact millisecond your top-up lands on the destination phone.</p>
          </div>

          <div class="highlight-card">
            <div class="h-icon">💳</div>
            <h3>Multi-Currency Pay</h3>
            <p>Pay smoothly using credit cards, debit cards, bank transfers, or mobile wallets.</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
</script>

<style scoped>
.download-page {
  font-family: 'Montserrat', sans-serif;
  color: #1a1a2e;
  background-color: #fafafa;
}

.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 20px;
}

/* ── Hero Section ───────────────────────────────────── */
.download-hero {
  background: linear-gradient(135deg, #0f0c20 0%, #2a114d 100%);
  color: #ffffff;
  padding: 70px 0 90px;
}

.hero-grid {
  display: grid;
  grid-template-columns: 1.2fr 0.8fr;
  gap: 50px;
  align-items: center;
}

.app-badge {
  background: rgba(255, 255, 255, 0.12);
  color: #00e676;
  padding: 6px 16px;
  border-radius: 100px;
  font-size: 0.8rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  display: inline-block;
  margin-bottom: 16px;
}

.hero-content h1 {
  font-size: 2.4rem;
  font-weight: 800;
  line-height: 1.25;
  margin-bottom: 16px;
}

.hero-desc {
  font-size: 1.05rem;
  color: rgba(255, 255, 255, 0.85);
  line-height: 1.6;
  margin-bottom: 30px;
}

/* ── Store Buttons ────────────────────────────────── */
.store-buttons {
  display: flex;
  gap: 16px;
  margin-bottom: 30px;
  flex-wrap: wrap;
}

.store-btn {
  display: flex;
  align-items: center;
  gap: 12px;
  background: #ffffff;
  color: #1a1a2e;
  padding: 12px 22px;
  border-radius: 14px;
  text-decoration: none;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15);
  transition: transform 180ms ease, box-shadow 180ms ease;
}

.store-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 22px rgba(0, 0, 0, 0.25);
}

.store-icon {
  font-size: 1.8rem;
}

.store-text {
  display: flex;
  flex-direction: column;
}

.store-text small {
  font-size: 0.68rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: #666;
}

.store-text strong {
  font-size: 1rem;
  font-weight: 800;
}

/* ── QR Code Component ────────────────────────────── */
.qr-box {
  display: flex;
  align-items: center;
  gap: 16px;
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.15);
  padding: 14px;
  border-radius: 14px;
  max-width: 380px;
}

.qr-img {
  width: 70px;
  height: 70px;
  border-radius: 8px;
  background: #fff;
  padding: 4px;
}

.qr-text h4 {
  font-size: 0.95rem;
  margin: 0 0 4px;
  color: #ffffff;
}

.qr-text p {
  font-size: 0.8rem;
  color: rgba(255, 255, 255, 0.7);
  margin: 0;
  line-height: 1.4;
}

/* ── Mockup Frame ─────────────────────────────────── */
.hero-mockup {
  display: flex;
  justify-content: center;
}

.mockup-card {
  width: 100%;
  max-width: 300px;
  background: #ffffff;
  border-radius: 24px;
  padding: 20px;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
  color: #1a1a2e;
}

.mockup-header {
  display: flex;
  align-items: center;
  gap: 8px;
  padding-bottom: 14px;
  border-bottom: 1px solid #eee;
  margin-bottom: 16px;
}

.status-dot {
  width: 10px;
  height: 10px;
  background: #00e676;
  border-radius: 50%;
}

.mockup-title {
  font-weight: 700;
  font-size: 0.85rem;
}

.mockup-body {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.app-screen-item {
  background: #faf5ff;
  border: 1px solid #f0d8ff;
  padding: 14px;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
}

.app-screen-item.highlight {
  background: #f3e8ff;
  border-color: #8c1bc1;
}

.app-screen-item span {
  font-size: 0.75rem;
  color: #666;
}

.app-screen-item strong {
  font-size: 0.95rem;
  color: #8c1bc1;
}

.app-screen-action {
  background: #8c1bc1;
  color: #ffffff;
  text-align: center;
  padding: 12px;
  border-radius: 100px;
  font-weight: 700;
  font-size: 0.85rem;
  margin-top: 6px;
}

/* ── Highlights ───────────────────────────────────── */
.app-highlights {
  padding: 70px 0;
}

.section-title {
  text-align: center;
  font-size: 1.8rem;
  margin-bottom: 40px;
}

.highlights-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.highlight-card {
  background: #ffffff;
  padding: 28px;
  border-radius: 18px;
  border: 1px solid #eee;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.03);
}

.h-icon {
  font-size: 2rem;
  margin-bottom: 12px;
}

.highlight-card h3 {
  font-size: 1.15rem;
  color: #8c1bc1;
  margin-bottom: 8px;
}

.highlight-card p {
  color: #555;
  font-size: 0.9rem;
  line-height: 1.5;
  margin: 0;
}

/* 📱 Mobile Responsiveness */
@media (max-width: 820px) {
  .hero-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .hero-content h1 {
    font-size: 1.8rem;
  }

  .highlights-grid {
    grid-template-columns: 1fr;
  }

  .qr-box {
    max-width: 100%;
  }
}
</style>