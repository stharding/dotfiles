export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="agnoster"

export GIT_PS1_SHOWDIRTYSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=false

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="╰─$ "
# ZSH_THEME="agnoster"

DEFAULT_USER=$(whoami)
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github colorize colored-man)

source $ZSH/oh-my-zsh.sh

## never ever beep ever
setopt NO_BEEP

#. ~/.iterm2_shell_integration.`basename $SHELL`

# Machine name.
# function box_name {
#     [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
# }

# # Directory info.
# local current_dir='${PWD/#$HOME/~}'

# # Git info.
# local git_info='$(git_prompt_info)'
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} on%{$reset_color%} git:%{$fg[cyan]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
# PROMPT="
# %{$fg_bold[magenta]%}%n%{$reset_color%}\
# %{$fg_no_bold[yellow]%}@\
# %{$fg_bold[blue]%}$(box_name)%{$reset_color%} \
# %{$fg[yellow]%}in \
# %{$fg_bold[green]%}${current_dir}%{$reset_color%}\
# ${git_info}
# %{$fg_bold[red]%}ᗈ %{$reset_color%}"

# RPROMPT="%{$fg_bold[yellow]%} -- %*  %W -- %{$reset_color%}"


#Uses vim for less
VLESS=$(find /usr/share/vim -name 'less.sh')
if [ ! -z $VLESS ]; then
  alias less=$VLESS
fi


fpath=(/usr/local/share/zsh-completions $fpath)
rm -f ~/.zcompdump; compinit -u

export NDDSHOME=/Applications/rti_connext_dds-5.2.0
export MOCU4=/Users/harding/repos/mocu4
export MOCU_HOME=$MOCU4
export CSA_DDS_QOS_PROFILE=file:///$MOCU4/vis/vis_firescout/config/ddsqosconfig.xml
export NDDS_QOS_PROFILES=file:///$MOCU4/vis/vis_firescout/config/nddsqosconfig.xml
export DYLD_LIBRARY_PATH=$MOCU4/dist/lib:/Applications/rti_connext_dds-5.2.0/lib/x64Darwin14clang6.0:$DYLD_LIBRARY_PATH:.:$HOME/repos/udt-git/udt4/src
export GOPATH=$HOME/.go
export JTS_COMMON_PATH=$HOME/repos/jaustoolset/GUI/templates/Common

# Load my aliases/functions:
. ~/.aliases
. ~/.functions



# PATH=$HOME/anaconda/bin:/Users/harding/.local/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin:$HOME/bin:$NDDSHOME/bin:$HOME/.go/bin
PATH=$HOME/Library/Python/2.7/bin:/Users/harding/.local/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin:$HOME/bin:$NDDSHOME/bin:$HOME/.go/bin
export PATH

ssh-add -K ~/.ssh/id_rsa

#