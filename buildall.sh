#!/bin/sh

for i in hadoop hadoop-namenode hadoop-datanode spark hadoop-historyserver; do
    echo Building $i
    ( cd $i && ./build.sh)
done
