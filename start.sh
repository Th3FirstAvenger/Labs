#!/bin/bash

d1='/tmp/flags_lfi'
d2='/tmp/php_myadmin'
wdir=`pwd`


function build(){
    ruta=$1
    if ! [[ -d ${ruta} ]]; then
        mkdir ${ruta}
    fi
    touch ${ruta}/{user,root}.txt 2> /dev/null
}

function iniciar_docker(){
    cd ${wdir}/phpmyadmin/
    docker-compose -f docker-compose_phpmydamin.yml up -d --build
    cd ${wdir}/lfi-labs/
    docker-compose up -d --build
}
function stop_docker(){
    cd ${wdir}/phpmyadmin/
    docker-compose -f docker-compose_phpmydamin.yml down

    cd ${wdir}/lfi-labs/
    docker-compose -f docker-compose.yml down
}

build ${d1}
build ${d2}
stop_docker
iniciar_docker
watch -n1 -c "find /tmp/flags_lfi /tmp/php_myadmin/ -type f -print -exec cat {} \;"
