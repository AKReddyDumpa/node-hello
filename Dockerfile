# Stage 1: Build the application
FROM node:14 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm ci

# Stage 2: Create a lightweight production image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
