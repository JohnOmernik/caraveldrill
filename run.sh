#!/bin/bash

PROJECTDIR=${PROJECTDIR:-"$PWD/mounted"}
DRILLDIALECT_PATH=${DRILLDIALECT_PATH:-"$PWD/../sqlalchemy-drill"}

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
echo "Did you already run initial.sh? Run only caravel: caravel runserver -d"


docker run -it --rm -p 8088:8088 -e="PYTHONPATH=/app/caravel/caravel_config.py:/app/sqlalchemy-drill:$PYTHONPATH" -v=${DRILLDIALECT_PATH}:/app/sqlalchemy-drill -v=${PROJECTDIR}/working:/app/caravel:rw -v=${PROJECTDIR}/cache:/app/cache:rw ${DOCKERIMG} /bin/bash
