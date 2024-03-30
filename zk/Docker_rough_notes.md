---
id: dmuz
title: Docker_rough_notes
tags: []
created: Saturday, March 30, 2024
---

# Docker_rough_notes

## Creating and running a simple image (without Docker compose)

Create the Dockerfile in the root of the project.

Then build the image from root.

```
docker build -t image-name .
```

The image name is defined at this point, not pre-defined.

If successful, run the image:

```
docker run --name your-container-name image-name
```

Again, the container-name is defined at the point of the `run` declaration.
