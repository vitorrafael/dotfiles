" LEAD CHARACTER
let mapleader="\\"

" PLUGIN MANAGER
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')
 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'altercation/vim-colors-solarized'
 
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" NERDTree AND RELATED
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" FZF -> Dependency and Plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim' " Must install the_silver_searcher together

Plug 'airblade/vim-gitgutter'

" LIGHTLINE WITH COMPONENTS
Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-fugitivea'

Plug 'vim-python/python-syntax'

Plug 'ryanoasis/vim-devicons'
call plug#end()


" SYNTAX HIGHLIGHT
syntax on

let g:python_highlight_all=1

" LINE SIDE BAR ENUMERATIONS
set number

" VIM UPDATE TIME/RELOAD
set updatetime=100
set autoread

" EDITOR APPEARENCE
colorscheme solarized
set background=dark
set encoding=utf8

" NERDTree
nmap <C-\> :NERDTreeToggle<cr>

let g:webdevicons_conceal_nerdtree_brackets = 0

" " SYNTAX HIGHLIGHT
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" " GIT PLUGIN

let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",  
    \ "Staged"    : "#538B54",  
    \ "Untracked" : "#BE5849",  
    \ "Dirty"     : "#299999",  
    \ "Clean"     : "#87939A"   
    \ }  

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "⋆",
    \ "Staged"    : "•",
    \ "Untracked" : "∘",
    \ "Dirty"     : "⁖",
    \ "Clean"     : "✔︎",
    \ }

" LIGHTLINE
set laststatus=2
set noshowmode " Remove the mode from below the lightline bar

" Modify Lightline
let g:lightline = {
	\ 'colorscheme' : 'solarized',
	\ 'active' : {
	\   'left' : [ [ 'mode', 'paste'],
	\		       [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ] 
	\ },
	\ 'component_function' : {
	\    'gitbranch' : 'FugitiveHead',
    \    'cocstatus' : 'coc#status',
	\ },
	\ }


" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDefaultAlign = 'left'

nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle

" VIM-DEVICONS
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" ACK
let g:ackprg = 'ag --nogroup --nocolor --column' " Set ACK to use the_silver_seacher

" GITGUTTER
set signcolumn=yes "Always show the sign

" FUNCTIONS

" KEY BINDINGS
map <C-p> :FZF<cr>

" TAB
set tabstop=4
set expandtab
set shiftwidth=4

" PRETTIER

let g:prettier#autoformat_require_pragma=0


" COC.NVIM

let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-pairs', 
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-eslint',
    \]

" " CONFIGS
set hidden " TextEdit might fail if hidden is not set

set nobackup " Some servers have issues with backup files
set nowritebackup

set cmdheight=2 "Give more space for displaying messages
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

"     Use tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, <C-g>u -> break undo chain at
" current position
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <F2>  <Plug>(coc-rename)

" Run Prettier on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CLIPBOARD SETTINGS
set clipboard=unnamed

nnoremap <C-v> "+gP
nnoremap <C-c> "+y
nnoremap <C-x> "+x
vnoremap <C-v> "+gP
vnoremap <C-c> "+y
vnoremap <C-x> "+x

" SET BELL OFF
set belloff=all
