# zmodload zsh/zprof # top of your .zshrc file

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sudo
  python
  # kubectl
  # zsh-aws-vault
  fasd
  asdf
)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all  
setopt correct
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

eval "$(fasd --init auto)"

ctags=“/usr/local/bin/ctags”


setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#source ~/.python.dot.sh
source ~/.functions.dot.sh
source ~/.kube.dot.sh
source ~/.aliases


# Less config
  # i - Causes searches to ignore case; that is, uppercase and lowercase are considered identical.
    # This option is ignored if any uppercase letters appear in the search pattern; in other words, if  a  pattern contains uppercase letters, then that search does not ignore case.
  # M - Causes less to prompt even more verbosely than more.
  # F - Scroll  forward,  and keep trying to read when the end of file is reached.
    # Normally this command would be used when already at the end of the file.  It is a way to monitor the tail of a file which is growing while it is being viewed.
    # (The behavior is similar to the "tail -f" command.)
  # X - Disables  sending  the  termcap  initialization  and deinitialization strings to the terminal.
    # This is sometimes desirable if the deinitialization string does something unnecessary, like clearing the screen.
  # S - Causes  lines  longer  than  the screen width to be chopped (truncated) rather than wrapped.
    # That is, the portion of a long line that does not fit in the screen width is not shown.
    # The default is to wrap long lines; that is, display the remainder on the next line.
  # x4 - Sets tab stops.  If only one n is specified, tab stops are set at multiples of n.
    # If multiple values separated by commas are specified, tab stops are set at those positions, and  then  continue  with the same spacing as the last two.
    # For example, -x9,17 will set tabs at positions 9, 17, 25, 33, etc.  The default for n is 8.
  # R - Repaint the screen, discarding any buffered input.
    # Useful if the file is changing while it is being viewed.
export LESS=-iMFXSx4R

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
# Other laptop
#export PATH="$HOME/Library/Python/3.7/bin:$PATH"
#export PATH="$HOME/Code:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# TODO Lazy load NVM
# Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use Brew Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0:$PATH
# export PATH=/Library/Python/2.7/bin:$PATH

# Split by language node.dot.sh; go.dot.sh; python.dot.sh
# export PROMPT="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(prompt_aws_vault_segment) $(git_prompt_info)"
# export PROMPT='$(prompt_aws_vault_segment) ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

export PROMPT_SUBST=1
#export KUBE_CONTEXT=$(kubectl config current-context 2>&1 | awk -F '-' '{gsub("Staging","",$2);$2=tolower($2);print $2}')

function kube_context {
    kubectl config current-context 2>&1 | awk -F '-' '{gsub(/Staging/,"",$2);$2=tolower($2);print $2}'
}

# export PROMPT='($(kube_context)) '$PROMPT
# export PROMPT='($(kubectl config current-context | awk -F "-" "{print $2}")) '$PROMPT

#autoload -Uz compinit
#if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#  compinit
#else
#  compinit -C
#fi

# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# zprof # bottom of .zshrc

# ─── ASDF (must come before anything that relies on its shims) ───
export ASDF_DIR="$HOME/.asdf"
# load core
[ -f "$ASDF_DIR/asdf.sh" ] && . "$ASDF_DIR/asdf.sh"
# load completions
[ -f "$ASDF_DIR/completions/asdf.bash" ] && . "$ASDF_DIR/completions/asdf.bash"

# ─── Core PATHs ───
# Homebrew, user bins, Poetry, Go
export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:$HOME/.poetry/bin:$GOPATH/bin:$PATH"

# ─── Go stuff ───
export GO111MODULE=on
export GOPATH="$HOME/go"

# ─── AWS auto-complete ───
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# ─── kubectl completion ───
source <(kubectl completion zsh)

# ─── direnv ───
eval "$(direnv hook zsh)"

# ─── other custom scripts ───
source "$HOME/.config/op/plugins.sh"
source "$HOME/.gdg.completions.sh"
. "$HOME/.local/bin/env"

export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=global
export ANTHROPIC_VERTEX_PROJECT_ID=claude-code-483815

# opencode
export PATH=/Users/mickeypashov/.opencode/bin:$PATH
