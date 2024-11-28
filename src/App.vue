<script setup lang="ts">
import { ref } from 'vue'
import Navbar from './components/Navbar.vue'
import Hero from './components/Hero.vue'
import Services from './components/Services.vue'
import Projects from './components/Projects.vue'
import TrustedBy from './components/TrustedBy.vue'
import Testimonials from './components/Testimonials.vue'
import Contact from './components/Contact.vue'
import Footer from './components/Footer.vue'
</script>

<template>
  <div class="bg-beige-50 text-dark-900">
    <Navbar />
    <main>
      <Hero />
      <Services />
      <TrustedBy />
      <Projects />
      <Testimonials />
      <Contact />
    </main>
    <Footer />
  </div>
</template>