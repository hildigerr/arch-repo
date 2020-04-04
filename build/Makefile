CHROOT="${HOME}/chroot"

xxx:
	@echo -e "Usage: make PACKAGER=\"\$$PACKAGER\" target"

.PHONY: hermit hilde

chroot:
	mkdir -p ${CHROOT}
	mkarchroot ${CHROOT}/root base-devel

fbautostart:
	git clone "https://aur.archlinux.org/fbautostart.git"
	cd fbautostart && makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"

hermit:
	cd hermit && makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"

hilde:
	arch-nspawn ${CHROOT}/root pacman -S xorg-server xorg-xdm xorg-xmessage lwm \
	xbindkeys wmctrl xtrlock imagemagick lxpanel pcmanfm udiskie gvfs
	cd hilde && makechrootpkg -c -r ${CHROOT} \
	-I ../../x86_64/fbautostart-*.pkg.tar.xz -- PACKAGER="${PACKAGER}"
	arch-nspawn ${CHROOT}/root pacman -Rs xorg-server xorg-xdm xorg-xmessage lwm \
	xbindkeys wmctrl xtrlock imagemagick lxpanel pcmanfm udiskie gvfs

medit:
	git clone "https://aur.archlinux.org/medit.git"
	arch-nspawn ${CHROOT}/root pacman -S libsm
	cd medit && makechrootpkg -c -r ${CHROOT} \
	-I ../../x86_64/pygtk-*.pkg.tar.xz -- PACKAGER="${PACKAGER}"
	arch-nspawn ${CHROOT}/root pacman -Rs libsm

pygtk:
	git clone "https://aur.archlinux.org/pygtk.git"
	cd pygtk && makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"

