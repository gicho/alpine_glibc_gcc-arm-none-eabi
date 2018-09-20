# Arm None Eabi Docker image based on alpine with GNU C Library

The base image is based on the [Alpine GNU C library image]https://github.com/frol/docker-alpine-glibc),
which is only a 5MB image, and contains glibc and arm-none-eabi cross toolchain to enable embdedd development over small docker image.

Another image add also the cmake tool to this docker develoment environment.

## Usage Example

This image is intended to be a base image for your development environment, so you may use it in different ways :

### Embedded your source code inside a new image

```Dockerfile
FROM tech4/alpine_glibc_gcc-arm-none-eabi

COPY ./my_app /home

```

```sh
$ docker build -t my_app .
```

### Mount dynamically your source code inside the base image

You can also use it always executed to compile manually from container commande line:

```sh
$ docker run -it --rm -v "$PWD":/home tech4/alpine_glibc_gcc-arm-none-eabi
/home # make
```
