FROM ubuntu:latest

WORKDIR /app/data

COPY dependencies .

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential \
    && apt-get install -y libpcre3 libpcre3-dev

MAINTAINER shaun
