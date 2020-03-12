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

# fshow - git commit browser
fshow() {
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