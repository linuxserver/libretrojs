#! /bin/bash

# Setup build dirs
rootdir=$(pwd)'/buildout/'
mkdir -p ${rootdir}{data,js,emulatorjstmp}

## Grab frontend blobs
# Custom cores
wget https://github.com/linuxserver/libretro-cores/archive/master.tar.gz
tar xf \
  master.tar.gz -C \
  ${rootdir} --strip-components=1
rm -f ${rootdir}/{README.md,master.tar.gz}
# Grab logic from emulatorjs
wget https://github.com/linuxserver/emulatorjs/archive/${GITHUB_TAG}.tar.gz \
  -O ${rootdir}/emulatorjstmp/emulatorjs.tar.gz
tar xf \
  ${rootdir}/emulatorjstmp/emulatorjs.tar.gz -C \
  ${rootdir}/emulatorjstmp/ --strip-components=1
mv \
  ${rootdir}/emulatorjstmp/frontend/js/libretro.js \
  ${rootdir}/js/
rm -Rf ${rootdir}/emulatorjstmp/
# Make tarball for release
cd ${rootdir}
tar -czf libretrojs.tar.gz *
mv libretrojs.tar.gz ../
