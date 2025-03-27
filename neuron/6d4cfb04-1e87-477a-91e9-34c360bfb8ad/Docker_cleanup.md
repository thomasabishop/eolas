---
tags: [docker, procedural]
created: Thursday, March 27, 2025
---

# Docker cleanup

## Check Docker storage usage

```sh
sudo docker system df
```

## Unused volumes

These are the biggest culprit when taking up server space.

Use this command to clear them out:

```sh
sudo docker volume rm $(sudo docker volume ls -q -f dangling=true)
```

These are typically UUIDs and named anonymously which makes it hard to know what
you are deleting.

To avoid this, the best practice is to name the volumes in the Dockerfile and
also label them to make it easier to tell what's doing what:

```yml
volumes:
  nextcloud_data:
    name: nextcloud_data
    labels:
      app: nextcloud
      purpose: user_data

services:
  nextcloud:
    volumes:
      - nextcloud_data:/var/www/html
```

### Locations to check (even after deleting volume)

```
/var/lib/docker/image
/var/lib/docker/containers
/var/lib/docker/volumes
/var/lib/docker/buildkit # build cache
```

## Unused images

### Identify

```sh
sudo docker images --filter "dangling=tre"
```

### Delete

```sh

sudo docker rmi mariadb:latest
```
