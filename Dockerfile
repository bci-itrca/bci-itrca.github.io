# Simple nginx container for static website
FROM nginx:alpine

# Copy website files to nginx html directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
