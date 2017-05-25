#!/bin/bash

[ -z $1 ] && echo "need to enter an image" && exit 1

while getopts ":i:" opt; do
  	case $opt in
    	i)
      	echo "-i was triggered, Parameter: $OPTARG" >&2
				IMAGE=$OPTARG
      	;;
	    \?)
  	    echo "Invalid option: -$OPTARG" >&2
    	  exit 1
      	;;
	    :)
  	    echo "Option -$OPTARG requires an argument." >&2
    	  exit 1
	      ;;
	    *)
  	    echo "need a flag"
    	  exit 1
	      ;;
	  esac
done

function login {

	creds=$(aws ecr get-login --region us-east-1)

	$creds
}

function push {

	docker tag $IMAGE:latest 831860342170.dkr.ecr.us-east-1.amazonaws.com/cs642repo:$IMAGE-latest

	docker push 831860342170.dkr.ecr.us-east-1.amazonaws.com/cs642repo:$IMAGE-latest
}

