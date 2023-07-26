#!/bin/bash
echo "we got here"

#Install packages
if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

#Create .env file if not already exists
if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo "env file exists."
fi

# Clear laravel's cache and generate APP_KEY
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear

# Use this command if you want to pass something to php-entrypoint from the Dockerfile
#docker-php-entrypoint "$@"

# Wait until database service is up and running, then migrate
# For reference: @see https://docs.docker.com/compose/startup-order/
until php artisan migrate > /dev/null 2>&1; do
  echo "Database service is unavailable yet, cannot perform migration - sleeping.."
  sleep 1
done
echo "Migration is completed"

php artisan serve --host=0.0.0.0 --env=.env