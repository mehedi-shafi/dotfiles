# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval $(/opt/homebrew/bin/brew shellenv)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shopup/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git battery)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# export ANDROID_NDK_HOME="/run/media/shafi/nest_of_things/LinuxApps/android-ndk-r19b"
export ANDROID_SDK_HOME='/run/media/shafi/nest_of_things/LinuxApps/as-files/.android'
export ANDROID_AVD_HOME='/run/media/shafi/nest_of_things/LinuxApps/as-files/.avd'
export GRADLE_USER_HOME='/run/media/shafi/nest_of_things/LinuxApps/gradle'
# export PATH=$PATH:$ANDROID_SDK_HOME
# export PATH=$PATH:$GRADLE_USER_HOME

# export FLUTTER_PATH="/run/media/shafi/personal/APPLICATIONS/flutter/bin"
# export PATH=$PATH:$ANDROID_NDK_HOME
# export PATH=$PATH:$FLUTTER_PATH

# exports for react native supports
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$ANDROID_HOME/platform-tools:$PATH

# source /home/shafi/anaconda3/etc/profile.d/conda.sh  # commented out by conda initialize
# darwin
# source /Users/shopup/opt/anaconda3/etc/profile.d/conda.sh

neofetch

# adb='/run/media/shafi/personal/Android-sdk/platform-tools/adb'

# tesseract language pack directory
# export TESSDATA_PREFIX="/run/media/shafi/materials/Python/tessdata"
export LD_LIBRARY_PATH=/usr/local/lib/
# xrdb merge ~/.Xresources
# source /home/shafi/anaconda3/etc/profile.d/conda.sh
alias GET_MY_IP="curl https://ipinfo.io/ip"
alias cs="xclip -selection clipboard"
alias paste="xclip -out -selection clipboard"
# source /etc/profile.d/vte.sh

searchAll() {
  find / -name "$1" -type f 2>/dev/null | xargs grep "$1"
}

search(){
  find . -name "$1" -type f 2>/dev/null | xargs grep "$1"
}

alias line-count="git ls-files | while read f; do git blame -w -M -C -C --line-porcelain "$f" | grep -I '^author '; done | sort -f | uniq -ic | sort -n"
EDITOR=vim

function is_reachable {
  ping -c 1 -W 1 $1 &>> /dev/null && echo "$1 reachable" || echo "$1 not reachable"
}

function get_token {
        curl --request POST \
     --url "http://$1/api/auth/token/login" \
     --header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
     --form username=$2 \
     --form password=$3 | jq -r '.auth_token' | cs
}

export TERM=xterm-256color
export TRILIUM_DATA_DIR=/run/media/shafi/nest_of_things/Personal/trilium-data

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# re-touch kazam made video
# Video produced by kazam is often not playable using video players
function retouch_kazam { 
	ffmpeg -y -i $1 -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 192k -ar 48000 "temp_$1_output_file.mp4"
	mv "temp_$1_output_file.mp4" $1
}
# alias python=python3
# alias pip=pip3

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

export DOCKER_DEFAULT_PLATFORM=linux/amd64
export LOCAL_DEV_PATH="${HOME}/dev"

eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_github
# update GOPRIVATE if accessing go libraries from PRIVATE repos.
export GOPRIVATE="github.com/shopuptech"
export GOPATH=~/go
export GOBIN="${GOPATH}/bin"
export PATH="${PATH}:${GOBIN}"

# alias ibrew="arch -x86_64 brew"
# export PATH="/usr/local/homebrew/bin:$PATH"


