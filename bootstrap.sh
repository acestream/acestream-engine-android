#!/bin/sh
set -e

libvlc/bootstrap_libvlc.sh
acestream-engine-android-core/bootstrap_appodeal.sh
connect-sdk/bootstrap_connect_sdk.sh
app/bootstrap_acestream_engine.sh

echo "* Bootstrap done"