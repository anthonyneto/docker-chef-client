# docker-chef-client
Contains a dockerfile to manage flatcar linux with chef via container.

### manual example
Usually this is created by ignition as a systemd-unit that runs on a timer.
```
docker run --name chef-client \
  --rm \
  --net=host \
  --cap-add net_admin \
  --cap-add sys_admin \
  -v chef:/var/chef \
  -v /opt/chef:/etc/chef \
  -v /opt/bin:/opt/bin \
  -v /data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /run/systemd/system:/run/systemd/system \
  -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
  -v /etc/systemd:/etc/systemd \
  anthonyneto/chef-client \
  -r 'role[neto-server]' \
  --force-formatter
```
