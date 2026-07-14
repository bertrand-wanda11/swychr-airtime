import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/about',
      name: 'about',
     
      component: () => import('../views/AboutView.vue'),
    },
        {
      path: '/term',
      name: 'term',
     
      component: () => import('../views/TermView.vue'),
    },

         {
      path: '/privacy',
      name: 'privacy',
      component: () => import('../views/PrivacyView.vue'),
    },
    
  ],
})

export default router
