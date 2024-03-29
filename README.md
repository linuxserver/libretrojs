# LibretroJS

This repository collects the assets used in [https://github.com/linuxserver/emulatorjs](https://github.com/linuxserver/emulatorjs) and publishes releases that can be embedded into any website.

# Example
```
<button onclick="load()">Load Game</button>
<div id="game"></div>
<script type="text/javascript">
    EJS_player = '#game';
    EJS_gameUrl = '/your/game/rom.zip';
    EJS_core = 'snes9x';
    function load() {
      var script = document.createElement('script');
      script.src = 'js/libretro.js'
      document.getElementsByTagName('head')[0].appendChild(script);
    }
</script>
```

Simply extract the release into the root of your webserver and try this test page for the `snes9x` emulator.

# Supported emulators

* 81- [https://github.com/libretro/81-libretro](https://github.com/libretro/81-libretro)
* atari800- [https://github.com/libretro/libretro-atari800](https://github.com/libretro/libretro-atari800)
* bluemsx- [https://github.com/libretro/blueMSX-libretro](https://github.com/libretro/blueMSX-libretro)
* fceumm- [https://github.com/libretro/libretro-fceumm](https://github.com/libretro/libretro-fceumm)
* fuse- [https://github.com/libretro/fuse-libretro](https://github.com/libretro/fuse-libretro)
* gambatte- [https://github.com/libretro/gambatte-libretro](https://github.com/libretro/gambatte-libretro)
* gearboy- [https://github.com/libretro/Gearboy](https://github.com/libretro/Gearboy)
* genesis_plus_gx- [https://github.com/libretro/Genesis-Plus-GX](https://github.com/libretro/Genesis-Plus-GX)
* gw- [https://github.com/libretro/gw-libretro](https://github.com/libretro/gw-libretro)
* handy- [https://github.com/libretro/libretro-handy](https://github.com/libretro/libretro-handy)
* mame2003_plus- [https://github.com/libretro/mame2003-plus-libretro](https://github.com/libretro/mame2003-plus-libretro)
* mednafen_ngp- [https://github.com/libretro/beetle-ngp-libretro](https://github.com/libretro/beetle-ngp-libretro)
* mednafen_pce_fast- [https://github.com/libretro/beetle-pce-fast-libretro](https://github.com/libretro/beetle-pce-fast-libretro)
* mednafen_psx- [https://github.com/libretro/beetle-psx-libretro](https://github.com/libretro/beetle-psx-libretro)
* mednafen_vb- [https://github.com/libretro/beetle-vb-libretro](https://github.com/libretro/beetle-vb-libretro)
* mednafen_wswan- [https://github.com/libretro/beetle-wswan-libretro](https://github.com/libretro/beetle-wswan-libretro)
* melonds- [https://github.com/libretro/melonDS](https://github.com/libretro/melonDS)
* melonds_threaded- [https://github.com/libretro/melonDS](https://github.com/libretro/melonDS)
* mupen64plus_next - [https://github.com/libretro/mupen64plus-libretro-nx](https://github.com/libretro/mupen64plus-libretro-nx)
* o2em- [https://github.com/libretro/libretro-o2em](https://github.com/libretro/libretro-o2em)
* prboom- [https://github.com/libretro/libretro-prboom](https://github.com/libretro/libretro-prboom)
* prosystem- [https://github.com/libretro/prosystem-libretro](https://github.com/libretro/prosystem-libretro)
* snes9x- [https://github.com/libretro/snes9x](https://github.com/libretro/snes9x)
* stella2014- [https://github.com/libretro/stella2014-libretro](https://github.com/libretro/stella2014-libretro)
* tyrquake- [https://github.com/libretro/libretro-tyrquake](https://github.com/libretro/libretro-tyrquake)
* vba_next- [https://github.com/libretro/vba-next](https://github.com/libretro/vba-next)
* vecx- [https://github.com/libretro/libretro-vecx](https://github.com/libretro/libretro-vecx)
* virtualjaguar- [https://github.com/libretro/virtualjaguar-libretro](https://github.com/libretro/virtualjaguar-libretro)
* yabause- [https://github.com/libretro/yabause](https://github.com/libretro/yabause)
* yabause_threaded- [https://github.com/libretro/yabause](https://github.com/libretro/yabause)

# Variables and usage

## Supported variables
* EJS_player- The id of the div you want the libretro canvas to render into.
* EJS_gameUrl- The full URL to the game to load.
* EJS_core- The libretro core to use.
* EJS_biosUrl- Bios URL will be loaded into libretro's system directory, a zip file will be unzipped into this directory.
* EJS_onGameStart- Run a custom function after the game is started.

## Basic setup

The user of the game can bring up the libretro menu by pressing F1 on a keyboard or start+select+L+R on a controller.
You can define scripts to run after startup by using the onGameStart option, IE to go fullscreen on load: 

```
EJS_onGameStart = function() {
  Module.requestFullscreen(false);
}
```

The core can be interacted with while running using the `Module` as seen above to go fullscreen, there are other commands that can be sent also one of the most important being `Module._cmd_savefiles()` this will force an sram dump of the users save data on supported games/cores. You will want to tie this to an unload or hashchange event on your webpage to ensure the user does not need to go into the menu and manually trigger this action. Some other commands are: 

```
_cmd_load_state()
_cmd_save_state()
_cmd_savefiles()
_cmd_take_screenshot()
```

Everything is stored in browser storage using an indexDB there is no integrated logic for downloading the files from the browser, but this can easily be built by interacting with the `fs` directly in the browser. 
All of the code is open, feel free to modify it to your needs, but do not come here for support, none will be provided. These repositories are simply for development participation only.

# Bios files for cores

These can be loaded as is no need to extract or modify them, they will be unzipped to the system directory before core load.
i
* atari800- [https://gateway.pinata.cloud/ipfs/QmXMs7meQMTpKxVbRGPX6b5Lj4Yh4iJhP69K5MbXqM23vS?filename=atari800.zip](https://gateway.pinata.cloud/ipfs/QmXMs7meQMTpKxVbRGPX6b5Lj4Yh4iJhP69K5MbXqM23vS?filename=atari800.zip)
* bluemsx- [https://gateway.pinata.cloud/ipfs/QmUeCQ3vWxe7F1FZzspLSAvHE42cqoo5xEGK3FdEv5pbUp?filename=msx.zip](https://gateway.pinata.cloud/ipfs/QmUeCQ3vWxe7F1FZzspLSAvHE42cqoo5xEGK3FdEv5pbUp?filename=msx.zip)
* bluemsx- [https://gateway.pinata.cloud/ipfs/QmUeCQ3vWxe7F1FZzspLSAvHE42cqoo5xEGK3FdEv5pbUp?filename=msx.zip](https://gateway.pinata.cloud/ipfs/QmUeCQ3vWxe7F1FZzspLSAvHE42cqoo5xEGK3FdEv5pbUp?filename=msx.zip)
* fceumm- [https://gateway.pinata.cloud/ipfs/QmPk9EKQ2aRVHJX91PTJfmfBDiHRzeWuZExT36BAk2sNZL?filename=nes.zip](https://gateway.pinata.cloud/ipfs/QmPk9EKQ2aRVHJX91PTJfmfBDiHRzeWuZExT36BAk2sNZL?filename=nes.zip)
* fuse- [https://gateway.pinata.cloud/ipfs/QmYutEB17S7d9gjkPPZj6YGV9XKWZNC3Uoaycxj3352dVh?filename=spectrum.zip](https://gateway.pinata.cloud/ipfs/QmYutEB17S7d9gjkPPZj6YGV9XKWZNC3Uoaycxj3352dVh?filename=spectrum.zip)
* gambatte- [https://gateway.pinata.cloud/ipfs/QmYXjcLTGdtG9JtDGVg42cWFkW6feYufRPQYGSe6ifESY8?filename=gb.zip](https://gateway.pinata.cloud/ipfs/QmYXjcLTGdtG9JtDGVg42cWFkW6feYufRPQYGSe6ifESY8?filename=gb.zip)
* gearboy- [https://gateway.pinata.cloud/ipfs/QmYXjcLTGdtG9JtDGVg42cWFkW6feYufRPQYGSe6ifESY8?filename=gb.zip](https://gateway.pinata.cloud/ipfs/QmYXjcLTGdtG9JtDGVg42cWFkW6feYufRPQYGSe6ifESY8?filename=gb.zip)
* genesis_plus_gx- [https://gateway.pinata.cloud/ipfs/Qmct6NWgAbSvWW9XenBfJ8U15GiwEgDLNFKhCnhL6TFiad?filename=sega.zip](https://gateway.pinata.cloud/ipfs/Qmct6NWgAbSvWW9XenBfJ8U15GiwEgDLNFKhCnhL6TFiad?filename=sega.zip)
* handy- [https://gateway.pinata.cloud/ipfs/QmTaUUheMwLj5JqTqiZLzUfdUBj9xWikyZY4s72RGfKb9d?filename=lynxboot.img](https://gateway.pinata.cloud/ipfs/QmTaUUheMwLj5JqTqiZLzUfdUBj9xWikyZY4s72RGfKb9d?filename=lynxboot.img)
* mednafen_pce_fast- [https://gateway.pinata.cloud/ipfs/QmVZuSTmjWBbFvsgkV7fp4R1ZmjveK9Fap4Nxi6DhbpZPT?filename=pce.zip](https://gateway.pinata.cloud/ipfs/QmVZuSTmjWBbFvsgkV7fp4R1ZmjveK9Fap4Nxi6DhbpZPT?filename=pce.zip)
* mednafen_psx- [https://gateway.pinata.cloud/ipfs/QmfQTsRzaE4T9LUWnKara8KVyXmoUn2RXzmSHYtDYN8Jr6?filename=psx.zip](https://gateway.pinata.cloud/ipfs/QmfQTsRzaE4T9LUWnKara8KVyXmoUn2RXzmSHYtDYN8Jr6?filename=psx.zip)
* melonds- [https://gateway.pinata.cloud/ipfs/QmciBpXM6i1nPSyjKv7tJYmWS7NGXtfKX2EtFmTJ4iomas?filename=nds.zip](https://gateway.pinata.cloud/ipfs/QmciBpXM6i1nPSyjKv7tJYmWS7NGXtfKX2EtFmTJ4iomas?filename=nds.zip)
* o2em- [https://gateway.pinata.cloud/ipfs/QmcXRfDzhsEnWnMykpVwQc86kZXKXgbWMKuXf3HNzXnWKN?filename=odyssey2.zip](https://gateway.pinata.cloud/ipfs/QmcXRfDzhsEnWnMykpVwQc86kZXKXgbWMKuXf3HNzXnWKN?filename=odyssey2.zip)
* prboom- [https://gateway.pinata.cloud/ipfs/QmaYzUXDqtjYDhveavbyh34EtJsfa8smuQayvfHKDoruBE?filename=prboom.wad](https://gateway.pinata.cloud/ipfs/QmaYzUXDqtjYDhveavbyh34EtJsfa8smuQayvfHKDoruBE?filename=prboom.wad)
* prosystem- [https://gateway.pinata.cloud/ipfs/QmcHsJd8dzc4gKwd3cmibFBAgBw3X7pswzdLsWSBG8Ngs7?filename=atari7800.zip](https://gateway.pinata.cloud/ipfs/QmcHsJd8dzc4gKwd3cmibFBAgBw3X7pswzdLsWSBG8Ngs7?filename=atari7800.zip)
* snes9x- [https://gateway.pinata.cloud/ipfs/Qme4WxcE38pAZePr3jbHp4h3c9Bu23K7Gt7PNkVHU4x14e?filename=snes.zip](https://gateway.pinata.cloud/ipfs/Qme4WxcE38pAZePr3jbHp4h3c9Bu23K7Gt7PNkVHU4x14e?filename=snes.zip)
* vba_next- [https://gateway.pinata.cloud/ipfs/QmYtDaErc2RzWBYLmcwfKD81NSVjqBsGD6cJCk3kNzDyuk?filename=gba.zip](https://gateway.pinata.cloud/ipfs/QmYtDaErc2RzWBYLmcwfKD81NSVjqBsGD6cJCk3kNzDyuk?filename=gba.zip)
* yabause- [https://gateway.pinata.cloud/ipfs/QmWfQo5YDDx7w4PRHFCLUcWWuhiD6L42h2AGm3RojJwXKo?filename=saturn.zip](https://gateway.pinata.cloud/ipfs/QmWfQo5YDDx7w4PRHFCLUcWWuhiD6L42h2AGm3RojJwXKo?filename=saturn.zip)

# Rom Hacks Support
Retroarch supports [Softpatching](https://docs.libretro.com/guides/softpatching/), which will apply a patchfile to the base rom on launch. In order to leverage this feature you will need to prepare a custom zip file ending with the file extension ".patchzip". Lets take a popular hack "Invictus" as an example for snes. You will need to create a zip file named "Invictus.smc.patchzip" (note the two file extensions with smc indicating the extension of the base rom) containing the following files:

* Invictus.smc - base rom file to be patched in this case SMW.
* Invictus.bps - Patch file to be applied.

Multiple patch files can be applied as long as they follow this naming scheme ending in the order to be loaded IE:

* Invictus.smc - base rom file to be patched in this case SMW.
* Invictus.bps - First patch file to be applied.
* Invictus.bps1 - Second patch file to be applied.

# MAME roms with chds

mame_2003_plus roms need to be **full non-merged** roms in order to function. These are the zips that contain everything from the bios, to parent, to clones. In order to get games with chd files to load we have a custom file format that can be loaded by the extension ".multizip". To create this file simply zip the rom zip and the chd file (no folders) into a single file. IE if you had the file kinst.zip and the folder kinst/kinst.chd simply move the kinst.zip file into the kinst folder and create the archive using `zip kinst.multizip kinst.zip kinst.chd`. This multizip file will be unpacked before the emulator is loaded into the directory it is looking for the files.

# Threaded emulators

Some emulators might have a threaded option, in order for these to function on the client they need to have specific security headers set on the actual web host of the files so `SharedArrayBuffer` can be used in the clientside browser. They also need to be served from an HTTPS endpoint as these are the sandboxing requirements for modern browsers.

In Nodejs:

```
app.use(function(req, res, next) {
  res.header("Cross-Origin-Embedder-Policy", "require-corp");
  res.header("Cross-Origin-Opener-Policy", "same-origin");
  next();
});
```

In NGINX:

```
  add_header Cross-Origin-Opener-Policy same-origin;
  add_header Cross-Origin-Embedder-Policy require-corp;
```

# Code Reference

The source code these cores are build against is located [HERE](https://github.com/thelamer/retrostash).
