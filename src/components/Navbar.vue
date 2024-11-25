<script setup lang="ts">
import { ref, onMounted } from 'vue'
import gsap from 'gsap'

const isMenuOpen = ref(false)

onMounted(() => {
  gsap.from('.nav-item', {
    y: -20,
    opacity: 0,
    duration: 0.6,
    stagger: 0.1,
    ease: 'power2.out'
  })
})
</script>

<template>
  <nav class="fixed top-0 left-0 w-full z-50 bg-beige-50/80 backdrop-blur-lg border-b border-beige-200">
    <div class="container mx-auto px-6 py-4">
      <div class="flex items-center justify-between">
        <a href="#" class="text-2xl font-display font-bold text-dark-900">
          Kévin<span class="text-neon">.</span>
        </a>
        
        <div class="hidden md:flex items-center gap-8">
          <a v-for="(item, index) in ['Services', 'Projets', 'Temoignages', 'Contact']" 
             :key="index"
             :href="'#' + item.toLowerCase()"
             class="nav-item text-dark-700 hover:text-neon transition-colors">
            {{ item === 'Temoignages' ? 'Témoignages' : item }}
          </a>
          <a href="#contact" class="nav-item btn-neon">
            Démarrer un projet
          </a>
        </div>
        
        <button class="md:hidden text-dark-900" @click="isMenuOpen = !isMenuOpen">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path v-if="!isMenuOpen" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            <path v-else stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>
    
    <div v-if="isMenuOpen" class="md:hidden absolute top-full left-0 w-full bg-beige-100 py-4 border-b border-beige-200">
      <div class="container mx-auto px-6">
        <div class="flex flex-col gap-4">
          <a v-for="(item, index) in ['Services', 'Projets', 'Temoignages', 'Contact']" 
             :key="index"
             :href="'#' + item.toLowerCase()"
             class="text-dark-700 hover:text-neon transition-colors"
             @click="isMenuOpen = false">
            {{ item === 'Temoignages' ? 'Témoignages' : item }}
          </a>
          <a href="#contact" class="btn-neon text-center" @click="isMenuOpen = false">
            Démarrer un projet
          </a>
        </div>
      </div>
    </div>
  </nav>
</template>