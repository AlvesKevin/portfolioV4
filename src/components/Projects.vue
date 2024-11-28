<script setup lang="ts">
import { onMounted } from 'vue'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const projects = [
  {
    title: 'Extraction d\'Artisans',
    description: 'Extraction et qualification de 14 000 contacts d\'artisans en rénovation énergétique',
    image: '/projects/artisans.png',
    tags: ['Python', 'MongoDB', 'Data Mining'],
    metrics: ['14k+ contacts extraits']
  },
  {
    title: 'API Immobilière',
    description: 'Développement d\'une API de scraping pour les annonces immobilières (projet Dwell)',
    image: '/projects/dwell.png',
    tags: ['FastAPI', 'Docker'],
    metrics: ['150k+ annonces', 'Temps réel', 'Multi-sources']
  },
  {
    title: 'Amazon Product API',
    description: 'API d\'extraction de produits Amazon avec rotation de proxies et anti-détection',
    image: '/projects/amazon.png',
    tags: ['Python', 'FastAPI'],
    metrics: ['5000+ produits extraits']
  },
  {
    title: 'Scraping Hôtelier International',
    description: 'Script de scraping pour l\'extraction de tarifs hôteliers à l\'échelle mondiale, couvrant plusieurs pays dont la Chine, la France et l\'Italie',
    image: '/projects/hotel.png',
    tags: ['Python', 'Selenium', 'ChromeDriver'],
    metrics: ['56k+ tarifs', '10+ pays', 'Multi-devises', 'Multi-filtres']
  }
]

onMounted(() => {
  gsap.from('.project-card', {
    scrollTrigger: {
      trigger: '.projects-section',
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
  <section id="projets" class="projects-section py-12 md:py-20 relative">
    <div class="container mx-auto px-4 sm:px-6 max-w-6xl">
      <h2 class="heading-huge mb-8 md:mb-16 text-center md:text-left">
        Projets<span class="text-neon">.</span>
      </h2>
      
      <div class="grid sm:grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
        <div v-for="(project, index) in projects" 
             :key="index"
             class="project-card group">
          <div class="relative aspect-video mb-4 md:mb-6 overflow-hidden bg-beige-100">
            <div class="absolute inset-0 bg-gradient-to-t from-beige-50 to-transparent z-10"></div>
            <img :src="project.image" 
                 :alt="project.title"
                 class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
          </div>
          
          <h3 class="text-xl md:text-2xl font-display font-bold mb-2 md:mb-3 text-dark-900">{{ project.title }}</h3>
          <p class="text-dark-700 mb-4 text-sm md:text-base">{{ project.description }}</p>
          
          <div class="flex flex-wrap gap-2 mb-4">
            <span v-for="(tag, tIndex) in project.tags" 
                  :key="tIndex"
                  class="px-2 py-1 md:px-3 bg-beige-100 text-xs md:text-sm text-dark-900">
              {{ tag }}
            </span>
          </div>
          
          <div class="flex flex-wrap gap-3 md:gap-4">
            <div v-for="(metric, mIndex) in project.metrics" 
                 :key="mIndex"
                 class="text-xs md:text-sm text-dark-700">
              {{ metric }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>