#!/bin/bash
ERROR_TAGGING=',{"type":"section","text":{"type":"mrkdwn","text":"@sre"}}'
COMMITER_INFO=`git log  --pretty=format:'%an (%ae)' ${GIT_COMMIT}^! `

main(){
    printenv
    echo "listing current dir"
    ls
    python --version
    curl -X POST -H 'Content-type: application/json' --data "{\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"Config commit:\n*<https://github.com/tig4605246/actionary/commit/$COMMIT_URL | $GIT_COMMIT>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Build URL:*\n*<${BUILD_URL}|URL>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Test Started*\n*Commited By:*\n $COMMITER_INFO \"}}]}" ${SLACK}
    docker run --rm tig4605246/config-checker-python:latest python3 --version
    bash jenkinsfile/err.sh
    STATUS=$?
    echo "i get $STATUS"
    echo "commiter ${COMMITER_INFO}"
    echo "test2"
    echo "Did I send something?"
    curl -X POST -H 'Content-type: application/json' --data "{\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"Config commit:\n*<https://github.com/tig4605246/actionary/commit/$COMMIT_URL | $GIT_COMMIT>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Build URL:*\n*<${BUILD_URL}|URL>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Result:*\nTests Passed\n*Commited By:*\n $COMMITER_INFO \"}}]}" ${SLACK}
}

main $@