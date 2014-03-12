# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github colorize colored-man cp macports battery)

source $ZSH/oh-my-zsh.sh

## never ever beep ever
setopt NO_BEEP

# FIXME!
# function cpu {
#     echo `cat /proc/loadavg | awk '{print $1}'` 2>/dev/null
# }

function mem {
    echo `ps aux | awk '{ sum+=$4 }; END {print sum}'` 2>/dev/null
}

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
PROMPT="
%{$fg_bold[magenta]%}%n%{$reset_color%}\
%{$fg_no_bold[yellow]%}@\
%{$fg_bold[blue]%}$(box_name)%{$reset_color%} \
%{$fg[yellow]%}in \
%{$fg_bold[green]%}${current_dir}%{$reset_color%}\
${git_info} 
%{$fg_bold[red]%}ᗈ %{$reset_color%}"

RPROMPT="%{$fg_bold[yellow]%} -- %*  %W -- %{$reset_color%}"


# if [[ "$OSTYPE" =~ ^darwin ]]; then
#     RPROMPT="\
#     %{$fg_bold[yellow]%} -- %*  %W \
#     %{$fg_bold[green]%} ${battery_pct}%%\
#     %{$fg_bold[yellow]%} -- %{$reset_color%}"
# else
#     RPROMPT="\
#     %{$fg_bold[yellow]%} -- %*  %W -- %{$reset_color%}"
# fi

PATH=/opt/local/bin:/opt/local/sbin:/usr/texbin:\
/Users/stharding/anaconda/bin:/Users/stharding/bin:\
/Users/stharding/.scala-2.10.2/bin:$PATH
PATH=$PATH:/Users/stharding/anaconda/bin/
export PATH

# eval $(ssh-agent) >/dev/null 2>&1 


#Uses vim for less
VLESS=$(find /usr/share/vim -name 'less.sh')
if [ ! -z $VLESS ]; then
  alias less=$VLESS
fi

# Start/Reuse SSH Agent - restart or re-use an existing agent
if [[ "$OSTYPE" =~ ^darwin ]]; then
    SSH_AGENT_CACHE=/tmp/ssh_agent_eval_`whoami`
    if [ -s "${SSH_AGENT_CACHE}" ]
    then
        echo "Reusing existing ssh-agent"
        eval `cat "${SSH_AGENT_CACHE}"`
        # Check that agent still exists
        kill -0 "${SSH_AGENT_PID}" 2>/dev/null
        if [ $? -eq 1 ]
        then
            echo "ssh-agent pid ${SSH_AGENT_PID} no longer running"
            # Looks like the SSH-Agent has died, it'll be restarted below
            rm -f "${SSH_AGENT_CACHE}"
        fi
    fi

    if [ ! -f "${SSH_AGENT_CACHE}" ]
    then
        echo "Starting new ssh-agent"
        touch "${SSH_AGENT_CACHE}"
        chmod 600 "${SSH_AGENT_CACHE}"
        ssh-agent >> "${SSH_AGENT_CACHE}"
        chmod 400 "${SSH_AGENT_CACHE}"
        eval `cat "${SSH_AGENT_CACHE}"`
        ssh-add ~/.ssh/id_rsa
    fi
fi
# Load my aliases/functions:
. ~/.aliases
. ~/.functions

# . /Users/stharding/screen-ssh-agent

