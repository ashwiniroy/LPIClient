# Use a Node.js image as the build stage
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json from the app folder
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY app/ ./

# Build the React app
RUN npm run build

# Use a lightweight web server for serving React
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
