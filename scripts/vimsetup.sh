#!/bin/sh

echo "create vim temporary dir [~/.vimtmp]"
mkdir -p ~/.vimtmp/backup-files/ 
mkdir -p ~/.vimtmp/vimswp/

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/neobundle ] ; then
	echo "clone neobundle"
	git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle
	mkdir -p ~/.vim/bundle/neobundle/plugins/

	vim -c ":NeoBundleInstall"
fi

