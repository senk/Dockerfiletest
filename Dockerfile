FROM ubuntu:14.04
MAINTAINER Robin Naundorf <r.naundorf@fh-muenster.de>
RUN apt-get update && apt-get install -y \
    curl \
    git \
    nodejs \
 && rm -rf /var/lib/apt/lists/*
