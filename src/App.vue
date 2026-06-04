<template>
  <div class="site-wrapper" @click="closeAllDropdowns">
    <header class="navbar">
      <div class="nav-container">
        <div class="logo">SwyChr</div>

     
        <button class="hamburger" @click.stop="toggleMobileMenu" :class="{ 'is-active': isMenuOpen }">
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
        </button>

    
        <nav class="nav-menu" :class="{ 'mobile-open': isMenuOpen }" @click.stop>
          
          
          <div class="dropdown">
            <button class="dropbtn" @click.stop="toggleDropdown('topup')">
              Send top-up <span class="arrow">▼</span>
            </button>
            <div class="dropdown-content" :class="{ show: activeDropdown === 'topup' }">
              <a href="#">Airtime</a>
              <a href="#">Data Bundles</a>
            </div>
          </div>

    
          <div class="dropdown">
            <button class="dropbtn" @click.stop="toggleDropdown('vouchers')">
              Gift Cards <span class="badge">soon</span> <span class="arrow">▼</span>
            </button>
            <div class="dropdown-content" :class="{ show: activeDropdown === 'vouchers' }">
              <a href="#">Gaming Vouchers</a>
              <a href="#">Gift Cards</a>
              <a href="#">Streaming Passes</a>
            </div>
          </div>

     
          <div class="dropdown">
            <button class="dropbtn" @click.stop="toggleDropdown('company')">
              Company <span class="arrow">▼</span>
            </button>
            <div class="dropdown-content" :class="{ show: activeDropdown === 'company' }">
              <a href="https://swychr.com/About">About Us</a>
              <a href="https://swychr.com/Career">Careers</a>
            </div>
          </div>

          <a href="https://swychr.com/support" class="nav-link">Help</a>

   
          <div class="dropdown">
            <button class="dropbtn" @click.stop="toggleDropdown('lang')">
              🌐 EN <span class="arrow">▼</span>
            </button>
            <div class="dropdown-content language-menu" :class="{ show: activeDropdown === 'lang' }">
              <a href="#">English</a>
              <a href="#">Français</a>
              <a href="#">Español</a>
            </div>
          </div>

        </nav>
      </div>
    </header>

    <main class="main-content">
      <RouterView />
    </main>

    <footer class="site-footer">
      <div class="footer-top-columns">
        
        <div class="footer-brand-col">
          <div class="footer-logo">SwyChr</div>
          <p class="footer-tagline">A little goes a long way <span class="sparkle-icon">✨</span></p>
          
          <div class="social-icons-row">
            <a href="https://www.facebook.com/login/?next=https%3A%2F%2Fweb.facebook.com%2Fswychrglobal&_rdc=1&_rdr#" class="social-link" aria-label="Facebook">
              <svg viewBox="0 0 24 24" class="icon-svg"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1V12h3l-.5 3h-2.5v6.8c4.56-.93 8-4.96 8-9.8z"/></svg>
            </a>
            <a href="https://x.com/swychrglobal?mx=2" class="social-link" aria-label="Twitter">
              <svg viewBox="0 0 24 24" class="icon-svg"><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
            </a>
            <a href="https://www.instagram.com/swychrglobal" class="social-link" aria-label="Instagram">
              <svg viewBox="0 0 24 24" class="icon-svg"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg>
            </a>
            <a href="https://www.linkedin.com/company/swychrglobal/posts/?feedView=all&viewAsMember=true" class="social-link" aria-label="LinkedIn">
              <svg viewBox="0 0 24 24" class="icon-svg"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>
            </a>
          </div>
        </div>

        <div class="footer-links-col">
          <h3 class="col-title">Company</h3>
          <ul class="links-list">
            <li><a href="https://swychr.com/About">About us</a></li>
            <li><a href="https://swychr.com/Career">Careers</a></li>
          </ul>
        </div>

        <div class="footer-links-col">
          <h3 class="col-title">Legal</h3>
          <ul class="links-list">
            <li><a href="https://swychr.com/Privacy">Privacy notice</a></li>
            <li><a href="https://swychr.com/Term">Terms & conditions</a></li>
          </ul>
        </div>

        <div class="footer-links-col">
          <h3 class="col-title">Help</h3>
          <ul class="links-list">
            <li><a href="https://swychr.com/support">Support centre</a></li>
         
          </ul>
        </div>

      </div>

      <div class="footer-bottom-ribbon">
        <div class="ribbon-container">
          
          <div class="security-info">
            <span class="trustwave-logo">🛡️ Trustwave</span>
            <span class="security-text">Protected by Trustwave. Secure 128-bit SSL Encrypted.</span>
          </div>

          <div class="copyright-statement">
            <p>&copy; SwyChr 2026. All rights reserved.</p>
          </div>

        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const activeDropdown = ref(null)
const isMenuOpen = ref(false)

function toggleDropdown(menuName) {
  activeDropdown.value = activeDropdown.value === menuName ? null : menuName
}

function toggleMobileMenu() {
  isMenuOpen.value = !isMenuOpen.value
  activeDropdown.value = null 
}

function closeAllDropdowns() {
  activeDropdown.value = null
  isMenuOpen.value = false
}
</script>

<style>

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: 'Montserrat', sans-serif !important;
}

.site-wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  width: 100%;
  margin: 0 auto;
}

