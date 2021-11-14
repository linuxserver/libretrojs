# LibretroJS

This repository collects the assets used in [https://github.com/linuxserver/emulatorjs](https://github.com/linuxserver/emulatorjs) and publishes releases that can be embedded into any website.

# Example
```
<div id="game"></div>
<script type="text/javascript">
    EJS_player = '#game';
    EJS_gameUrl = '/your/game/rom.zip';
    EJS_core = 'snes9x';
</script>
<script src="js/vendor/jquery.min.js"></script>
<script src="js/vendor/jquery.hotkeys.js"></script>
<script src="js/vendor/browserfs.min.js"></script>
<script src="js/libretro.js"></script>
```

Simply extract the release into the root of your webserver and try this test page for the `snes9x` emulator.

# Supported emulators

* bluemsx- [https://github.com/libretro/blueMSX-libretro](https://github.com/libretro/blueMSX-libretro)
* fceumm- [https://github.com/libretro/libretro-fceumm](https://github.com/libretro/libretro-fceumm)
* gambatte- [https://github.com/libretro/gambatte-libretro](https://github.com/libretro/gambatte-libretro)
* gearboy- [https://github.com/libretro/Gearboy](https://github.com/libretro/Gearboy)
* genesis_plus_gx- [https://github.com/libretro/Genesis-Plus-GX](https://github.com/libretro/Genesis-Plus-GX)
* handy- [https://github.com/libretro/libretro-handy](https://github.com/libretro/libretro-handy)
* mame2003_plus- [https://github.com/libretro/mame2003-plus-libretro](https://github.com/libretro/mame2003-plus-libretro)
* mgba- [https://github.com/libretro/mgba](https://github.com/libretro/mgba)
* mednafen_ngp- [https://github.com/libretro/beetle-ngp-libretro](https://github.com/libretro/beetle-ngp-libretro)
* mednafen_pce_fast- [https://github.com/libretro/beetle-pce-fast-libretro](https://github.com/libretro/beetle-pce-fast-libretro)
* mednafen_psx- [https://github.com/libretro/beetle-psx-libretro](https://github.com/libretro/beetle-psx-libretro)
* mednafen_vb- [https://github.com/libretro/beetle-vb-libretro](https://github.com/libretro/beetle-vb-libretro)
* mednafen_wswan- [https://github.com/libretro/beetle-wswan-libretro](https://github.com/libretro/beetle-wswan-libretro)
* o2em- [https://github.com/libretro/libretro-o2em](https://github.com/libretro/libretro-o2em)
* prboom- [https://github.com/libretro/libretro-prboom](https://github.com/libretro/libretro-prboom)
* prosystem- [https://github.com/libretro/prosystem-libretro](https://github.com/libretro/prosystem-libretro)
* snes9x- [https://github.com/libretro/snes9x](https://github.com/libretro/snes9x)
* stella2014- [https://github.com/libretro/stella2014-libretro](https://github.com/libretro/stella2014-libretro)
* tyrquake- [https://github.com/libretro/libretro-tyrquake](https://github.com/libretro/libretro-tyrquake)
* vba_next- [https://github.com/libretro/vba-next](https://github.com/libretro/vba-next)
* vecx- [https://github.com/libretro/libretro-vecx](https://github.com/libretro/libretro-vecx)
* virtualjaguar- [https://github.com/libretro/virtualjaguar-libretro](https://github.com/libretro/virtualjaguar-libretro)

# Variables and usage

## Supported variables
* EJS_player- The id of the div you want the libretro canvas to render into.
* EJS_gameUrl- The full URL to the game to load.
* EJS_core- The libretro core to use.
* EJS_biosUrl- Bios URL will be loaded into libretro's system directory, a zip file will be unzipped into this directory.
* EJS_onGameStart- Run a custom function after the game is started.

## Basic setup

By default the script renders in a canvas element and an unstyled fullscreen button with the class `full-button`. Feel free to hide the button or style it absolute to where you need it on your page. The user of the game can bring up the libretro menu by pressing F1 on a keyboard or start+select+L+R on a controller.
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
