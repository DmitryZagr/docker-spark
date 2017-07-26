#!/bin/sh

for i in hadoop hadoop-namenode hadoop-datanode spark; do
    echo Building $i
    ( cd $i && ./build.sh)
done
