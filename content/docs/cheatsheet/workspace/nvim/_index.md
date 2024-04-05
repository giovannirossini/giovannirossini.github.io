---
weight: 10
title: "NeoVim"
bookCollapseSection: true
---

# nvim

~/.config/nvim/init.vim

```vim
set number
set smarttab
set autoindent
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set completeopt-=preview " For No Previews
set encoding=UTF-8
set showtabline=2

" Plugins
call plug#begin()

Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hashivim/vim-terraform'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '1.1.5' }
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'liuchengxu/vim-which-key'
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'sheerun/vim-polyglot'
Plug 'cohama/lexima.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'JMarkin/nvim-tree.lua-float-preview'

call plug#end()

" Theme
let g:deoplete#enable_at_startup = 1

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

source ~/.config/nvim/config/extensions.vim
source ~/.config/nvim/config/variables.vim
source ~/.config/nvim/config/keymap.vim
source ~/.config/nvim/config/neoformat.vim
source ~/.config/nvim/config/colors.vim
source ~/.config/nvim/config/git.vim

" Lua Plugins Config
lua require('plugins/treesitter')
lua require('plugins/telescope')
lua require('plugins/nvim-web-devicons')
lua require('plugins/nvim-tree')
lua require('plugins/lsp')
lua require('Comment').setup()
```
