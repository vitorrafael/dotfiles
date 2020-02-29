let mapleader=","

" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')

  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tomasr/molokai'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

syntax on

set hlsearch

let g:ag_working_path_mode="r"

set ignorecase
set smartcase

" AUTO IDENTATION

set smartindent
set expandtab

set softtabstop=2
set shiftwidth=2

" BACKUP
set nobackup
set nowritebackup
set noswapfile

" EDITOR APPEARENCE
colorscheme molokai
set number
set guifont=Monaco\ for\ Powerline:h12
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

set incsearch

" AUTORELOAD
set autoread

" PLUGINS CONFIGURATIONS

" CtrlP
let g:ctrlp_map= '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" NERDTree
nnoremap <leader>ft :NERDTreeToggle<cr>

set updatetime=300

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
