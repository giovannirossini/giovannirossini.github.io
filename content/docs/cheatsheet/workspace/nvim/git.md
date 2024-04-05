# Git

~/.config/nvim/config/git.vim

```vim
highlight GitGutterAdd      guifg=#00ff00 ctermfg=green
highlight GitGutterChange   guifg=#ffff00 ctermfg=yellow
highlight GitGutterDelete   guifg=#ff0000 ctermfg=red
highlight SignColumn        guibg=NONE ctermbg=NONE

let g:gitgutter_max_signs = -1
let g:gitgutter_enabled = 0
let g:gitgutter_buffer = 1
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_modified_removed = '╏'
let g:gitgutter_sign_removed = '┃'

nnoremap <C-h> :GitGutterToggle<CR>
nnoremap <Leader>p :GitGutterPreviewHunk<CR>
nnoremap <Leader>u :GitGutterUndoHunk<CR>
nnoremap <Leader>q :GitGutterQuickFix<CR>
nnoremap <Leader>s :GitGutterStageHunk<CR>
nnoremap <Leader>gc :terminal git commit<CR>
```
