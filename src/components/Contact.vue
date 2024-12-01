<script setup lang="ts">
import { ref } from 'vue'

const form = ref({
  name: '',
  email: '',
  message: ''
})

const isLoading = ref(false)
const status = ref('')

const sendEmail = async (e: Event) => {
  e.preventDefault()
  isLoading.value = true
  
  try {
    const response = await fetch('http://nocodb-m0wo4o4kc4s0gko4k8cgogg8.62.72.18.21.sslip.io/api/v1/db/data/v1/p8se3q0zbk4ojc4/contact', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'xc-token': import.meta.env.VITE_NOCODB_TOKEN || '1d-5viNwVUUHnP5JheXNfRzhaVRjVCHFL4gwTemi'
      },
      body: JSON.stringify({
        name: form.value.name,
        email: form.value.email,
        message: form.value.message,
        created_at: new Date().toISOString()
      })
    })

    const data = await response.json()
    console.log('Réponse:', data)

    if (!response.ok) {
      throw new Error(data.msg || 'Erreur lors de l\'envoi')
    }

    form.value = { name: '', email: '', message: '' }
    status.value = 'success'
  } catch (error) {
    console.error('Erreur:', error)
    status.value = 'error'
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <section id="contact" class="contact-section py-20 relative">
    <div class="container mx-auto px-6 max-w-6xl">
      <h2 class="heading-huge mb-16">
        Contact<span class="text-neon">.</span>
      </h2>
      
      <div class="grid md:grid-cols-2 gap-12">
        <div>
          <h3 class="text-2xl font-display font-bold mb-4 text-dark-900">Démarrons votre projet</h3>
          <p class="text-dark-700 mb-6">
            Besoin d'une solution d'extraction de données ou d'automatisation ? 
            Contactez-moi pour en discuter.
          </p>
          
          <div class="space-y-4 text-dark-700">
            <p class="flex items-center gap-2">
              <span class="text-neon">€</span>
              Tarif journalier : 400€
            </p>
            <p class="flex items-center gap-2">
              <span class="text-neon">⚡</span>
              Réponse en moins d'1h
            </p>
          </div>
        </div>
        
        <form @submit="sendEmail" class="space-y-6">
          <div>
            <label for="name" class="block text-sm font-medium text-dark-700 mb-2">Nom</label>
            <input type="text" 
                   id="name" 
                   v-model="form.name"
                   required
                   class="w-full bg-beige-100 border border-beige-200 text-dark-900 px-4 py-3 focus:border-dark-900 focus:outline-none" />
          </div>
          
          <div>
            <label for="email" class="block text-sm font-medium text-dark-700 mb-2">Email</label>
            <input type="email" 
                   id="email" 
                   v-model="form.email"
                   required
                   class="w-full bg-beige-100 border border-beige-200 text-dark-900 px-4 py-3 focus:border-dark-900 focus:outline-none" />
          </div>
          
          <div>
            <label for="message" class="block text-sm font-medium text-dark-700 mb-2">Message</label>
            <textarea id="message" 
                      v-model="form.message"
                      required
                      rows="4"
                      class="w-full bg-beige-100 border border-beige-200 text-dark-900 px-4 py-3 focus:border-dark-900 focus:outline-none"></textarea>
          </div>
          
          <button type="submit" 
                  :disabled="isLoading"
                  class="btn-neon w-full">
            {{ isLoading ? 'Ouverture du client mail...' : 'Envoyer' }}
          </button>
          
          <p v-if="status === 'success'" class="text-green-600 text-sm">
            Message envoyé avec succès ! Je vous recontacterai rapidement.
          </p>
          <p v-if="status === 'error'" class="text-red-600 text-sm">
            Une erreur est survenue. Veuillez réessayer ou me contacter directement à contact@kevinalves.fr
          </p>
        </form>
      </div>
    </div>
  </section>
</template>