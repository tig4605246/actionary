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
    echo "Did I send something?"
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello, World!"}' https://hooks.slack.com/services/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

}

main $@