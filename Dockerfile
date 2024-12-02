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
    chmod -R 755 /usr/share/nginx/html && \
    # Créer un fichier .htaccess pour la configuration supplémentaire
    echo "AddType application/javascript .js .mjs .ts" > /usr/share/nginx/html/.htaccess

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 