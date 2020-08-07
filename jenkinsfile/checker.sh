#!/bin/bash

printenv
echo "listing current dir"
ls
python --version
docker run --rm tig4605246/config-checker-python:latest python3 --version