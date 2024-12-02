# Étape de build
FROM node:18-alpine as build

WORKDIR /app

# Copie des fichiers de configuration
COPY package*.json ./
COPY tsconfig*.json ./
COPY vite.config.ts ./

# Installation des dépendances
RUN npm ci

# Copie du code source et des fichiers statiques
COPY . .

# Définition des variables d'environnement pour le build
ARG VITE_NOCODB_API_TOKEN
ARG VITE_NOCODB_URL
ENV VITE_NOCODB_API_TOKEN=${VITE_NOCODB_API_TOKEN}
ENV VITE_NOCODB_URL=${VITE_NOCODB_URL}

# Build de l'application
RUN npm run build

# Étape de production
FROM nginx:alpine

# Copie de la configuration nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copie des fichiers buildés
COPY --from=build /app/dist /usr/share/nginx/html

# Copie explicite des dossiers d'assets
COPY --from=build /app/public /usr/share/nginx/html/public

# S'assurer que tous les fichiers sont accessibles par nginx
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 