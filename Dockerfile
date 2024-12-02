# Étape de build
FROM node:18-alpine as build

WORKDIR /app

# Installation des dépendances nécessaires pour le build
RUN apk add --no-cache bash

# Copie des fichiers de configuration
COPY package*.json ./
COPY tsconfig*.json ./
COPY vite.config.ts ./

# Installation des dépendances
RUN npm ci

# Copie du code source et des fichiers statiques
COPY . .

# Configuration des variables d'environnement
ENV VITE_NOCODB_URL=https://nocodb.kevinalves.fr
ENV VITE_NOCODB_API_TOKEN=1d-5viNwVUUHnP5JheXNfRzhaVRjVCHFL4gwTemi

# Build de l'application
RUN npm run build

# Étape de production
FROM nginx:alpine

# Copie de la configuration nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copie des fichiers buildés
COPY --from=build /app/dist /usr/share/nginx/html

# S'assurer que tous les fichiers sont accessibles par nginx
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 