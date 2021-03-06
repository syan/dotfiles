#!/bin/sh

linkfiles=".vimrc .gvimrc"
linkdirs=".vim"
for i in $linkfiles ; do
	if [ ! -f ~/$i ] ; then
		echo "create SimLink:$i"
		ln -s ~/dotfiles/files/$i ~/$i
	fi
done

for i in $linkdirs ; do
	if [ ! -d ~/$i ] ; then
		echo "create SimLink:$i"
		ln -s ~/dotfiles/files/$i ~/$i
	fi
done

if [ ! -d ~/.vimtmp ] ; then
	echo "create vim temporary dir [~/.vimtmp]"
	mkdir -p ~/.vimtmp/backup-files/ 
	mkdir -p ~/.vimtmp/vimswp/
fi

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/neobundle ] ; then
	echo "clone neobundle"
	git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle
	mkdir -p ~/.vim/bundle/neobundle/plugins/

	vim -c ":NeoBundleInstall"
fi
