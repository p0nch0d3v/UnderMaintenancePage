#!/bin/sh

HOST_PORT="80"

while getopts p:P: option
do
 case "${option}"
 in
 p) HOST_PORT=${OPTARG};;
 P) HOST_PORT=${OPTARG};;
 esac
done

if [ -z "$HOST_PORT" ] || [ "" = "$HOST_PORT" ] ; then
    HOST_PORT="80"
fi

echo '---------- ---------- ---------- ---------- '
echo 'Stop current docker container'
echo '---------- ---------- ---------- ---------- '
docker stop under_maintenance_local

echo '---------- ---------- ---------- ---------- '
echo 'Remove current docker container'
echo '---------- ---------- ---------- ---------- '
docker rm under_maintenance_local

echo '---------- ---------- ---------- ---------- '
echo 'Remove current docker image'
echo '---------- ---------- ---------- ---------- '
docker rmi under_maintenance:local

echo '---------- ---------- ---------- ---------- '
echo 'Build the new docker image'
echo '---------- ---------- ---------- ---------- '
docker build -t under_maintenance:local .

echo '---------- ---------- ---------- ---------- '
echo 'Run the new docker container'
echo 'HOST PORT '${HOST_PORT}
echo '---------- ---------- ---------- ---------- '
docker run -p ${HOST_PORT}:80 --name under_maintenance_local -d under_maintenance:local

