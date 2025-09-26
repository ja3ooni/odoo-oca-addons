dockerfile

Copy

FROM alpine:latest

# Install git for fetching updates
RUN apk add --no-cache git

# Create odoo user and group with the same IDs as in the Odoo container
RUN addgroup -g 101 odoo && adduser -u 101 -G odoo -h /mnt/extra-addons -D odoo

# Set working directory
WORKDIR /mnt/extra-addons

# Copy all modules from the repository
COPY . /mnt/extra-addons/

# Change ownership to odoo user
RUN chown -R odoo:odoo /mnt/extra-addons

# Keep container running
CMD ["tail", "-f", "/dev/null"]
