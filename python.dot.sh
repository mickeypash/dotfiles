# Enable Pyenv
export PYTHONSTARTUP=~/.pythonstartup.py


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# virtualenvwrapper
# lazy loading saves on shell startup time
workon() {
  [ -z "$PROJECT_HOME" ] && {
    unset -f workon;
    #export PROJECT_HOME=/server/python/;
    source /usr/local/bin/virtualenvwrapper.sh
    }
  workon "$@"
}


function ,pypath {
    # usage: ,pypath [--prepend] [<directories>]
    #
    # Adds current directory or given directories to path. If --prepend not
    # given, directories are appended.
    #
    # Also updates $_OLD_VIRTUAL_PATH set by Python's virtualenv, so that path
    # changes persist through a venv deactivate command.
    if [[ -z "$1" ]]; then
        echo 'PYTHONPATH: '
        IFS=: eval printf "%s\\\n" \$${1:-PYTHONPATH}
        return 0
    fi

    if [[ $1 = "--prepend" ]]; then
        prepend=true
        paths=(${@:2})
    else
        prepend=false
        paths=($@)
    fi

    if [ -z "$paths" ]; then
        paths[0]=$PWD
    fi

   for path in "${paths[@]}"; do

       # Ignore paths that don't exist
       if [ ! -f "$path" ] && [ ! -d "$path" ]; then
           continue
        fi

        fullpath="$(cd "$path"; echo $PWD)"

        if [[ ":$PYTHONPATH:" != *":$fullpath:"* ]]; then

            if [[ "$prepend" = true ]]; then
                export PYTHONPATH="$fullpath:$PYTHONPATH"
            else
                export PYTHONPATH="$PYTHONPATH:$fullpath"
            fi
        fi
    done
   ,pypath
}
