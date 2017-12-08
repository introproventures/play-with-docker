#!/bin/bash


while true
do
	git fetch
	git status -uno |grep "Your branch is up-to-date with 'origin/master'" >/dev/null
	if [ $? != 0 ]
	then
	  echo `date` " Changes detected. Stopping previous run. "
	  docker-compose down &
	  
          sleep 5
	  echo `date` " Cleaning system"
          docker system prune -f
	  echo `date` " Pull new changes"
          git pull
	  echo `date` " Start new version"
          docker-compose up &
	  
	fi
	sleep 1m
done
