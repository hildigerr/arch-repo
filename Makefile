
add:
	repo-add --verify --key ${GPGKEY} -R x86_64/hildigerr.db.tar.xz x86_64/*.pkg.tar.xz

hardlink:
	rm -f x86_64/*.old x86_64/hildigerr.db x86_64/hildigerr.files
	ln x86_64/hildigerr.db.tar.xz x86_64/hildigerr.db
	ln x86_64/hildigerr.files.tar.xz x86_64/hildigerr.files

index:
	@ls -l --time-style="+%d-%b-%Y %H:%M" x86_64/ \
	| awk {'print "<a href=\""$$8"\">\n"$$8"</a>    "$$6" "$$7"        "$$5'} \
	>> x86_64/index.html
	@echo "Now edit: x86_64/index.html"
