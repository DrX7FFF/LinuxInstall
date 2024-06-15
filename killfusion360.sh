#! /bin/bash

kill -9 $(ps aux |grep -i '\.exe' |awk '{print $2}'|tr '\n' ' ')
