# Keymaps

~/.config/nvim/config/keymap.vim

```vim
" Copy visual selection to clipboard with Ctrl+C
" Key Mappings
noremap <C-c> "+y
noremap <C-a> <Esc> :%y+<CR>

"Ctrl + S to Save
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

" Tasks
nnoremap <leader>r :!
nnoremap <C-e> :edit
nnoremap <C-q> <Esc>:q!<CR>
inoremap <C-q> <Esc>:q!<CR>
inoremap <C-w> <Esc>:wq!<CR>
nnoremap <C-w> <Esc>:wq!<CR>

nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR> a

" Option + Up/Down to move lines
nnoremap <M-Up> :m .-2<CR>gv
nnoremap <M-Down> :m .+1<CR>gv
nnoremap <C-M-Up> yyP
nnoremap <C-M-Down> yyp
inoremap <M-Up> :m .-2<CR>gv
inoremap <M-Down> :m .+1<CR>gv
inoremap <C-M-Up> yyP
inoremap <C-M-Down> yyp

" NERDTree
nnoremap <C-d> :NvimTreeToggle<CR>
nnoremap <C-S-D> :NvimTreeFocus<CR>

" Ctrl + F to Find in the current file
" Ctrl + Shift + F to Find in the current directory
" \ + fg to live grep in the current directory
" \ + fb to open the buffer list
" nnoremap <C-Space> :Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <Leader>ff :Telescope current_buffer_fuzzy_find find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <Leader>fg :Telescope live_grep<CR>
nnoremap <Leader>fb :Telescope buffers<CR>
vnoremap <C-_>gcc <CR>
nnoremap <C-_>gcc <CR>
```
