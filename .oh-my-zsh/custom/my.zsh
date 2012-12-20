
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' completealiases
zstyle :compinstall filename '/home/alx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=99
SAVEHIST=99
setopt autocd
bindkey -e
#bindkey "\e[1~" beginning-of-line # Home
#bindkey "\e[4~" end-of-line # End
#bindkey "\e[5~" beginning-of-history # PageUp
#bindkey "\e[6~" end-of-history # PageDown
#bindkey "\e[2~" quoted-insert # Ins
#bindkey "\e[3~" delete-char # Del
#bindkey "\e[5C" forward-word
#bindkey "\eOc" emacs-forward-word
#bindkey "\e[5D" backward-word
#bindkey "\eOd" emacs-backward-word
#bindkey "\e\e[C" forward-word
#bindkey "\e\e[D" backward-word
#bindkey "\e[Z" reverse-menu-complete # Shift+Tab
## for rxvt
#bindkey "\e[7~" beginning-of-line # Home
#bindkey "\e[8~" end-of-line # End
## for non RH/Debian xterm, can't hurt for RH/Debian xterm
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
## for freebsd console
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line
## for guake
#bindkey "\eOF" end-of-line
#bindkey "\eOH" beginning-of-line
#bindkey "^[[1;5D" backward-word
#bindkey "^[[1;5C" forward-word
#bindkey "\e[3~" delete-char # Del
# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

autoload -U promptinit
promptinit
prompt clint

. /etc/profile

export EDITOR=vim
export BROWSER=chromium
export PAGER='less -R -F -X -S -n -i'
#export PATH="$HOME/bin:$HOME/.gem/ruby/1.9.1/bin:$PATH"
#export GTK_IM_MODULE=xim

# redefinitions
if [ "$(uname -s)" = "Linux" ]; then
	LS_VER=`/bin/ls --version | head -1 | cut -d' ' -f4`
	LS_VER_INT=`echo $LS_VER | cut -d'.' -f1`
	if [ $LS_VER_INT -lt 8 ]; then
		alias ls='ls -hF --color=auto'
	else
		alias ls='ls -hF --color=auto --group-directories-first'
	fi
	alias pgrep='pgrep -lf'
	alias crontab='crontab -i'
elif [ "$(uname -s)" = "FreeBSD" ]; then
	alias ls='ls -hFG'
	alias pgrep='pgrep -laf'
	alias stat="/usr/bin/stat -f \"  File: '%N'%SY%n  Size: %-15z Blocks: %-10b IO Block: %-6k %HT%nDevice: %7Hr/%-7Lr Inode: %-11i Links: %l%nAccess: (%Mp%Lp/%Sp) Uid: (%5u/%8Su)  Gid: (%5g/%8Sg)%nAccess: %Sa%nModify: %Sm%nChange: %Sc%n Birth: %SB\" -t '%F %T %z'"
fi

#alias nc='nc -vv'
#alias grep='grep --color=auto'
#alias killall='killall -v'
#alias scrot='scrot -e "mv \$f ~/Downloads/ 2>/dev/null" -cd 5'
#alias qiv='qiv -fml -M'
#alias fgrep='grep -Frn --color=always'
#alias figrep='fgrep -i'
#alias svn='svn --no-auth-cache'
#alias mysql='mysql --select_limit=1000'
#alias ka='killall'
#alias fsck='fsck -C'

# additionals
alias l='ls -lA'
#alias ds='du -sh'
#alias qivr='qiv -u'
#alias la='cat /proc/loadavg'
#alias ipt='iptables -nvL --line-numbers'
#alias psa='ps axfo pid,euser,bsdstart,vsz,rss,bsdtime,args'
#alias parent='ps -p $PPID -o comm='

# LOL protect me
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# git aliases
alias gb='git branch'
#alias gba='git branch -a'
#alias gc='git commit -v'
#alias gd='git di'
#alias gdc='gd --cached'
#alias gl='git pull'
#alias gp='git push'
alias gst='git status'

# sudo
alias sudo='sudo -E '

# NetMRI
#RAILS=~/netmri/netmri/src/app/rails
#alias rmunv='rm $(svn st | grep "^?" | sed -r "s/^\? +//")'
#alias webui='cd $webui'
#alias dbgrep='dbgrep.pl -vpuroot'

# useful stuff
[ -z "$VIM_ORIGINAL" ] && VIM_ORIGINAL="$(which vim)"
function vim() {
	# we only handle single-argument VIM
	if [ $# -eq 1 ]; then
		if [ -e "$1" ]; then
			# editing an existing file
			FILENAME="$1"
		else
			# trying to create new file, will check it's directory for WRITE access
			FILENAME="`dirname $1 2>/dev/null`"
		fi

		if [ -w "$FILENAME" ]; then
			# yahoo! writable
			"$VIM_ORIGINAL" "$1"
		else
			echo 'this file will be opened with sudo'
			sudo "$VIM_ORIGINAL" "$1" || "$VIM_ORIGINAL" "$1"
		fi
	else
		"$VIM_ORIGINAL" $*
	fi
}

function mkcd() {
	mkdir -p "$*"
	cd "$*"
}
function cpcd() {
	cp "$@"
	cd $_
}
function cdls() {
	cd "$*"
	ls
}

if [ -r ~/.rc_local ]; then
	. ~/.rc_local
fi

if [ -x "$(which dircolors 2>/dev/null)" ]; then
	eval $(dircolors)
fi

webui="$RAILS"

case $- in
	*i*)
		# only with interactive shell
		if [ -n "$SSH_CLIENT" ]; then
			[ "$(parent)" = "screen" ] || screen -RR
		fi
		;;
esac

# vim: ft=sh
