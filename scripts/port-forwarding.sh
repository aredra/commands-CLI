#!/bin/bash
while true

do

val=$(lsof -i :25432)

if [ ${#val} -eq 0 ]
then 
  ssh -i key user@hostAddress -L 25432:localhost:5432
fi

sleep 3000

done