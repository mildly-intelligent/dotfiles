call plug#begin('~/.config/nvim/plugged')

" Catppuccin color theme:
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

syntax on
colorscheme catppuccin
set termguicolors
