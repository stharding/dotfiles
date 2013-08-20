# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias ls="ls -G -F"
else
    alias ls="ls --color -F"
fi

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias l="ls"
alias sl="ls" # because I am always doing this ...

# always colorize calls to tree
alias tree='tree -C'


PROMPT_COMMAND='echo "$(history 1 | grep "defaults")" | sed '/^$/d' >> ~/.defaults'
#cat .ssh/id_rsa.pub | ssh stharding@yuba.cs.unm.edu "cat >> .ssh/authorized_keys"

export QUICK_LISP=~/quicklisp
export LISP_STACK=$((30*1024))
export HISTFILESIZE=9000
export HISTSIZE=9000