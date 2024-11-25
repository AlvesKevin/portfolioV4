<script setup lang="ts">
import { onMounted, ref } from 'vue'
import gsap from 'gsap'

const circleRef = ref(null)

const handleMouseMove = (e: MouseEvent) => {
  if (!circleRef.value) return
  
  const bounds = (circleRef.value as HTMLElement).getBoundingClientRect()
  const centerX = bounds.left + bounds.width / 2
  const centerY = bounds.top + bounds.height / 2
  
  const moveX = (e.clientX - centerX) * 0.1
  const moveY = (e.clientY - centerY) * 0.1
  
  gsap.to(circleRef.value, {
    x: moveX,
    y: moveY,
    duration: 1,
    ease: 'power2.out'
  })
}

onMounted(() => {
  const tl = gsap.timeline()
  
  tl.from('.hero-title', {
    y: 100,
    opacity: 0,
    duration: 1,
    ease: 'power4.out'
  })
  .from('.hero-subtitle', {
    y: 30,
    opacity: 0,
    duration: 0.8,
    ease: 'power3.out'
  }, '-=0.5')
  .from('.hero-cta', {
    y: 20,
    opacity: 0,
    duration: 0.6,
    ease: 'power2.out'
  }, '-=0.3')
  .from('.hero-image', {
    x: 50,
    opacity: 0,
    duration: 0.8,
    ease: 'power3.out'
  }, '-=0.5')
})
</script>

<template>
  <section 
    class="min-h-screen flex flex-col justify-center px-2 py-20 relative"
    @mousemove="handleMouseMove"
  >
    <div class="absolute inset-0 bg-beige-50">
      <div class="absolute right-0 top-1/4 w-96 h-96 bg-beige-200/30 blur-[128px] rounded-full"></div>
      <div class="absolute left-1/4 bottom-1/4 w-64 h-64 bg-beige-200/20 blur-[96px] rounded-full"></div>
    </div>
    
    <div class="container mx-auto max-w-7xl relative z-10 px-4 sm:px-6">
      <div class="grid md:grid-cols-2 gap-8 md:gap-24 items-center">
        <div class="text-center md:text-left">
          <h1 class="hero-title heading-huge mb-6 md:mb-8">
            Expert <span class="text-neon">Web Scraping</span> & Automatisation de Données 🚀
          </h1>
          
          <div class="hero-subtitle space-y-4 md:space-y-6 text-lg md:text-xl text-dark-700 mb-8 md:mb-12">
            <p class="font-semibold text-dark-900">
              Salut, moi c'est Kévin ! Je transforme vos besoins en données exploitables.
            </p>
            <p>
              Spécialiste du web scraping et de l'automatisation de données, j'aide les entreprises à collecter et exploiter les informations stratégiques dont elles ont besoin pour se développer. De la simple extraction de leads à la création d'APIs complexes, je construis des solutions sur mesure qui vous font gagner du temps et de l'argent.
            </p>
          </div>
          
          <div class="hero-cta flex flex-col sm:flex-row gap-4 sm:gap-6 justify-center md:justify-start">
            <a href="#contact" class="btn-neon">
              Démarrer un projet
            </a>
            <a href="#projects" class="text-dark-900 hover:text-neon transition-colors flex items-center gap-2">
              Voir les projets
              <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
              </svg>
            </a>
          </div>
        </div>

        <div class="hero-image relative mt-8 md:mt-0">
          <div 
            ref="circleRef"
            class="absolute top-1/2 left-[40%] -translate-x-1/2 -translate-y-1/2 w-[80%] aspect-square bg-dark-900 rounded-full transition-transform"
            style="z-index: 1;"
          ></div>
          <img 
            src="/photoHero.png" 
            alt="Profile" 
            class="relative z-10 w-full h-auto"
          />
        </div>
      </div>
    </div>
    
    <div class="neon-line absolute bottom-0 left-0"></div>
  </section>
</template>

<style scoped>
.hero-image {
  perspective: 1000px;
  position: relative;
  isolation: isolate;
}
</style>