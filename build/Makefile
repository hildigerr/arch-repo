CHROOT="${HOME}/chroot"

xxx:
	@echo -e "Usage: make PACKAGER=\"\$$PACKAGER\" target"

.PHONY: target-template-local

chroot:
	mkdir -p ${CHROOT}
	mkarchroot ${CHROOT}/root base-devel

target-template-aur:
	git clone "https://aur.archlinux.org/$@.git"
	cd $@ && makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"

target-template-local:
	cd $@ && makechrootpkg -c -r ${CHROOT} -- PACKAGER="${PACKAGER}"

