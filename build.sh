#!/bin/sh
docker build -t d: .
docker tag d: d:latest
docker push d:
docker push d:latest
