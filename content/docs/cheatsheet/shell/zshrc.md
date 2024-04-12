# ZSH with Oh My Zsh

~/.zshrc

```bash
export ZSH="$HOME/.oh-my-zsh"
export JARVIS_PATH="$HOME/environment"
export PATH=$PATH:$HOME/bin
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export HISTFILESIZE=10000  # Number of commands to keep in history file
export HISTSIZE=10000
export HISTFILE="$HOME/.zsh_history"
export HISTORY_IGNORE="(cd|ls|pwd|exit|l)*"
export LSCOLORS="Dxexdxfxcxbgbdabagaacd"

ZSH_THEME="af-magic"
ENABLE_CORRECTION="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6a6a6a,bg=black'
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
plugins=(git zsh-autosuggestions macos brew colored-man-pages)

[ -e $JARVIS_PATH/cli ] && source $JARVIS_PATH/cli
source <(kubectl completion zsh)
source $HOME/.docker/init-zsh.sh || true
eval "$(fzf --zsh)"
source $ZSH/oh-my-zsh.sh
```

{{< expand "LSCOLORS" >}}

`Dxexdxfxcxbgbdabagaacd` is defined by pairs of the form `AB` where `A` is the foreground color and `B` is the background color. The color designators are as follows:

1: Dx
2: ex
3: dx
4: fx
5: cx
6: bg
7: bd
8: ab
9: ag
10: aa
11: cd

The order of the attributes are as follows:

```bash
1.  directory
2.  symbolic link
3.  socket
4.  pipe
5.  executable
6.  block special
7.  character special
8.  executable with setuid bit set
9.  executable with setgid bit set
10. directory writable to others, with sticky bit
11. directory writable to others, without sticky
```

The color designators are as follows:

```bash
a. black
b. red
c. green
d. yellow/brown
e. blue
f. magenta
g. cyan
h. light grey
A. bold black; usually shows up as dark grey
B. bold red
C. bold green
D. bold yellow; usually shows up as brown
E. bold blue
F. bold magenta
G. bold cyan
H. bold light grey; looks like bright white
x. default foreground or background
```

{{< /expand >}}
{{< figure src="../../../../images/lscolors.png" >}}
