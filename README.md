# [OBMIN Server](https://obmin.github.io) [<img alt="OBMIN" src="obmin.svg" align="right"  style="margin:0">](https://github.com/konkor/obmin)

![Build Status](https://travis-ci.com/konkor/obmin-docker.svg?branch=master)

A secure private personal server for your data.

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
