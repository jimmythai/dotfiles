# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# プロンプト
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
# -n [show line number], -I [ignore binary files and ignore svn relation]
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# ----------------------
# Tree Aliases
# ----------------------
# -N [prevent from garbage characters and color files]
alias t="tree -NC"

# show files in a level
alias tl="t -L"

# show dotfiles
alias ta="t -a"

# show relative paths
alias tp="t -f"

# show file size
alias ts="t -h"

alias tla="ta -L"
alias tlp="tp -L"
alias tls="ts -L"
alias tt="tl 1"
alias tta="tla 1"


# ----------------------
# Git Aliases
# ----------------------
# git
alias g="git"

#status
alias gs="g status -s"

# branch
alias gb="g branch"
alias gbr="g branch -r"
alias gba="g branch -a"
alias gbd="g branch -d"

# add
alias ga="g add"
alias gaa="g add ."
alias gaaa="g add -A"
alias gaas="g add . && g status"

# commit
alias gc="g commit"
alias gcm="g commit -m"
alias gca="g commit --amend"

# checkout
alias gch="g checkout"
alias gchb="g checkout -b"
alias gchm="g checkout master"
alias gchd="g checkout develop"

# fetch
alias gfch="g fetch"
alias gfchr="g fetch origin && g remote prune origin"

# merge
alias gm="g merge"
alias gmnf="g merge --no-ff"

# diff
alias gd="g diff"
alias gd1="g diff HEAD~"
alias gd2="g diff HEAD~2"
alias gd3="g diff HEAD~3"

# show
alias gsh="g show"

# push
alias gpsh="g push origin"

# pull
alias gpl="g pull origin && g rev-parse --abbrev-ref HEAD"
alias gplr="g pull --rebase"

# stash
alias gst="g stash"
alias gstl="g stash list"
alias gstp="g stash pop"
alias gstd="g stash drop"

# grep
alias gg="g ls-files | grep -i"
function ggc() {
  git log --all --grep="$1";
}

# log
alias gl="g log"
alias glg='g log --graph --oneline --decorate --all'
alias gld='g log --pretty=format:"%h %ad %s" --date=short --all'
alias grl='g reflog'

# init
alias gi="g init"

# gcl
alias gcl="g clone"


# -------------------------------------
# キーバインド
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
# tree -L 1 after cd
function chpwd() { tt }

# change tab name
function title {
    echo -ne "\033]0;"$*"\007"
}
