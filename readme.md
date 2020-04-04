## [Hildigerr's Arch Packages](https://hildigerr.github.io/arch-repo/)

This is my [custom repository](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Custom_local_repository) for packages that I use on my [Arch Linux](https://www.archlinux.org/) systems. [You can make one too](https://github.com/hildigerr/arch-repo/tree/forkme).

### Enable This Repository

To use this repository add the following to your `/etc/pacman.conf` file:

```markdown
[hildigerr]
SigLevel = Optional TrustAll
Server = https://hildigerr.github.io/arch-repo/$arch
```

### Available Packages

 - [**Aleph One**](https://alephone.lhowon.org/) is the open source continuation of [Bungie](https://www.bungie.net/)’s Marathon 2 game engine
 - [**app-menu-links**](https://github.com/hildigerr/system-setup/tree/master/apps) adds links to select web apps into the application menu
 - [**brother-mfcj425w**](https://github.com/hildigerr/brother-mfcj425w) [Printer](https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj425w_us) driver with my buffer overflow bugfix
 - [**BugD**](https://github.com/hildigerr/bugd) simple Bug Database using [SQLite](https://www.sqlite.org/index.html) and GTK.
 - [**fbautostart**](https://aur.archlinux.org/packages/fbautostart/) XDG compliant autostarter
 - [**fortune-mod-havamal**](https://code.launchpad.net/~moonsdad/+junk/fortunes-havamal) The Olive Bray translation of The [Havamal](https://www.pitt.edu/~dash/havamal.html) as [fortune](https://www.shlomifish.org/open-source/projects/fortune-mod/) cookies
 - [**grub-theme-victoria**](https://github.com/hildigerr/system-setup/tree/master/grub/victoria) a simple steampunk grub theme that I put together.
 - [**HilDE**](https://github.com/hildigerr/HilDE) is a lightweight desktop environment
 - [**hilde-lxmenu-data**](https://github.com/hildigerr/hilde-lxmenu-data) lxmenu data which reincludes game subcategories.
 - [**lwm**](https://www.jfc.org.uk/software/lwm.html) lightweight window manager
 - [**MTag**](http://github.com/hildigerr/mtag) music file tag manipulator
 - [**ttf-toroid**](https://github.com/hildigerr/font-toroid) is [Droid fonts](http://www.droidfonts.com) with [slashed zeros](https://en.wikipedia.org/wiki/Slashed_zero) (provides ttf-font)
 - [**xdg-launcher**](https://github.com/hildigerr/xdg-launcher) to enfoce XDG Base Directory compliance for any application. 

### TODO:

 - Add packages which are available for [Ubuntu](https://ubuntu.com/) via [my PPA](https://launchpad.net/~moonsdad/+archive/ubuntu/ppa)
