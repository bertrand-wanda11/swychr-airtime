<template>
  <div class="about-page">
    <!-- Hero Section -->
    <section class="about-hero">
      <div class="container">
        <span class="hero-badge">About SwyChrairtime</span>
        <h1>Connecting Loved Ones, Across Borders in Seconds</h1>
        <p class="hero-sub">
          SwyChrairtime powers instant global mobile top-ups and data refills, enabling families, businesses, and communities to stay seamlessly connected worldwide.
        </p>
      </div>
    </section>

    <!-- Stats Grid -->
    <section class="stats-section">
      <div class="container stats-grid">
        <div class="stat-card">
          <h2>150+</h2>
          <p>Countries Supported</p>
        </div>
        <div class="stat-card">
          <h2>600+</h2>
          <p>Mobile Operators</p>
        </div>
        <div class="stat-card">
          <h2>&lt; 10s</h2>
          <p>Instant Delivery</p>
        </div>
        <div class="stat-card">
          <h2>99.9%</h2>
          <p>Success Rate</p>
        </div>
      </div>
    </section>

    <!-- Mission & Vision -->
    <section class="mission-section">
      <div class="container grid-2">
        <div class="mission-card">
          <div class="icon">🚀</div>
          <h3>Our Mission</h3>
          <p>
            To eliminate the friction of cross-border communication by delivering affordable, instant, and reliable airtime and data recharges everywhere.
          </p>
        </div>
        <div class="mission-card">
          <div class="icon">🌍</div>
          <h3>Our Vision</h3>
          <p>
            A digitally inclusive world where staying in touch with loved ones or powering business operations across emerging markets requires zero effort.
          </p>
        </div>
      </div>
    </section>

    <!-- Why Choose Us -->
    <section class="why-us-section">
      <div class="container">
        <h2 class="section-title">Why Millions Trust SwyChrairtime</h2>
        <div class="features-grid">
          <div class="feature-item">
            <div class="feat-icon">⚡</div>
            <h4>Lightning-Fast Delivery</h4>
            <p>Our direct API integrations with global telecom networks ensure your recipient gets value instantly.</p>
          </div>
          <div class="feature-item">
            <div class="feat-icon">🛡️</div>
            <h4>Bank-Grade Security</h4>
            <p>Every transaction is protected by end-to-end encryption and compliance standards.</p>
          </div>
          <div class="feature-item">
            <div class="feat-icon">💎</div>
            <h4>Zero Hidden Fees</h4>
            <p>Complete rate transparency. What you see during checkout is exactly what your recipient receives.</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
</script>

<style scoped>
.about-page {
  font-family: 'Montserrat', sans-serif;
  color: #1a1a2e;
  background-color: #fafafa;
}

.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 20px;
}

/* ── Hero ───────────────────────────────────────────── */
.about-hero {
  background: linear-gradient(135deg, #0f0c20 0%, #2a114d 100%);
  color: #ffffff;
  padding: 80px 0 60px;
  text-align: center;
}

.hero-badge {
  background: rgba(255, 255, 255, 0.12);
  color: #00e676;
  padding: 6px 16px;
  border-radius: 100px;
  font-size: 0.8rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.about-hero h1 {
  font-size: 2.5rem;
  font-weight: 800;
  margin: 20px 0 16px;
  line-height: 1.2;
}

.hero-sub {
  font-size: 1.1rem;
  color: rgba(255, 255, 255, 0.85);
  max-width: 720px;
  margin: 0 auto;
  line-height: 1.6;
}

/* ── Stats ──────────────────────────────────────────── */
.stats-section {
  margin-top: -30px;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.stat-card {
  background: #ffffff;
  padding: 24px;
  border-radius: 16px;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
  border: 1px solid #f0e6f5;
}

.stat-card h2 {
  font-size: 2.2rem;
  color: #8c1bc1;
  margin-bottom: 4px;
  font-weight: 800;
}

.stat-card p {
  color: #666666;
  font-size: 0.9rem;
  font-weight: 600;
  margin: 0;
}

/* ── Mission & Vision ───────────────────────────────── */
.mission-section {
  padding: 70px 0;
}

.grid-2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
}

.mission-card {
  background: #ffffff;
  padding: 36px;
  border-radius: 20px;
  border: 1px solid #f0d8ff;
}

.mission-card .icon {
  font-size: 2.2rem;
  margin-bottom: 12px;
}

.mission-card h3 {
  font-size: 1.4rem;
  color: #8c1bc1;
  margin-bottom: 12px;
}

.mission-card p {
  color: #555555;
  line-height: 1.6;
  margin: 0;
}

/* ── Features ────────────────────────────────────────── */
.why-us-section {
  padding: 20px 0 80px;
}

.section-title {
  text-align: center;
  font-size: 1.8rem;
  margin-bottom: 40px;
  color: #1a1a2e;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.feature-item {
  background: #ffffff;
  padding: 28px;
  border-radius: 16px;
  border: 1px solid #eee;
  transition: transform 200ms ease;
}

.feature-item:hover {
  transform: translateY(-4px);
}

.feat-icon {
  font-size: 1.8rem;
  margin-bottom: 12px;
}

.feature-item h4 {
  font-size: 1.1rem;
  margin-bottom: 8px;
  color: #1a1a2e;
}

.feature-item p {
  color: #666666;
  font-size: 0.9rem;
  line-height: 1.5;
  margin: 0;
}

/* 📱 Responsive Mobile Overrides */
@media (max-width: 820px) {
  .about-hero h1 {
    font-size: 1.8rem;
  }

  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .grid-2, .features-grid {
    grid-template-columns: 1fr;
  }
}
</style>
