#!/bin/bash

REDIS_HOST=${MASTER_REDIS_HOST:-localhost}
REDIS_PORT=${MASTER_REDIS_PORT:-6379}
REDIS_PASS= ${MASTER_REDIS_PASS:-xxxx}

# Subscribe to the Redis channel and handle incoming messages
redis-cli -h "$REDIS_HOST" -p "$REDIS_PORT" -a "$REDIS_PASS" SUBSCRIBE updates | while read line; do
    # Filter the actual message (usually the 3rd line of each message protocol response)
    if [[ "$line" == *"message"* ]]; then
        # Extract the actual data (e.g., the 3rd field in the response)
        message=$(echo "$line" | awk -F ' ' '{print $NF}')
        # Push the message to the local Redis instance
        echo "Received: $message"
        echo "$message" | redis-cli -p 6379 -x SET update_key
    fi
done
