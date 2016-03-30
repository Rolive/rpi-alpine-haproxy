![Docker logo](http://palletops.com/images/docker-large-h-trans.png "Docker Logo")

# Haproxy Docker image for armhf devices

This is an haproxy Docker image for arm devices, built on a Raspberry Pi 3.  
Based on Alpine Linux for a minimal and clean image.

# Getting the image

It's available on the Docker Registry :

```
docker pull drakerin/rpi-alpine-haproxy
```

# Using the image (default configuration)

To start haproxy with the default config (useless but why not :p) :

```
docker run -p 80:80 -p 443:443 drakerin/rpi-alpine-haproxy
```

# Customizing configuration

A script searches for configuration override in the containers directory /tmp/conf_override.

In order to provide your own configuration / error(s) files, you will need to create a directory to share with the containers volume, e.g.:

```
mkdir /srv/haproxy
```

(According to the FHS, /srv/ contains data for the **s**e**rv**ices provided by the system so it's a good idea to place your files here)

To override the configuration, copy your haproxy.conf at the root of this directory.
To override the errors, create an "errors" subfolder and place your html files there.

Then run the container with the good volumes :
```
docker run -p 80:80 -p 443:443 -v /srv/haproxy:/tmp/conf_override drakerin/rpi-alpine-haproxy
```