FROM alpine:latest

# Install git and python3 for fetching updates and HTTP server
RUN apk add --no-cache git python3

# Create odoo user and group with the same IDs as in the Odoo container
RUN addgroup -g 101 odoo && adduser -u 101 -G odoo -h /mnt/extra-addons -D odoo

# Set working directory
WORKDIR /mnt/extra-addons

# Copy all modules from the repository
COPY . /mnt/extra-addons/

# Change ownership to odoo user
RUN chown -R odoo:odoo /mnt/extra-addons

# Expose port for Coolify health checks
EXPOSE 8080

# Simple HTTP server for Coolify compatibility
CMD ["python3", "-m", "http.server", "8080"]
