# WordPress nginx

A WordPress app container based on the official Alpine PHP FPM image from WordPress with nginx built into the container acting as a reverse proxy.
Runs 200% leaner than the official Apache image at about 1/3 the image size.

## Notes

## Grant Access To www-data

You'll want to grant access to the app directory after mounting a persistant volume claim in Kubernetes

`chown www-data:www-data -R *`

## Run Wordpress On Sub Path

Running on a subpath can be tricky, for example when mounting next to your main app such as `yourdomain.com/blog`

https://wordpress.org/support/article/giving-wordpress-its-own-directory/

## Ref From This Repo

Lifted several ideas from this repo
https://github.com/TrafeX/docker-wordpress
