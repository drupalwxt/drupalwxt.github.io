---
title: "Containers"
linkTitle: "Containers"
weight: 15
type: "landing"
draft: false
translated: false
resources:
  - src: "**.{png,jpg}"
    title: "Image #:counter"
    params:
      byline: "Image: Drupal / CC-BY-CA"
categories:
- wxt
tags:
- containers
- docker
---

For the (optional) container based development workflow this is roughly the steps that are followed.

```sh
# Git clone docker scaffold
git clone https://github.com/drupalwxt/docker-scaffold.git docker
```

## Linux Environments

The following are the steps you should follow for a Linux based environment.

```sh
# Create symlinks
ln -s docker/docker-compose.yml docker-compose.yml
ln -s docker/docker-compose-ci.yml docker-compose-ci.yml

# Composer install
export COMPOSER_MEMORY_LIMIT=-1 && composer install

# Make our base docker image
make build

# Bring up the dev stack
docker-compose -f docker-compose.yml build --no-cache
docker-compose -f docker-compose.yml up -d

# Install Drupal
make drupal_install

# Development configuration
./docker/bin/drush config-set system.performance js.preprocess 0 -y && \
./docker/bin/drush config-set system.performance css.preprocess 0 -y && \
./docker/bin/drush php-eval 'node_access_rebuild();' && \
./docker/bin/drush config-set wxt_library.settings wxt.theme theme-gcweb -y && \
./docker/bin/drush cr

# Migrate default content
./docker/bin/drush migrate:import --group wxt --tag 'Core' && \
./docker/bin/drush migrate:import --group gcweb --tag 'Core' && \
./docker/bin/drush migrate:import --group gcweb --tag 'Menu'
```

## Modern OSX Environments

If you have `Docker for Desktop` and a new enough OSX environment (Monterey or higher) then the steps are the exact same as those for the Linux environment given above.

All that is required in advance is to enable `VirtioFS` accelerated directory sharing which you can see in the attached picture below.

{{< imgproc virtiofs Resize "x300" >}}
Docker for Desktop VirtioFS
{{< /imgproc >}}

For older environments you may still use mutagen which is discussed below.

## Legacy OSX Environments (Mutagen)

While this is fixed with the new virtualization framework discussed above.

For older environments mutagen will have to be used instead and as such requires a few additional steps.

- **[Improve Mac File system performance][docker-mac]**

```sh
# Mutagen Setup
export VOLUME=site-wxt-mutagen-cache
docker volume create $VOLUME
docker container create --name $VOLUME -v $VOLUME:/volumes/$VOLUME mutagenio/sidecar:0.13.0-beta3
docker start $VOLUME
mutagen sync create --name $VOLUME --sync-mode=two-way-resolved --default-file-mode-beta 0666 --default-directory-mode-beta 0777  $(pwd) docker://$VOLUME/volumes/$VOLUME

# Create symlinks
ln -s docker/docker-compose-mutagen.yml docker-compose-mutagen.yml

# Composer install
export COMPOSER_MEMORY_LIMIT=-1 && composer install

# Make our base docker image
make build

# Bring up the dev stack
docker-compose -f docker-compose-mutagen.yml build --no-cache
docker-compose -f docker-compose-mutagen.yml up -d

# Install Drupal
make drupal_install

# Development configuration
./docker/bin/drush config-set system.performance js.preprocess 0 -y && \
./docker/bin/drush config-set system.performance css.preprocess 0 -y && \
./docker/bin/drush php-eval 'node_access_rebuild();' && \
./docker/bin/drush config-set wxt_library.settings wxt.theme theme-gcweb -y && \
./docker/bin/drush cr

# Migrate default content
./docker/bin/drush migrate:import --group wxt --tag 'Core' && \
./docker/bin/drush migrate:import --group gcweb --tag 'Core' && \
./docker/bin/drush migrate:import --group gcweb --tag 'Menu'
```

## Cleanup

If you wish to have a pristine docker environment you may execute the following commands.

```sh
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) --force
docker volume prune -f
```

For those still using Mutagen you may also need to execute the following command:

```sh
mutagen sync terminate <sync_xxxxx>
```

<!-- Links Referenced -->

[docker-mac]:      https://github.com/docker/roadmap/issues/7
[docker-scaffold]: https://github.com/drupalwxt/docker-scaffold.git
