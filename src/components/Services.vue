<script setup lang="ts">
import { onMounted } from 'vue'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const services = [
  {
    icon: '🔍',
    title: 'Web Scraping & Extraction',
    description: 'Extraction de données à grande échelle avec des solutions personnalisées et performantes.',
    features: ['Scraping multi-sources', 'Respect des robots.txt', 'Proxy rotation', 'Data cleaning']
  },
  {
    icon: '🎯',
    title: 'Génération de Leads',
    description: 'Identification et extraction de contacts qualifiés pour votre business.',
    features: ['Données vérifiées', 'Enrichissement', 'Export personnalisé', 'Mise à jour régulière']
  },
  {
    icon: '⚡',
    title: 'Automatisation',
    description: 'Solutions d\'automatisation sur mesure pour optimiser vos processus.',
    features: ['Workflows personnalisés', 'Intégration API', 'Monitoring', 'Maintenance']
  }
]

onMounted(() => {
  gsap.from('.service-card', {
    scrollTrigger: {
      trigger: '.services-section',
      start: 'top center',
    },
    y: 60,
    opacity: 0,
    duration: 0.8,
    stagger: 0.2,
    ease: 'power3.out'
  })
})
</script>

<template>
  <section id="services" class="services-section py-20 relative">
    <div class="container mx-auto px-6 max-w-6xl">
      <h2 class="heading-huge mb-16">
        Services<span class="text-neon">.</span>
      </h2>
      
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="(service, index) in services" 
             :key="index"
             class="service-card bg-beige-100 p-8 border border-beige-200 hover:border-dark-900/50 transition-colors">
          <div class="text-4xl mb-6">{{ service.icon }}</div>
          <h3 class="text-2xl font-display font-bold mb-4">{{ service.title }}</h3>
          <p class="text-dark-700 mb-6">{{ service.description }}</p>
          <ul class="space-y-2">
            <li v-for="(feature, fIndex) in service.features" 
                :key="fIndex"
                class="flex items-center gap-2 text-sm text-dark-700">
              <span class="w-1 h-1 bg-dark-900 rounded-full"></span>
              {{ feature }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>