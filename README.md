## RabbitMQ Dockerfile


This repository contains **Dockerfile** of [RabbitMQ](http://www.rabbitmq.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/rabbitmq/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

## nombre de la imagen
    dk_rabbitmq

## primero crear la red bridge para el ejemplo
   docker network create backend

## compilar
    docker build -t dk_rabbitmq .

## para arrancar la imagen, deben compilarla, y luego correr el archivo start.sh, para detenerla usar stop.sh



