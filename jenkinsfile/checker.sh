#!/bin/bash


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
#    curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello, World!"}' ${SLACK}
     curl -X POST -H 'Content-type: application/json' --data @jenkinsfile/payload.json ${SLACK}   

}

main $@