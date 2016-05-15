#!/bin/bash

PROJECTDIR="/mapr/brewpot/apps/prod/caravel/caraveldrill"

DOCKERIMG="zeta/caravel"

if [ ! -d "${PROJECTDIR}/working" ]; then
    mkdir -p ${PROJECTDIR}/working
fi

if [ ! -d "${PROJECTDIR}/cache" ]; then
   mkdir -p ${PROJECTDIR}/cache
fi

cp ./caravel_config.py ${PROJECTDIR}/working
cp ./initial.sh ${PROJECTDIR}/working


if [ -f "${PROJECTDIR}/pyodbc_example.py" ]; then
    cp ${PROJECTDIR}/pyodbc_example.py ${PROJECTDIR}/working
    chmod +x ${PROJECTDIR}/working/pyodbc_example.py
fi



echo "The First time you should run the commands (from within the docker container) in initial.sh"
echo ""
echo "This is not a production ready container. It is designed to work with the configuration items with caravel and with pyodbc on a path to get Apache Drill working with Caravel"
echo ""


sudo docker run -it --rm --net=host -e="PYTHONPATH=/app/caravel/caravel_config.py:$PYTHONPATH" -v=${PROJECTDIR}/working:/app/caravel:rw -v=${PROJECTDIR}/cache:/app/cache:rw ${DOCKERIMG} /bin/bash
