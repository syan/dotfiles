# environment {{{
# = LANG {{{
export LANG=ja_JP.UTF-8
# }}}
# = path {{{
fpath=($HOME/.zsh/functions $HOME/.zsh/completion $HOME/.zsh/percol-sources $fpath)

# percol-sources
for f in $HOME/.zsh/percol-sources/*; do
	echo "percol:${f}"
	source "${f}"
done;

# }}}
# = キーバインド {{{
bindkey -v

# インサートモードでC-p, C-nで履歴巡り
bindkey -v '^P' history-beginning-search-backward
bindkey -v '^N' history-beginning-search-forward

bindkey -v '^rh' percol-select-history

bindkey -v '^rc' percol-cdr

# }}}
# = history {{{
## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000
# }}}
# = PROMPT {{{
PROMPT="%m[%h]%#"
RPROMPT="[%~]"
# }}}
# = EDITOR {{{
EDITOR=vim
# }}}
###
# Set shell options
###
# setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys
# setopt rm_star_silent sun_keyboard_hack

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
limit coredumpsize 102400
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## TAB で順に補完候補を切り替える
setopt auto_menu
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ヒストリを共有
setopt share_history
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補の色づけ
# eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## ディレクトリ名だけで cd
setopt auto_cd
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
## コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

### zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'
# }}}

alias ctags='/usr/local/bin/ctags'
# alias so='source'
# alias sorc='source ~/.zshrc'

## パスの重複を省く
# typeset -U path cdpath fpath manpath
#typeset -U path
#
## sudo用パス
#typeset -xT SUDO_PATH sudo_path
#typeset -U sudo_path
#sudo_path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

path=(~/bin(N-/) ~/bin-scripts(N-/) /usr/local/bin(N-/) ${path})
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/share/npm/bin:$PATH
export PATH=$HOME/git-tasukete:/Applications/adt-bundle-mac/sdk/platform-tools:/Applications/adt-bundle-mac/sdk/tools:$PATH
rehash # optional

# editor
export EDITOR=vim

# edit in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# gisty
export GISTY_DIR="$HOME/gists"
export GISTY_ACCESS_TOKEN=f6759132bcc966d3e8b710180ebd3dca0d27b5dc

if [ -f $HOME/.zshrc.local ]; then
	source $HOME/.zshrc.local
fi

# functions {{{
# mkcd : mkdir + cd
function mkcd() {
	mkdir -p $1 && cd $1
	pwd
}

# so : source [source_file]
# rcファイルの読み込みをする。
# パラメータを省略した場合は~/.zshrcをロード
function so() {
	if [ $# -eq 0 ] ; then
		echo "source ~/.zshrc"
		source ~/.zshrc
	else
		source $1
	fi
}

# peco plugins

if [ -x $(which peco) ]; then
	function lscd() {
		local target
		
		target=$( ls | peco )
		if [ -n "${target}" ] ; then
			cd "${target}"
		fi
		# zle reset-prompt
	}

	zle -N lscd
	echo "load lscd"

	function peco_ghq_cd() {
	local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
		if [ -n "$selected_dir" ]; then
			BUFFER="cd ${selected_dir}"
			zle accept-line
		fi
		zle clear-screen
	}
	zle -N peco_ghq_cd
	bindkey '^]' peco_ghq_cd
	
fi

# }}}

# plugins {{{
# bookmark : {{{
# ZSH Directory Bookmarks
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias | grep -e "g[0-9]=" | grep -v "m[0-9]" | sed "s/^g/alias g/g" > ~/.bookmarks'
alias lma='alias | grep -e "g[0-9]=" | grep -v "m[0-9]" | sed "s/^g/alias g/g"'
touch ~/.bookmarks
source ~/.bookmarks
# }}}
# }}}

# direnv {{{
if [ -x $(which direnv) ]; then
	eval "$(direnv hook $0)"
fi
# }}}

# z.sh {{{
if which brew > /dev/null; then
	_Z_CMD=j
	. `brew --prefix`/etc/profile.d/z.sh
fi
# }}}

# percol_select_directory {{{
function percol_select_directory() {
	local percol
	local tac

	percol="percol"
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	local dest=$(_z -r 2>&1 | eval $tac | ${percol} --query "$LBUFFER" | awk '{ print $2 }')
	if [ -n "${dest}" ]; then
		cd ${dest}
	fi
	zle reset-prompt
}
zle -N percol_select_directory
alias jj=percol_select_directory
#bindkey "^X^J" percol_select_directory
# }}}
#
#

# gitignore {{{
function gi() {
	curl "http://www.gitignore.io/api/$@"
}
zle -N gi

# }}}

export GL_ENABLE_DEBUG_ATTACH=YES

# {{{
alias zp="tmux capture-pane -S -10000\; show-buffer | vim +10000 -Rc 'set ft=vimshell ts=8 nolist nonu' -"
# }}}
