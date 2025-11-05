# Use Node.js 18 as the base image for building
FROM node:18-alpine as build

# Set working directory
WORKDIR /app

# Copy package files
COPY front-end/package*.json ./

# Install dependencies
RUN npm install

# Copy frontend source code
COPY front-end/. .

# Build the application
RUN npm run build

# Use nginx to serve the built files
FROM nginx:alpine

# Copy built files to nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]