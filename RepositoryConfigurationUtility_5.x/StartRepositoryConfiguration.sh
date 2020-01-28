#!/bin/bash

DIR=`pwd`
cd "$DIR/engine"

sh ./kitchen.sh -file=./transformations/ConfigureRepositoryJob.kjb -level=Basic > ../ConfigurationRun.log

if [ $? == 0 ]; then
	echo "Repository configuration process ran successfully!"
else
	echo "Repository configuration process failed. Check ConfigurationRun.log"
fi
