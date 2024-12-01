# Étape de build
FROM node:18-alpine as build

WORKDIR /app

# Définition des variables d'environnement
ENV VITE_APP_TITLE="Portfolio Kevin"
ENV VITE_NOCODB_TOKEN="1d-5viNwVUUHnP5JheXNfRzhaVRjVCHFL4gwTemi"

# Copie des fichiers de configuration
COPY package*.json ./
COPY tsconfig*.json ./
COPY vite.config.ts ./

# Installation des dépendances
RUN npm ci

# Copie du code source
COPY . .

# Build de l'application
RUN npm run build

# Étape de production
FROM nginx:alpine

# Copie de la configuration nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copie des fichiers buildés
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 