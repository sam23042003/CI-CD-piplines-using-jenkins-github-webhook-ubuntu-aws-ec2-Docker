# Use Node 22 (or you can use node:20-alpine)
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port your app runs on
EXPOSE 3000

# Start the app in production mode
CMD ["npm", "start"]
