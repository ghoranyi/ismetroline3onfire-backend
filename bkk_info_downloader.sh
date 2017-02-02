#!/bin/bash

curl -s http://www.bkk.hu/apps/bkkinfo/lista-api.php | jq '.active[] | select(.jaratokByFajta[].type == "metro" and .jaratokByFajta[].jaratok[] == "M3")' > /tmp/bkk_cache

if [ -s /tmp/bkk_cache ]; then
  aws s3 cp /tmp/bkk_cache s3://aws-website-wwwismetrolineonfirecom-qjmkj --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers --only-show-errors
fi

rm /tmp/bkk_cache
