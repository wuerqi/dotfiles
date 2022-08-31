#!/bin/sh

SRC_DIR=$1
DST_DIR=$2

CMAKE_FILE=$SRC_DIR/CMakeLists.template
VIMSPECTOR_FILE=$SRC_DIR/vimspector.cpp.json
CPP_FILE=$SRC_DIR/main.cpp

if [ -f $CMAKE_FILE ]; then
    echo "Unable to file $CMAKE_FILE in $SRC_DIR"
    exit -1
fi

if [ ! -f $VIMSPECTOR_FILE ]; then
    echo "Unable to file $VIMSPECTOR_FILE in $SRC_DIR"
    exit -1
fi

if [ ! -d $DST_DIR ]; then
    echo "Directory $DST_DIR does not exist. Will create it..."
fi

mkdir -p $DST_DIR/build

echo "copy CMakeLists.txt template to $DST_DIR"
cp $CMAKE_FILE $DST_DIR/CMakeLists.txt

echo "copy vimspector.json template to $DST_DIR"
cp $VIMSPECTOR_FILE $DST_DIR/.vimspector.json

if [ -f $CPP_FILE ]; then
    cp $CPP_FILE $DST_DIR/main.cpp
fi

echo "Create project workspace successfully."



