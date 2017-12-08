#!/bin/bash


while true
do
	git fetch
	git status -uno |grep "Your branch is up-to-date with 'origin/master'" >/dev/null
	if [ $? != 0 ]
	then
	  echo `date` "Changes detected."
	  ./run.sh #-cleanDocker -cleanAllDockerImages -buildAll -dockerPush
	fi
	sleep 1m
done
