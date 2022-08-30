---
categories:
  - Databases
  - Linux
tags: [mongo-db]
---

# Troubleshooting MongoDB connection issues

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
