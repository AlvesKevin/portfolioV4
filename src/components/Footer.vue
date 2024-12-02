<template>
  <footer class="py-12 border-t border-beige-200">
    <div class="container mx-auto px-6 max-w-6xl">
      <div class="flex flex-col md:flex-row justify-between items-center gap-6">
        <div class="text-2xl font-display font-bold text-dark-900">
          Kévin<span class="text-neon">.</span>
        </div>
        
        <div class="flex items-center gap-6">
          <a href="https://www.linkedin.com/in/alvesk%C3%A9vin/" 
             target="_blank"
             class="text-dark-700 hover:text-neon transition-colors">
            LinkedIn
          </a>
          <a href="https://github.com/AlvesKevin" 
             target="_blank"
             class="text-dark-700 hover:text-neon transition-colors">
            GitHub
          </a>
          <a href="mailto:contact@kevin-alves.fr" 
             class="text-dark-700 hover:text-neon transition-colors">
            Email
          </a>
        </div>
        
        <p class="text-dark-700 text-sm">
          © {{ new Date().getFullYear() }} Kévin Alves. Tous droits réservés.
        </p>
      </div>
    </div>
  </footer>
</template>