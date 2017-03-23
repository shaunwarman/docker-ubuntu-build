FROM ubuntu:latest

WORKDIR /app/data

COPY dependencies .

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential

MAINTAINER shaun
