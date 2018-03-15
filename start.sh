#!/bin/bash

# Run composer
if [[ "$RUN_COMPOSER" == "1" ]]; then 
    cd /var/www
    composer install --no-dev
fi

if [[ "$RUN_MIGRATIONS" == "1" ]]; then
    cd /var/www
    php artisan migrate --force
fi

if [[ "$YARN_RUN" == "1" ]]; then
    cd /var/www
    yarn && yarn run prod
fi

# Start Supervisor
echo "Starting Supervisor"
exec /usr/bin/supervisord -n -c /etc/supervisord.conf
