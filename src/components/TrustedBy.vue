<script setup lang="ts">
import { onMounted } from 'vue'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const companies = [
  {
    name: 'Dwell App',
    logo: '/companies/dwell_companies_logo.png'
  },
  {
    name: 'Gustave Games',
    logo: '/companies/gustave_companies_logo.png'
  },
  {
    name: 'Simon Kucher',
    logo: '/companies/simon_kucher_companies_logo.png'
  },
  {
    name: 'Conversium',
    logo: '/companies/conversium_companies_logo.png'
  }
]

onMounted(() => {
  gsap.from('.company-logo', {
    scrollTrigger: {
      trigger: '.trusted-section',
      start: 'top center',
    },
    y: 20,
    opacity: 0,
    duration: 0.6,
    stagger: 0.1,
    ease: 'power2.out'
  })
})
</script>

<template>
  <section class="trusted-section py-16 md:py-24 bg-beige-100">
    <div class="container mx-auto px-4 sm:px-6 max-w-6xl">
      <h2 class="text-center text-xl md:text-2xl font-medium text-dark-700 mb-12">
        Ils m'ont fait confiance
      </h2>
      
      <div class="flex flex-wrap justify-center items-center gap-8 md:gap-16">
        <div v-for="company in companies" 
             :key="company.name"
             class="company-logo w-32 md:w-40 h-20 relative group">
          <img :src="company.logo" 
               :alt="company.name"
               class="w-full h-full object-contain grayscale opacity-70 group-hover:grayscale-0 group-hover:opacity-100 transition-all duration-300" />
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.company-logo img {
  filter: grayscale(100%);
}

.company-logo:hover img {
  filter: grayscale(0%);
}
</style> 