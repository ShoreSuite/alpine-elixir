alpine-elixir
===

alpine-elixir Docker image builder, largely based on [bitwalker/alpine-elixir](https://github.com/bitwalker/alpine-elixir) but using [shoresuite/alpine-erlang](https://github.com/ShoreSuite/alpine-erlang) as the base image.

## Usage Instructions

To simply use the latest, published Docker image

```
docker pull shoresuite/alpine-elixir
```

However, it's recommended that you specify the exact image version (based on Erlang/OTP version)

```
docker pull shoresuite/alpine-elixir:1.8.0
```

## Build Instructions

To build and tag the image yourself locally, first clone this repository then

```
ELIXIR_VERSION=$(cat VERSION|tr -d '\n'); docker build -t alpine-elixir:${ELIXIR_VERSION} --build-arg ELIXIR_VERSION=${ELIXIR_VERSION} .
```

You may also try to build using an older version of Erlang, by supplying your own value for `ELIXIR_VERSION`. For example

```
ELIXIR_VERSION='1.7.4'; docker build -t alpine-elixir:${ELIXIR_VERSION} --build-arg ELIXIR_VERSION=${ELIXIR_VERSION} .
```
