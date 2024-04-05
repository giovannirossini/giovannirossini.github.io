# Filetypes

~/.config/nvim/config/filetype.vim

```vim
" Set filetypes for specific files
autocmd BufNewFile,BufRead *.yml,*.yaml set filetype=yaml
autocmd BufNewFile,BufRead Jenkinsfile* set filetype=groovy
autocmd BufNewFile,BufRead *_config set filetype=sshconfig
autocmd BufNewFile,BufRead .env.example set filetype=.env
autocmd BufNewFile,BufRead nginx.conf,nginx.*default set filetype=nginx
autocmd BufNewFile,BufRead docker-compose* set filetype=docker-compose
```