.main-content {
  flex: 1;
  width: 100%;
  margin: 0 auto;
}

.navbar {
  background-color: #1E293B;
  width: 100%;
  position: relative;
  z-index: 100;
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.2rem 2rem;
}

.logo {
  font-size: 1.8rem;
  font-weight: 800;
  color: #ffffff;
}

.nav-menu {
  display: flex;
  align-items: center;
  gap: 1.5rem;
}

.nav-link, .dropbtn {
  background: none;
  border: none;
  color: rgba(255, 255, 255, 0.9);
  font-size: 0.95rem;
  font-weight: 600;
  text-decoration: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
}

.arrow { font-size: 0.65rem; }
.badge {
  background-color: #d6007d;
  color: white;
  font-size: 0.65rem;
  font-weight: 700;
  padding: 1px 6px;
  border-radius: 10px;
}

.dropdown { position: relative; }
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #ffffff;
  min-width: 200px;
  box-shadow: 0px 8px 16px rgba(0,0,0,0.15);
  border-radius: 8px;
  margin-top: 0.5rem;
  z-index: 110;
}
.dropdown-content.show { display: block; }
.dropdown-content a {
  color: #333333;
  padding: 0.8rem 1.2rem;
  text-decoration: none;
  display: block;
  font-size: 0.9rem;
  font-weight: 500;
}

.signin-btn {
  background: transparent;
  color: #ffffff;
  border: 2px solid rgba(255, 255, 255, 0.7);
  font-weight: 600;
  padding: 0.5rem 1.4rem;
  border-radius: 20px;
  cursor: pointer;
}

/* Hamburger Icon Styles */
.hamburger {
  display: none;
  flex-direction: column;
  justify-content: space-between;
  width: 24px;
  height: 18px;
  background: transparent;
  border: none;
  cursor: pointer;
}
.hamburger .bar {
  width: 100%;
  height: 3px;
  background-color: white;
  transition: all 0.3s ease;
}


@media (max-width: 992px) {
  .hamburger { display: flex; }
  

  .nav-menu {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    background-color: #b042c9;
    flex-direction: column;
    padding: 1.5rem 0;
    gap: 1.2rem;
    box-shadow: 0px 10px 15px rgba(0,0,0,0.1);
  }

  .nav-menu.mobile-open { display: flex; }
  .dropdown-content { position: static; width: 100%; text-align: center; box-shadow: none; background: rgba(255,255,255,0.05); }
  .dropdown-content a { color: white; }
  .nav-link, .dropbtn { width: 100%; justify-content: center; padding: 0.5rem 0; }
  .signin-btn { width: 80%; text-align: center; margin: 0 auto; }
}



.site-footer {
  width: 100%;
  background-color: #ffffff;
  border-top: 1px solid #f1f5f9;
  display: flex;
  flex-direction: column;
}

.footer-top-columns {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 5rem 2rem;
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr 1fr;
  gap: 3rem;
}

.footer-brand-col {
  display: flex;
  flex-direction: column;
}

.footer-logo {
  font-size: 1.8rem;
  font-weight: 800;
  color: #000;
  margin-bottom: 1rem;
}

.footer-tagline {
  font-size: 1.05rem;
  font-weight: 700;
  color: #000;
  margin-bottom: 1.8rem;
  display: flex;
  align-items: center;
  gap: 5px;
}

.sparkle-icon {
  color: #b042c9;
}


.social-icons-row {
  display: flex;
  gap: 1.2rem;
}

.social-link {
  display: block;
  width: 24px;
  height: 24px;
  transition: transform 0.2s ease;
}

.icon-svg {
  width: 100%;
  height: 100%;
  fill: #000;
}

.social-link:hover .icon-svg {
  fill: #b042c9;
}


.footer-links-col {
  display: flex;
  flex-direction: column;
}

.col-title {
  font-size: 1.15rem;
  font-weight: 800;
  color: #000;
  margin-bottom: 1.5rem;
}

.links-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.links-list a {
  text-decoration: none;
  font-size: 1rem;
  font-weight: 600;
  color: #000;
  transition: color 0.15s ease;
}

.links-list a:hover {
   color: #64748b;
}


.footer-bottom-ribbon {
  width: 100%;
  background-color: #1E293B;
  padding: 1.2rem 2rem;
}

.ribbon-container {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.security-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.trustwave-logo {
  font-weight: 800;
  color: #f1f5f9;
  font-size: 0.95rem;
}

.security-text {
  font-size: 0.9rem;
  font-weight: 600;
  color: #f1f5f9;
}

.copyright-statement p {
  font-size: 0.9rem;
  font-weight: 600;
  color: #f1f5f9;
}


@media (max-width: 768px) {
  .footer-top-columns {
    grid-template-columns: 1fr; 
    padding: 3rem 1.5rem;
    gap: 2rem;
    text-align: center;
  }

  .footer-brand-col {
    align-items: center;
    border-bottom: 1px solid #f1f5f9;
    padding-bottom: 1.5rem;
  }

  .social-icons-row {
    justify-content: center;
  }

  .col-title {
    margin-bottom: 0.8rem;
  }

  .links-list {
    gap: 0.8rem;
  }

  .ribbon-container {
    flex-direction: column;
    gap: 0.8rem;
    text-align: center;
  }

  .security-info {
    flex-direction: column;
    gap: 4px;
  }
}
</style>