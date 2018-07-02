# OBMIN Server

A secure private personal server for your data.

![LOGO](obmin.svg)

## Using
```sh
docker run --rm --volume="$PWD:/srv/obmin" -p 80:8088 -it obmin
```
### Use **-d** option to run a container in background

```console
$ docker run -d --rm --volume="$PWD:/srv/obmin" -p 80:8088 -it obmin
```
### Running the server with custom arguments
```sh
docker run --rm --volume="$PWD:/srv/obmin" -p 80:8088 -it obmin obmin-server --config /etc/obmin.config
```

## Building
```sh
docker build -t obmin .
```

## Customizing
1. Modify `obmin.config`.
2. Build image.
