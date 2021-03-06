#!/usr/bin/env bash
#
# Installs all dotfiles in this directory
# into the home directory using rsync.
#
# ./bootstrap.sh

git pull origin master;

function doIt() {
	rsync \
		--exclude ".git/" \
		--exclude "bootstrap.sh" \
		--exclude "get-docker.sh" \
		--exclude "install_packages.sh" \
		--exclude "pre_bootstrap.sh" \
		--exclude "screen.png" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
