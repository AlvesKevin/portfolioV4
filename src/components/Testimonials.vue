<script setup lang="ts">
import { ref, onMounted } from 'vue'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const testimonials = [
  {
    name: 'Dwell App',
    company: 'Application Immobilière',
    content: 'Kévin a grandement contribué au développement de notre API de scraping immobilier et à son automatisation, le tout avec beaucoup de professionnalisme et de sérieux. Son expertise a été clé dans la mise en place de notre système de collecte de données.',
    project: 'API de scraping immobilier & automatisation',
    image: '/testimonials/dwell.jpg'
  },
  {
    name: 'Pierre',
    company: 'Gustave Games - Studio de Jeux Vidéo',
    content: 'Kevin a répondu aux attentes avec un livrable de qualité; mission courte réalisée de manière efficace avec une bonne communication et une attention à la satisfaction du client.',
    project: 'Extraction et analyse de données',
    image: '/testimonials/gustave.jpg'
  }
]

onMounted(() => {
  gsap.from('.testimonial-card', {
    scrollTrigger: {
      trigger: '.testimonials-section',
      start: 'top center',
    },
    y: 40,
    opacity: 0,
    duration: 0.8,
    stagger: 0.2,
    ease: 'power3.out'
  })
})
</script>

<template>
  <section id="temoignages" class="testimonials-section py-12 md:py-20 relative">
    <div class="container mx-auto px-4 sm:px-6 max-w-6xl">
      <h2 class="heading-huge mb-8 md:mb-16 text-center md:text-left">
        Témoignages<span class="text-neon">.</span>
      </h2>
      
      <div class="grid sm:grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
        <div v-for="(testimonial, index) in testimonials" 
             :key="index"
             class="testimonial-card bg-beige-100 p-6 md:p-8 border border-beige-200 flex flex-col min-h-[280px] md:min-h-[320px]">
          <div class="flex-grow">
            <div class="flex items-start gap-3 md:gap-4 mb-4 md:mb-6">
              <div class="w-10 h-10 md:w-12 md:h-12 rounded-full overflow-hidden bg-beige-200 flex-shrink-0">
                <img :src="testimonial.image" 
                     :alt="testimonial.name"
                     class="w-full h-full object-cover" />
              </div>
              <div>
                <h3 class="font-bold text-lg md:text-xl text-dark-900">{{ testimonial.name }}</h3>
                <p class="text-dark-700 text-xs md:text-sm">{{ testimonial.company }}</p>
              </div>
            </div>
            
            <p class="text-dark-700 italic text-sm md:text-base">{{ testimonial.content }}</p>
          </div>
          
          <div class="pt-4 mt-4 md:mt-6 border-t border-beige-200">
            <p class="text-xs md:text-sm font-medium text-dark-900">
              Projet : <span class="text-dark-700">{{ testimonial.project }}</span>
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.testimonial-card {
  display: flex;
  flex-direction: column;
}

.testimonial-card > div:first-child {
  flex: 1;
}
</style>