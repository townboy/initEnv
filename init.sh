autoload -Uz promptinit
promptinit
prompt adam1 red

if [ -z ${TMUX} ]; then
	/usr/bin/tmux attach || /usr/bin/tmux
fi

ulimit -c unlimited

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
source $HOME/initEnv/z/z.sh
