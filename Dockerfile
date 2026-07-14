# Stage 1: Build the static assets using Node
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the compiled static assets using Nginx
FROM nginx:stable-alpine as production-stage

# Vite builds files into an '/app/dist' folder by default
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 💡 THE CURE FOR 404: Write a custom default.conf that uses port 8080 AND handles Vue Router fallback
RUN echo 'server { \
    listen 8080; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]