# Neoformat

~/.config/nvim/config/neoformat.vim

```vim
let g:neoformat_terraform = {
      \ 'exe': 'terraform fmt',
      \ 'args': ['-write=true'],
      \ 'stdin': 1,
      \ 'sync': 1,
      \ }

let g:neoformat_python = {
      \ 'exe': 'autopep8',
      \ 'args': ['--max-line-length=100'],
      \ 'stdin': 1,
      \ 'sync': 1,
      \ }

let g:neoformat_yaml = {
      \ 'exe': 'prettier',
      \ 'args': ['--parser=yaml', '--use-tabs'],
      \ 'stdin': 1,
      \ 'sync': 1,
      \ }

let g:neoformat_json = {
      \ 'exe': 'prettier',
      \ 'args': ['--parser=json', '--use-tabs'],
      \ 'stdin': 1,
      \ 'sync': 1,
      \ }

let g:neoformat_enabled_xml = ['xmllint']
let g:neoformat_xml_xmllint = {
  \ 'exe': 'xmllint',
  \ 'args': ['-'],
  \ 'stdin': 1,
  \ 'sync': 1,
  \ }

autocmd BufWritePre *.* :Neoformat

" Remove Trailing Spaces
autocmd BufWritePre * :%s/\s\+$//e
```
