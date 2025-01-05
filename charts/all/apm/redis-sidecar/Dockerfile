# Start from the Redis Stack base image
FROM redis/redis-stack:latest

# Set working directory
WORKDIR /usr/local/bin

# Create the log directory
RUN mkdir -p /var/log/redis && chmod -R 777 /var/log/redis

# Copy the Redis configuration file
COPY redis.conf /usr/local/etc/redis/redis.conf

# Make the Bash script executable
COPY redis-sync.sh /usr/local/bin/redis-sync.sh
RUN chmod +x /usr/local/bin/redis-sync.sh

# Expose the Redis port
EXPOSE 6379

# Start Redis with the configuration file and the Bash script
CMD ["sh", "-c", "redis-server /usr/local/etc/redis/redis.conf & /usr/local/bin/redis-sync.sh"]
