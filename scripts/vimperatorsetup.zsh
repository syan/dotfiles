#!/bin/zsh

SRCDIR="$HOME/git/vimperator-plugins/"
DSTDIR="$HOME/.vimperator/plugin/"

PLUGINLIST="vimp_plugins"
LIST=( $(cat $PLUGINLIST) )


# echo $LIST
# echo ${LIST[1]}

echo $SHELL

for i in $LIST; do
	if [[ $i == \#* ]] then
		fname=${i#\#}
		if [[ -h ${DSTDIR}${fname} ]] then
			echo "remove $fname"
			rm ${DSTDIR}${fname}
		else
			#echo "skip $fname"
		fi
	else
		if [[ -h ${DSTDIR}${i} ]] then
			echo "skip $i"
		else
			echo "install $i"
			ln -sf ${SRCDIR}${i} ${DSTDIR}${i}
		fi
	fi
done

