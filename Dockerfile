FROM node:18 as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

RUN npm run build

# Use an Nginx image to serve the built React app
FROM nginx:alpine

# Copy the built files from the previous stage to Nginx's serving directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port Nginx runs on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]