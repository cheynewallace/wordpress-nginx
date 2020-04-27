#!/bin/bash
set -e

TAG="5-php7.2-fpm-alpine"

echo "Pushing Tag Latest"
docker build . -t cheyne/wordpress-nginx
docker push cheyne/wordpress-nginx

echo "Pushing Tag $TAG"
docker tag cheyne/wordpress-nginx cheyne/wordpress-nginx:5-php7.2-fpm-alpine
docker push cheyne/wordpress-nginx:$TAG