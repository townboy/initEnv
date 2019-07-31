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

#helpful shell function

cpe () {
    local file="${1}"
    local dir="${2}/"
    
    if ! test -r ${file}
    then
        echo "file not exist"
        return
    fi

    if ! test -d ${dir}
    then
        echo "dir not exist"
        return
    fi

    local file2=${dir}${file}
    echo ${file2}

    if test -r ${file2}
    then
        echo "exist same file"
        local f1m=$(md5sum ${file})
        local f2m=$(md5sum ${file2})
        echo ${f1m}
        echo ${f2m}
        if [ ${f1m:0:32} != ${f2m:0:32} ]
        then
            echo "file mismatch"
        else
            echo "same file"
            rm ${file}
        fi
    else
        echo "no same file, start mv"
        mv ${file} ${dir}
    fi
}
