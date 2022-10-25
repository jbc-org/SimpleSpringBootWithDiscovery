#!/usr/bin/env bash

echo 'Initiating Docker build'
docker build --push -t jbcuningham/spring-boot-with-discovery .

