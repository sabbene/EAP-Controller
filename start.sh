#!/bin/bash

/etc/init.d/tpeap start

while true;
do
  count=`ps aux | grep -c omada`;

  if [[ ${count} -gt 1 ]]
  then
    sleep 10;
  fi
done
