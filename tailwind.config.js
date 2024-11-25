/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        neon: '#1A1A1A', // Noir pour les accents
        beige: {
          50: '#FDFBF7',  // Beige très clair (presque blanc) pour le fond
          100: '#F5F0E6', // Beige clair
          200: '#E6D5B8', // Beige moyen
          300: '#C4B5A0', // Beige foncé
        },
        dark: {
          900: '#000000',
          800: '#111111',
          700: '#1A1A1A',
          600: '#222222',
        },
        primary: {
          DEFAULT: '#1A1A1A',
          dark: '#000000',
        }
      },
      fontFamily: {
        sans: ['Space Grotesk', 'system-ui', 'sans-serif'],
        display: ['Clash Display', 'sans-serif'],
      },
      fontSize: {
        'huge': ['clamp(3rem, 6vw, 5rem)', '1'],
      },
    },
  },
  plugins: [],
}