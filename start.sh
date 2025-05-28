#!/bin/bash

# Set non-interactive for timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Start tmate in background
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH and Web (read-write) session links
echo "SSH access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "Web access (read-write):"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

# Start your panel here (replace this with your actual panel startup)
# Example using PHP's built-in server:
php -S 0.0.0.0:8080 -t /var/www/html &

# Keep container alive and show status
while true; do
    echo "alive - $(date)"
    sleep 300
done
