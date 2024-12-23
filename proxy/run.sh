#!/bin/sh
set -e

# Ensure SSL directory ownership and permissions
# if [ -d /etc/nginx/ssl ]; then
#   echo "Setting permissions for /etc/nginx/ssl"
#   chown -R nginx:nginx /etc/nginx/ssl
#   chmod -R 440 /etc/nginx/ssl
# fi

# Check for SSL certificates
if [ ! -f /etc/nginx/ssl/certificate.crt ] || [ ! -f /etc/nginx/ssl/private.key ]; then
    echo "Error: SSL certificate files not found in /etc/nginx/ssl/"
    echo "Please ensure certificate.crt and private.key are mounted correctly"
    exit 1
fi

# Generate nginx configuration from template
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# Start nginx
nginx -g 'daemon off;'