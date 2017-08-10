# call valgrind with os x lion suppressions
alias valgrind='valgrind --suppressions=/Users/stharding/.valgrind/darwin11.supp'

# Show local and external ip addresses
alias ip="echo 'local ip(s): '; ipconfig getifaddr en0 ; ipconfig getifaddr en1 ; echo 'extern: ' ; dig +short myip.opendns.com @resolver1.opendns.com"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# prevent sleeping
alias noidle="pmset noidle"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# command line speedtest
alias speed="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

# open shorthand
alias o="open"
alias oo="open ."

# Textmate aliases
alias mm="mate ."
alias m="mate"

# Limit ping to 5 pings
alias ping="ping -c 5"

# SSH Aliases
alias moons="ssh stharding@moons.cs.unm.edu"
alias trucks="ssh stharding@trucks.cs.unm.edu"
alias yuba="ssh stharding@yuba.cs.unm.edu"
alias unm="ssh sth2357@linux.unm.edu"
alias fordyce="ssh stharding@fordyce.cs.unm.edu"
alias adaptive="ssh stharding@adaptive.cs.unm.edu"
alias greenriver=" ssh stharding@greenriver"
alias rsub="rsub real"
alias real="ssh real"
alias prime="ssh prime"
alias realtunnel="ssh -f -N -L5005:127.0.0.1:5005 real"
alias rt="realtunnel"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"

# for red stderr
# export DYLD_INSERT_LIBRARIES="/Users/stharding/repos/stderred/build/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"

#Open Man page in Preview
function pman() 
{
  man -t "${1}" | open -f -a /Applications/Preview.app
}

# add my RSA public key to the authorized_keys file on a remote machine
function key()
{
  #printf "argc: $#\n"
  if [ -z $1 ]; then
    printf "USAGE: key HOST\n"
    printf "  where HOST is the remote host where you want to put your public key\n"
  else
    cat ~/.ssh/id_rsa.pub \
      | ssh $1 "mkdir .ssh 2>/dev/null; cat >> .ssh/authorized_keys"
    printf "put public key in .ssh/authorized_keys on $1\n"
  fi
}


# Create a new directory and enter it
function md()
{
  mkdir -p "$@" && cd "$@"
}

# print to the CS Lab printer in FEC309
function printlab()
{
  ssh stharding@moons "lp -d fec309" < "$1"
}

function ..()
{
  cd ..
}

function ...()
{
  cd ../../
}

function sprunge()
{
  if [ -z $1 ]; then
    printf "USAGE:\n"
    printf "  sprunge FILE\n"
    printf "  the sprunge url will be in the system clipboard\n"
  else
    cat $1 | curl -F 'sprunge=<-' http://sprunge.us | pbcopy
  fi
}

# cat out | curl -F 'sprunge=<-' http://sprunge.us

# Allows an arbitrary command to be executed and not show up in the history
# USAGE: quiet COMMAND ARGS
function quiet()
{
  TMP=$(history | tail -1 | awk '{print $1}') && history -d $TMP && $@
}

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && \
    complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config \
    | grep -v "[?*]" \
    | cut -d " " -f2)" scp sftp ssh


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

PATH=/opt/local/bin:/opt/local/sbin:/usr/texbin:/Users/stharding/bin:$PATH
export PATH

eval $(ssh-agent) >/dev/null 2>&1 

. ~/.bash_prompt
. ~/.bashrc

# added by Anaconda 1.6.1 installer
export PATH="/Users/stharding/anaconda/bin:$PATH"

# added by Anaconda2 2.4.1 installer
export PATH="/Users/harding/anaconda/bin:$PATH"
