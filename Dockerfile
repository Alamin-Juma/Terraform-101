# Use official Node.js runtime
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Expose port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]