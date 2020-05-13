#!/usr/bin/env bash
CONNECT_CONFIG_ID=ocid1.connectharness.oc1.ReplaceWithYours

CONFIG_STORAGE_TOPIC=$CONNECT_CONFIG_ID-config
OFFSET_STORAGE_TOPIC=$CONNECT_CONFIG_ID-offset
STATUS_STORAGE_TOPIC=$CONNECT_CONFIG_ID-status

docker build -t kafkasinkconnect .

docker run -it --rm --name sinktest -p 8084:8083 \
-e GROUP_ID=sink-demo-group \
-e BOOTSTRAP_SERVERS=cell-1.streaming.YourOCIRegion.oci.oraclecloud.com:9092 \
-e CONFIG_STORAGE_TOPIC=$CONFIG_STORAGE_TOPIC \
-e OFFSET_STORAGE_TOPIC=$OFFSET_STORAGE_TOPIC \
-e STATUS_STORAGE_TOPIC=$STATUS_STORAGE_TOPIC \
-v "$PWD"/connect-distributed.properties:/kafka/config.orig/connect-distributed.properties:z \
kafkasinkconnect
