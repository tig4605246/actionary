#!/bin/bash

#Please declare environment variables:
# You may also declare them in ~/.slackrc file.



main(){
    printenv
    echo "listing current dir"
    ls
    python --version
    docker run --rm tig4605246/config-checker-python:latest python3 --version
    bash jenkinsfile/err.sh
    STATUS=$?
    echo "i get $STATUS"
    slack "Did I send something?"
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello, World!"}' https://hooks.slack.com/services/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

}

main $@