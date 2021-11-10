#! /bin/bash

# Working emulators for retroarch
retroarchemus="\
fceumm
snes9x
mednafen_vb
gearboy
vba_next
genesis_plus_gx
handy
mame2003_plus
mednafen_ngp
mednafen_pce_fast
mednafen_wswan
o2em
prboom
vecx
bluemsx"
IFS=$'\n'

# Setup build dirs
rootdir=$(pwd)'/buildout/'
mkdir -p ${rootdir}{data,js/vendor,retrotmp,emulatorjstmp}

## Grab frontend blobs
# Libretro emscripten
cd ${rootdir}retrotmp
wget https://buildbot.libretro.com/nightly/emscripten/RetroArch.7z
7z x RetroArch.7z
sed -i 's/wasmBinaryFile="/wasmBinaryFile="data\//g' retroarch/*.js
for emu in $retroarchemus; do
  mv retroarch/${emu}_libretro.* "${rootdir}/data/"
done
cd retroarch/assets/frontend/bundle/
zip -r frontend.zip  assets/xmb/monochrome assets/ozone shaders filters info autoconfig overlay assets/menu_widgets
mv frontend.zip "${rootdir}/data/"
cd "${rootdir}"
rm -Rf retrotmp
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
mv \
  ${rootdir}/emulatorjstmp/frontend/js/vendor/browserfs.min.js \
  ${rootdir}/emulatorjstmp/frontend/js/vendor/jquery.hotkeys.js \
  ${rootdir}/emulatorjstmp/frontend/js/vendor/jquery.min.js \
  ${rootdir}/js/vendor/
rm -Rf ${rootdir}/emulatorjstmp/
# Make tarball for release
cd ${rootdir}
tar -czf libretrojs.tar.gz *
mv libretrojs.tar.gz ../
