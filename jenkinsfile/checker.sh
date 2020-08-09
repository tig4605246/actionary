#!/bin/bash
TEMPLATE="{\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"Config commit:\n*< $COMMIT_URL | $COMMIT >*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Result:*\nTests Passed\n*Commited By:*\n $COMMITER \"}}]}"
ERROR_TAGGING=',{"type":"section","text":{"type":"mrkdwn","text":"@sre"}}'

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
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Config commit:\n*< $COMMIT_URL | $COMMIT >*\"}" ${SLACK}
#    curl -X POST -H 'Content-type: application/json' --data @jenkinsfile/payload.json ${SLACK}   
    #curl -X POST -H 'Content-type: application/json' --data @${TEMPLATE} ${SLACK}
}

main $@