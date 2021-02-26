#!/bin/bash
DIRECTORY=`dirname $0`
echo $DIRECTORY

name=$1
email=$2
all=$*

echo "your name is $name"
echo "your email is $email"
echo "* is $all"