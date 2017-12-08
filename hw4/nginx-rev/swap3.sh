#/bin/bash
# This shell is to do hotswap
%cd ../../activity
%docker build -t activity .
%cd ../hw4/nginx-rev
%docker build -t ng .
echo "Check1"
cd ..
./dorun.sh
%cd ../activity
%docker build -t activity2 .
containerid = docker ps -a | head -n 3 | tail -1 | $1
containerII = docker ps -a | head -n 4 | tail -1 | $1
docker run --network=ecs189_default --name web2 activity2 &
docker exec -it containerid bash
cd bin
./swap2.sh
exit
docker kill containerII
