# deemix-docker

Deemix in a Docker container.

## How to run this

Deemix will work out of the box, but you should at least set a fixed port for the web interface and mount a folder to the container for where your downloads will go.

You can also map a folder on the host for the config file (mount a local folder to /config/), but that's optional. If they add or rework settings in the future, there is no guarantee that your old configs will work, so beware.

### Example for Docker:
```
$ docker run -d --name Deemix \
              -v /your/storage/path/:/downloads \
              -v /your/config/location:/config \
              -e PUID=1000 \
              -e PGID=1000 \
              -p 33333:33333 \
              bocki/deemix
```

### Example for Docker Compose:
```
version: '3.3'
services:
    deemix:
	    image: bocki/deemix
        container_name: Deemix
        volumes:
            - /your/storage/path/:/downloads
            - /your/config/location:/config
        environment:
            - PUID=1000
            - PGID=1000
        ports:
            - 33333:33333
```

### Explanation:

`-v /your/storage/path/:/downloads`     - Path for your music downloads.

`-v /your/config/location:/config`      - OPTIONAL: Path to your local configuration.

`-e PUID=1000`                          - OPTIONAL: User ID of the user you want the container to run as in order to fix folder permission issues.

`-e PGID=1000`                          - OPTIONAL: Group ID, see above.

`-p 33333:33333`                          - Port opened for the web interface.

`bocki/deemix`                   - This container.

To access the web interface, go to http://YOURSERVERIP:33333 

## Tags

`latest`                : Latest state of the master branch. Can be considered "working".

Tag includes `amd64`, `arm32v7` and `arm64v8` architectures.

## Disclaimer and Links

I am in no way affiliated with the Deemix project (or any other Deezloader-like project for that matter).

Dockerhub link for this container: https://hub.docker.com/r/bocki/deemix

Repo for Deezloader Remix: https://notabug.org/RemixDev/deemix

Issue Tracker for this Docker: https://github.com/Bockiii/deemix-docker/issues


Feel free to open an issue that is Docker related, and not related to Deemix development. Go to the Deemix repository for that.
