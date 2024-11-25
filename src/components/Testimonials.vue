<script setup lang="ts">
import { ref, onMounted } from 'vue'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

const testimonials = [
  {
    name: 'Ugo Claudon',
    company: 'A.C. Concepts',
    content: 'Kévin a parfaitement répondu à nos besoins en matière d\'extraction de données. Son expertise technique et sa réactivité ont été déterminantes dans le succès de notre projet.',
    image: '/testimonials/ugo.jpg'
  },
  {
    name: 'Camille Bédèche',
    company: 'Sofanmedi',
    content: 'Une collaboration efficace et professionnelle. Les solutions d\'automatisation mises en place nous ont permis de gagner un temps précieux.',
    image: '/testimonials/camille.jpg'
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
  <section id="temoignages" class="testimonials-section py-20 relative">
    <div class="container mx-auto px-6 max-w-6xl">
      <h2 class="heading-huge mb-16">
        Témoignages<span class="text-neon">.</span>
      </h2>
      
      <div class="grid md:grid-cols-2 gap-8">
        <div v-for="(testimonial, index) in testimonials" 
             :key="index"
             class="testimonial-card bg-beige-100 p-8 border border-beige-200">
          <div class="flex items-start gap-4 mb-6">
            <div class="w-12 h-12 rounded-full overflow-hidden bg-beige-200">
              <img :src="testimonial.image" 
                   :alt="testimonial.name"
                   class="w-full h-full object-cover" />
            </div>
            <div>
              <h3 class="font-bold text-lg">{{ testimonial.name }}</h3>
              <p class="text-dark-700 text-sm">{{ testimonial.company }}</p>
            </div>
          </div>
          
          <p class="text-dark-700 italic">{{ testimonial.content }}</p>
        </div>
      </div>
    </div>
  </section>
</template>