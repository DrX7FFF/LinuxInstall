#!/bin/sh
nc -lk -p 9999 -e sh -c '
    echo "{\"datetime\": $(date +"%s")000,"
    uptime | awk -F"(up |,  load average: |, )" '\''{
        print "\"uptime\":\""$2"\", \"avg1\":"$3", \"avg5\":"$4", \"avg15\":"$5",";
    }'\''
    free | grep '^Mem:' | while read -r _ total used free _; do 
        echo "\"memorytotal\": $total,\"memoryused\": $used,\"memoryfree\": $free,\"disks\":["
    done
    df -h | grep "^\/dev\/" | while read -r device size used avail perc _reste_; do
        label=$(blkid -s LABEL -o value "$device" 2>/dev/null || echo "N/A")
        echo "$sep{\"device\":\"$device\", \"label\":\"$label\", \"size\": \"$size\", \"used\":\"$used\", \"avail\":\"$avail\", \"perc\":\"$perc\"}"
        sep=,
    done
    echo "]}@"
'