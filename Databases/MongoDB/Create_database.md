---
categories:
  - Databases
tags: [mongo-db, node-js, mongoose]
---

# Creating a MongoDB database

First create a directory for the database and set permissions:

```bash
$ mkdir /data/db
$ sudo chown -R `id -un` /data/db
```

Then start the Mongo daemon

```bash
mongod
```

This will run continuously in the terminal and should say somewhere that it is waiting for connections on port `27017`. This command must be executed before you run any backend that interacts with the Mongo database.

## MongoDB Compass

_Compass_ is a graphical interface for viewing and interacting with the data in your Mongo database. It will automatically load to the default Mongo port: `27017`.

![](/img/mongo-compass.png)

## Arch Linux troubleshooting

Most times any problems will be a result of a Mongo process that is already running. Resolve with:

```bash
# Kill running Mongo process...
# Identify PID
sudo lsof -iTCP -sTCP:LISTEN -n -P
sudo kill [pid]
```

Otherwise try the below.

```bash
# Check that the systemd service is runnign for Mongo
sudo systemctl status mongodb

# If not, enable and start service (only need to do this once for machine)
sudo systemctl enable --now mongodb
sudo systemctl start --now mongodb

# If issues with Mongo daemon...
# Remove the current socket
rm /tmp/mongodb-27017.sock
```

For additional command line utilities you will also need to install `mongodb-tools` from the AUR.
