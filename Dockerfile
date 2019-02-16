ARG ALPINE_ERLANG_VERSION=21.2.2
FROM shoresuite/alpine-erlang:${ALPINE_ERLANG_VERSION}

LABEL maintainer="Alistair A. Israel <alistair@shoresuite.com>"

ARG ELIXIR_VERSION=1.8.1

WORKDIR /tmp/elixir-build

RUN \
  apk --no-cache --update --available upgrade && \
  apk add --no-cache --update --virtual .elixir-build \
  make && \
  apk add --no-cache --update \
  git && \
  git clone https://github.com/elixir-lang/elixir --depth 1 --branch v${ELIXIR_VERSION} && \
  cd elixir && \
  make && make install && \
  mix local.hex --force && \
  mix local.rebar --force && \
  cd $HOME && \
  rm -rf /tmp/elixir-build && \
  apk del --no-cache .elixir-build

WORKDIR ${HOME}

CMD ["/bin/sh"]
