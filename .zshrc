# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

EDITOR=vim

#source .zprofile
source ~/.zprofile

# Path to your oh-my-zsh installation.
export ZSH="/home/youm/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="gallois" #pine64 theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  vi-mode
  z
  colored-man-pages
  #per-directory-history
  common-aliases
)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey 'jk' vi-cmd-mode

# make vi mode timeout more responsive, but slow enough to catch 'jk' mapping
export KEYTIMEOUT=50

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# kill whole line in both
bindkey '^U' kill-whole-line
bindkey -M vicmd "^U" kill-whole-line

# change color of autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# rust path
source ~/.cargo/env

# fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# make feh more useful; sort by modify time; auto scale to window
alias feh="feh --scale-down --auto-zoom -S mtime"

# Screenshot helper alias/functions
# copy file from stdin to timestamped file in screenshots dir and put it on the clipboard for putting it in discord, etc.
# its annoying to use aliases/functions from i3-config, so I give up on this, and just hard code it in the config
function save_screenshot_clipboard {
	tee "/home/youm/Pictures/screenshots/$(date '+%s_%a_%b_%d_%H:%M:%S_%Z_%Y').png" | xclip -selection clipboard -t image/png
}

# use config to manage configuration files from config repo
alias conf='/usr/bin/git --git-dir=/home/youm/.cfg/ --work-tree=/home/youm'
compdef _git conf

thingiverseUnzip()
{(  # use a subshell so it doesn't kill terminal when error
    # exit when any command fails

	main_dir=$HOME/Documents/3dprinting
    zip_file=$(find $HOME/Downloads -type f -name '*.zip' -printf "%C@ %p\n" | sort -nr | awk -F ' ' '{print $2}' | fzf)
    basename=$(basename $zip_file)
	subdir=$main_dir/${basename%.zip}

	#echo "creating dir $subdir"
	mkdir -v $subdir || exit 1
	echo "unzipping $zip_file into $subdir"
	unzip $zip_file -d $subdir || exit 1
	echo "removing original file: $zip_file"
	rm $zip_file || exit 1
)}
