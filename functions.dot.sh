function __fzf_history__() {
    local line
    shopt -u nocaseglob nocasematch
    line=$(
        HISTTIMEFORMAT= history | sort -r -k 2 | uniq -f 1 | sort -n |
            FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) |
            command grep '^ *[0-9]'
        ) &&
        if [[ $- =~ H ]]; then
            sed 's/^ *\([0-9]*\)\** .*/!\1/' <<< "$line"
        else
            sed 's/^ *\([0-9]*\)\** *//' <<< "$line"
        fi
}

catr() {
    tail -n "+$1" $3 | head -n "$(($2 - $1 + 1))"
}

function shorten() {
    if [[ -z "$1" ]]; then
        echo 'Give me a URL 🔗'
        return 0
    fi
    pushd ~/Code/mickeys.link/ > /dev/null

    if [[ $1 = "--list" ]]; then
        cat _redirects
    else
        url=$1
        uuid=`uuidgen | cut -c1-6 | tr '[:upper:]' '[:lower:]'`

        revolver start "Your link is being snipped ✂️"
        echo -e "/$uuid\t\t$url\n$(cat _redirects)" > _redirects
        (git add _redirects && git commit -m "updated" && git push -q) > /dev/null
        popd > /dev/null
        revolver stop 

        echo "✨Your link is ready and copied to your clipboard!✨"

        short_url="https://mickeys.link/$uuid"
        echo "$short_url"
        echo "$short_url"| pbcopy
    fi

}

function ,hist-search {
    history | grep -i "$1" | sed 's/^ *[0-9]* *//' | sort | uniq
}

function fzv {
    vim `fzf`
}

function fzs {
    subl `fzf`
}

function fzp {
    pycharm `fzf`
}

function aws-env () {
  # switch AWS environment
  aws-vault exec $1 -- $SHELL -l
}

# fshow - git commit browser
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

function ,date {
    python -c 'from __future__ import print_function; import datetime; print(datetime.datetime.now().isoformat())'
}

function ,g {
    rg -C=2 --smart-case $@
}

function ,github-switch-url {
    git='git@github.com:'
    https='https://github.com/'

    url="$(git remote -v | awk '/^origin.*fetch.$/ {print $2}')"
    echo Old url: "$url"

    if echo "$url" | grep -q '^git'
    then
        url="${url/${git}/${https}}"
    else
        url="${url/${https}/${git}}"
    fi

    echo New url: "$url"
    git remote set-url origin "$url"
}

function ,serve {
    python -m SimpleHTTPServer $@ || python -m http.server $@
}

function ,tmp {
    if [ -t 0 ]; then
        less /tmp/tmp_file
    else
        rm /tmp/tmp_file
        tee /tmp/tmp_file | less - <&0
    fi
}
