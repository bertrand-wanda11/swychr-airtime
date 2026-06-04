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

# Change Nginx default port 80 to 8080 for Cloud Run compatibility
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]