# -------------------------------------
# Environment variables
# -------------------------------------
## Enable Japanese in SSH connection established
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Editor
export EDITOR=/usr/local/bin/vim
export BIN=/bin:/usr/bin:/usr/local/bin:${BIN}
# export VSCODE="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# -------------------------------------
# Zsh options
# -------------------------------------
## Turn on completion
autoload -U compinit
compinit

## Turn on autocorrection
setopt correct

## Turn off beep
setopt nobeep

## Substitutions within prompts do not affect the command status
setopt prompt_subst

## Disable disconnecting a session with ^D
setopt ignoreeof

## Notify right after finishing a background job
setopt no_tify

## Do not add duplicates of the previous event to the history
setopt hist_ignore_dups

## Disable changing the order of files with tab
unsetopt auto_menu

## Jump to a past directory with cd -[tab]
setopt auto_pushd

## Perform the cd command with just a directory name
setopt auto_cd

# -------------------------------------
# Path
# -------------------------------------
## Delete the duplicates automatically
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# Prompt
# -------------------------------------
autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

OK="🍺 "
NG="💩 "

PROMPT=""
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+="%F{blue}%~%f"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="%% "

RPROMPT="[%*]"

# ----------------------
# Command line Aliases
# ----------------------
## -n [show line number], -I [ignore binary files and ignore svn relation]
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

## ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# ----------------------
# Tree Aliases
# ----------------------
## -N [prevent from garbage characters and color files]
alias t="tree -NC"

## show files in a level
alias tl="t -L"

## show dotfiles
alias ta="t -a"

## show relative paths
alias tp="t -f"

## show file size
alias ts="t -h"

alias tla="ta -L"
alias tlp="tp -L"
alias tls="ts -L"
alias tt="tl 1"
alias tta="tla 1"


# ----------------------
# Git Aliases
# ----------------------
## git
alias g="git"

#status
alias gs="g status -s"

## branch
alias gb="g branch"
alias gbr="g branch -r"
alias gba="g branch -a"
alias gbd="g branch -d"

## add
alias ga="g add"
alias gaa="g add ."
alias gaaa="g add -A"
alias gaas="g add . && g status"

## commit
alias gc="g commit"
alias gcm="g commit -m"
alias gca="g commit --amend"

## checkout
alias gch="g checkout"
alias gchb="g checkout -b"
alias gchm="g checkout master"
alias gchd="g checkout develop"

## fetch
alias gfch="g fetch"
alias gfchr="g fetch origin && g remote prune origin"

## merge
alias gm="g merge"
alias gmnf="g merge --no-ff"

## diff
alias gd="g diff"
alias gd1="g diff HEAD~"
alias gd2="g diff HEAD~2"
alias gd3="g diff HEAD~3"

## show
alias gsh="g show"

## push
alias gpsh="g push origin"

## pull
alias gpl="g pull origin && g rev-parse --abbrev-ref HEAD"
alias gplr="g pull --rebase"

## stash
alias gst="g stash"
alias gstl="g stash list"
alias gstp="g stash pop"
alias gstd="g stash drop"

## grep
alias gg="g ls-files | grep -i"
function ggc() {
  git log --all --grep="$1";
}

## log
alias gl="g log"
alias glg='g log --graph --oneline --decorate --all'
alias gld='g log --pretty=format:"%h %ad %s" --date=short --all'
alias grl='g reflog'

## init
alias gi="g init"

## gcl
alias gcl="g clone"


# -------------------------------------
# Key bindings
# -------------------------------------
bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# Other
# -------------------------------------
## Tree -L 1 after cd
function chpwd() { tt }

## Change tab name
function title {
    echo -ne "\033]0;"$*"\007"
}

## Run VSCode
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

## Initialize nodenv, pyenv, rbenv
eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

# --------------------------------------
# Antigen
# --------------------------------------
## Install antigen
source $HOME/antigen.zsh

## Install Powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
antigen theme bhilburn/powerlevel9k powerlevel9k

## Install bundles
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

