# Docker storage

The following problems related to storage face containerized environments:

- Container storage is ephemeral. When the container is removed the read-write layer is removed. How can we persist data?

- Container storage is isolated: containers cannot access each other's file systems. If they need to share data, this could be a problem

### Docker volumes

Docker volumes are the solution to this. Volumes:

- store data on the host file system (i.e. outside the container)
- persist data beyond the lifecycle of the container

> A Docker volume is a logical volume that exists outside the container file
> system. It maps to a directory on the host and this location is managed by Docker - not much control over this.

Can be named or anonymous. Anonymous vols are created by Docker as needed. Named come from the user.

Volumes can be **named** or **anonymous**. Anonymous volumes are created by Docker as needed. Named volumes are named by the user. In both cases Docker decides where to create the volume.

### Creating a volume

```sh
docker run -d -rm -v /usr/share/nginx/html nginx:latest
```

The `-v` flag indicates volume. The file reference is the mount point _within_ the container. This is how the persistent storage it will appear. The _actual_ volume exists outside of the container anonymously in a place decided by Docker.

To create a named volume you first have to create:

```
docker volume create volume_name
```

Then you can designate it:

```
docker run -d -rm -v volume_name:/usr/share/nginx/html nginx:latest
```

The actual location is still hidden and decided by Docker.

As these are anonymous they will show ups as GUIDs in the volume viewer in Docker Desktop:

// Add: screenshot

### Commands

```
docker volume ls
docker volume rm
docker volume inspect
docker volume prune // remove all unused volumes
```

Inspect is only really informative if you are on Linux because it will show you the actual physical path. With Windows and Mac the referernce is to a virtual machine.
