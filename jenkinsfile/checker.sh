#!/bin/bash
#TEMPLATE="{\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"Config commit:\n*<https://github.com/tig4605246/actionary/commit/$COMMIT_URL | $GIT_COMMIT>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Result:*\nTests Passed\n*Commited By:*\n $GIT_COMMITER \"}}]}"
ERROR_TAGGING=',{"type":"section","text":{"type":"mrkdwn","text":"@sre"}}'
NAME=`git show -s --pretty=\"%an <%ae>\" ${GIT_COMMIT}`

main(){
    printenv
    echo "listing current dir"
    ls
    python --version
    docker run --rm tig4605246/config-checker-python:latest python3 --version
    bash jenkinsfile/err.sh
    STATUS=$?
    echo "i get $STATUS"
    echo "commiter ${NAME}"
    echo "Did I send something?"
    #curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Config commit:\n*<https://github.com/tig4605246/actionary/commit/$GIT_COMMIT | $GIT_COMMIT>*\"}" ${SLACK}
#    curl -X POST -H 'Content-type: application/json' --data @jenkinsfile/payload.json ${SLACK}   
    curl -X POST -H 'Content-type: application/json' --data "{\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"Config commit:\n*<https://github.com/tig4605246/actionary/commit/$COMMIT_URL | $GIT_COMMIT>*\"}},{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"*Build URL:*\n*<${BUILD_URL}|URL>*\n*Result:*\nTests Passed\n*Commited By:*\n $GIT_COMMITER \"}}]}" ${SLACK}
}

main $@