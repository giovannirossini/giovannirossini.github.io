# tmux

~/.tmux.conf

```tmux
set-environment -g PATH "/usr/local/bin:/bin:/usr/bin:/opt/homebrew/bin"
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-open'
set -g prefix C-a
unbind C-b
unbind C-f
bind C-a send-prefix

set -g base-index 1
setw -g pane-base-index 1

set -g mouse on

set -g status on
set -g status-bg black
set -g status-fg white
set-option -g status-position top

set -g status-left "#S"
set -g status-right "#[bold,fg=#a38464]#{battery_percentage} #[bg=#a38464,fg=black]%a %d %b #[fg=black]#[fg=grey,bg=black]%H:%M:%S"

set -g set-titles on
set -g set-titles-string "tmux #T"

setw -g mode-keys vi

set -g default-terminal "screen-256color"

bind r source-file ~/.tmux/tmux.conf \; display "Reloaded .tmux.conf"

bind-key '|' split-window -h -c "#{pane_current_path}"
bind-key '-' split-window -v -c "#{pane_current_path}"

set -g mode-style "fg=black,bg=white"
setw -g window-status-current-style fg=black,bg=#a38464
set -g status-left " "
set -g window-status-format "#[fg=#a38464]#I #W"
set -g window-status-current-format "#[bold,fg=grey,bg=black]#I#[fg=black,bg=#a38464] #W#[fg=#a38464,bg=black]"

bind-key -n C-Left  previous-window
bind-key -n C-Right next-window

bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
bind P paste-buffer
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"

bind-key R command-prompt -p "Rename window to:" "rename-window '%%'"

run-shell ~/.tmux/plugins/tmux-battery/battery.tmux
run '~/.tmux/plugins/tpm/tpm'
set-window-option -g xterm-keys on

bind C-j display-popup -E "\
    tmux list-sessions -F '#{?session_attached,,#{session_activity},#{session_name}}' |\
    sort -r |\
    sed '/^$/d' |\
    cut -d',' -f2- \|
    fzf --reverse --preview 'tmux capture-pane -pt {}'  |\
    xargs tmux switch-client -t"

bind-key -n C-F display-popup -w 75% -h 80% -E "\
    FZF_DEFAULT_COMMAND=\"fd --type f --hidden --follow --exclude .git . $(tmux display-message -p -F '#{pane_current_path}')\" \
    fzf --exact --reverse --keep-right --preview \"bat --color=always --style=numbers --line-range=:500 {}\" |\
    xargs nvim"

bind-key -n C-Space display-popup -h 90% -E "\
    FZF_DEFAULT_COMMAND=\"fd --type d --hidden --follow --exclude .git . $(tmux display-message -p -F '#{pane_current_path}')\" \
    fzf --preview-window='down:50%' --exact --reverse --keep-right --preview 'ls -lah {}' |\
    xargs -I % sh -c 'tmux send-keys -t \"$(tmux display-message -p \"#I:#P\")\" \"cd %\" Enter'"

```
