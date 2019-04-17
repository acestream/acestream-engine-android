#!/bin/sh
set -e

ROOT=$(readlink -f $(dirname $0))

if [ ! -f ${ROOT}/releases/latest/libvlc.aar ]; then
    echo "Download libvlc.aar"

    rm -rf ${ROOT}/releases/latest/libvlc.aar
    mkdir -p ${ROOT}/releases/latest
    cd ${ROOT}/releases/latest

    wget http://acestream.org/downloads/bintray/android/libvlc/libvlc-all-3.1.5.aar -O libvlc.aar
fi

echo "libvlc bootstrap done"