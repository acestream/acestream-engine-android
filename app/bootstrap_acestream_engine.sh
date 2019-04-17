#!/bin/sh
set -e

ROOT=$(readlink -f $(dirname $0))

# armv7
mkdir -p $ROOT/flavors/armv7/assets/engine
cd $ROOT/flavors/armv7/assets/engine
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/common/assets/public_res.zip
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/armv7/assets/armeabi-v7a_private_py.zip
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/armv7/assets/armeabi-v7a_private_res.zip

mkdir -p $ROOT/flavors/armv7/jniLibs/armeabi-v7a
cd $ROOT/flavors/armv7/jniLibs/armeabi-v7a
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/armv7/jni/libpyembedded.so

# x86
mkdir -p $ROOT/flavors/x86/assets/engine
cd $ROOT/flavors/x86/assets/engine
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/common/assets/public_res.zip
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/x86/assets/x86_private_py.zip
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/x86/assets/x86_private_res.zip

mkdir -p $ROOT/flavors/x86/jniLibs/x86
cd $ROOT/flavors/x86/jniLibs/x86
wget -N http://acestream.org/downloads/bintray/android/acestream-engine/x86/jni/libpyembedded.so

# universal
mkdir -p $ROOT/flavors/universal/assets/engine
mkdir -p $ROOT/flavors/universal/jniLibs/armeabi-v7a
mkdir -p $ROOT/flavors/universal/jniLibs/x86
cp $ROOT/flavors/armv7/assets/engine/*zip $ROOT/flavors/universal/assets/engine/
cp $ROOT/flavors/x86/assets/engine/*zip $ROOT/flavors/universal/assets/engine/
cp $ROOT/flavors/armv7/jniLibs/armeabi-v7a/*so $ROOT/flavors/universal/jniLibs/armeabi-v7a/
cp $ROOT/flavors/x86/jniLibs/x86/*so $ROOT/flavors/universal/jniLibs/x86/

echo "Ace Stream engine bootstrap done"