# Aliases

~/.aliases

```bash
alias cat='bat'
alias copy='pbcopy'
alias fzf='fzf --keep-right --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias paste='pbpaste'
alias cssh='bash $HOME/environment/config/.cssh/cssh'
alias vim='nvim'
alias vi='vim'
alias tf='terraform'
alias openvpn="open -a OpenVPN\ Connect"
alias mtgo='$HOME/run-mtgo -v $HOME/MTGdecks:/mnt'
alias tree='tree -a'
alias pwgen='pwgen -ysBv'
alias sed='gsed'

function ff() {
  DIR=$1

  if [ -z "$DIR" ]; then
    DIR="."
  fi

  FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git . ${DIR}" fzf | xargs -I {} nvim {}
}

# Execute the last command with sudo
please() {
  sudo $(history |tail -n1 | awk '{$1=""; print $0}')
}

image-size() {
  FILE=$1
  convert $1 -print "Size: %wx%h\n" /dev/null
}

# Adding GPG Keys
addkeys(){
  KEY_TO_ADD=$1
  sudo gpg --recv-key $KEY_TO_ADD
  sudo gpg -a --export  $KEY_TO_ADD | sudo apt-key add -
}
```
