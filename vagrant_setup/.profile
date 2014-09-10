# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export GOHOME=$HOME/go

# Set up go home unless we already have one
if [ ! -d "$GOHOME" ] ; then
    ln -s /vagrant_go $GOHOME
fi
# access golang executables
export PATH=$PATH:/usr/local/go/bin

# set (trivial) GOPATH
export GOPATH=$GOHOME
