---
title: "Azure App Service"
linkTitle: "Azure App Service"
weight: 16
type: "landing"
draft: false
translated: false
categories:
- wxt
tags:
- appsvc
- docker
---

This page provides an overview for the process of creating a monolith container to deploy to Azure App Service (appsvc). It assumes you already have your project setup to work with the docker-scaffold repository. For initial project setup using docker-scaffold, see the beginning of the container based development workflow here - **[Local Docker setup][docker-setup]**

## Build the appsvc image

```sh
# Make our base docker image
make build

# Build the appsvc image
docker compose -f docker-compose.appsvc.yml up -d
```

> **Note**: After making changes to the project, you will need to remove your base image and build it again. This will ensure all changed files are copied into the base image as needed.

### Delete all Docker images

```sh
docker rmi $(docker images -q) --force
```

## Tag appsvc image and push to Azure Container Registry (ACR)

Now that you have build your appsvc image, you need to tag and push it to the ACR in order to deploy to it App Service.

```sh
docker login MY-CONTAINER-REGISTRY.azurecr.io
docker tag site-XYZ-appsvc:latest MY-CONTAINER-REGISTRY.azurecr.io/site-XYZ-appsvc:[tag]
docker push MY-CONTAINER-REGISTRY.azurecr.io/site-XYZ-appsvc:[tag]
```

Once this is done, you should be able to see your new image in the ACR.

## Build pipeline

In order to automate the build process using Azure DevOps, you can create a pipeline file in the root of your Drupal repo - **[Example pipeline file][pipeline-file]**

This pipeline script will build the appsvc image and push it to your container registry. Make sure you have cretaed the required Service Connection in Azure DevOps (Git repository, ACR).

## Notes

- By default, the appsvc image comes with Varnish and Redis. This can cause issues if your App Service environment is set to Scale Out. This is because Varnish and Redis store cached data in memory, that cannot be mapped to a storage account or another shared resource. This can cause your instances to have different data, and users can see content flip between old and new versions when they refresh their borwser. It is recommended to stay with one instance when using the appsvc cotainer as it comes configured.

<!-- Links Referenced -->

[docker-setup]:      https://drupalwxt.github.io/docs/environment/containers
[pipeline-file]:     https://gist.github.com/smulvih2/f473295594fe71d117ebc041f6e4b7ef
