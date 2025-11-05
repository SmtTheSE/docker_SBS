# Use Node.js 18 as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY front-end/package*.json ./

# Install dependencies
RUN npm install

# Copy frontend source code
COPY front-end/. .

# Expose port 5173 (Vite default)
EXPOSE 5173

# Start the development server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]