# Use a lightweight Nginx image
FROM nginx:alpine

# Copy the HTML file to Nginx's default serving directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80