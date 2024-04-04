# alacritty

~/.config/alacritty/alacritty.toml

```toml
[env]
TERM = "screen-256color"

[window]
decorations = "Full"
startup_mode = "Fullscreen"
opacity = 0.99
padding = { x = 3, y = 3 }
dimensions = { columns = 100, lines = 50 }

[font]
size = 16.5
normal = { family = "Hack Nerd Font Mono" }

[colors]
primary = { background = '#111110' }
footer_bar = { foreground = '#111110', background = '#a38464' }
draw_bold_text_with_bright_colors = true

[colors.search]
matches = { foreground = '#111110', background = '#ffffff' }
focused_match = { foreground = '#111110', background = '#ffffff' }

[colors.normal]
black = '#111110'
red = '#ff6d67'
green = '#51d765'
yellow = '#e8d14f'
blue = '#5db9e5'
magenta = '#ff76ff'
cyan = '#2aced0'
white = '#ffffff'

[colors.bright]
black = '#111110'
red = '#a63e3a'
green = '#379445'
yellow = '#a38464'  # Brown
blue = '#4683b3'
magenta = '#9c3ba1'
cyan = '#369a9c'
white = '#ffffff'

[scrolling]
history = 5000
multiplier = 1

[cursor]
style = { shape = "Beam" }

[shell]
program = "/opt/homebrew/bin/tmux"

[keyboard]
bindings = [{ key = "NumpadEnter", chars = "\r" }]

[[hints.enabled]]
command = "open"
hyperlinks = true
post_processing = true
persist = false
mouse.enabled = true
binding = { key = "U", mods = "Control|Shift" }
regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩`]+"
```

Based on Alacritty config [documentation](https://alacritty.org/config-alacritty.html).
