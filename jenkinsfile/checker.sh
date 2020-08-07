#!/bin/bash

printenv
echo "listing current dir"
ls
python --version
docker run --rm ubuntu:16.04 echo 123