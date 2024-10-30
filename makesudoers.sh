#!/bin/env sh
# Make the sudoers file for fvwm-crystal
sudoersfile="fvwm-crystal.sudoers.d"

echo -n "" > "${sudoersfile}"
writefile() {
	for execname in shutdown reboot halt mount umount \
		pm-suspend pm-hibernate pm-suspend-hybrid pm-powersave \
		systemctl loginctl ; do
		if [ -e ${1}/${execname} ] ; then
			echo "%fvwm-crystal ALL=(ALL) NOPASSWD: ${1}/${execname}" >> "${sudoersfile}"
		fi
	done
}

checkpath() {
	for path in /bin /usr/bin /usr/sbin /sbin ; do
		writefile $path
	done
}
checkpath

echo "Done making sudoers fvwm-crystal file with content:"
cat "${sudoersfile}"
