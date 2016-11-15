set shell=/bin/bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
" required!!
Plugin 'gmarik/Vundle.vim'

Plugin 'edkolev/promptline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'mileszs/ack.vim'
Plugin 'jceb/vim-editqf'
Plugin 'groenewege/vim-less'
Plugin 'Shutnik/jshint2.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'davidhalter/jedi-vim'
Plugin 'ntpeters/vim-better-whitespace'

" Style packages

" Plugin 'ryanoasis/vim-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'mattn/webapi-vim'
Plugin 'Wildog/airline-weather.vim'
Plugin 'airblade/vim-gitgutter'

" File management
Plugin 'scrooloose/nerdTree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
Plugin 'gcmt/taboo.vim'
Plugin 'LeafCage/yankround.vim'
"" Text editing!

" Brackets
Plugin 'tpope/vim-surround.git'

" Whitespace
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'hynek/vim-python-pep8-indent'

" Selection
Plugin 'terryma/vim-expand-region'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'

" Commenting
Plugin 'scrooloose/nerdcommenter'

" Movement
Plugin 'bkad/CamelCaseMotion'
Plugin 'easymotion/vim-easymotion'
Plugin 'matze/vim-move'

" Syntax
Plugin 'chrisbra/csv.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'hdima/python-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on

" Programming-language specific completion with
" <CTRL-X><CTRL-O>
set omnifunc=syntaxcomplete#Complete

" Custom movement
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h

" Custom leader key stuff
let mapleader = ","

" expand region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Inc-search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" JSHint saving
let jshint2_save = 1

syntax enable
syntax on

au FocusLost * :wa

set wildmenu

" For colorscheme and tab indents (\ig)
colorscheme gruvbox
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

set autoindent
set cindent
set expandtab
set ruler
set smartindent
set softtabstop=4
set shiftwidth=4
set hidden

" Smartcase overrides ignorecase if uppercase used in string
set ignorecase
set smartcase

set t_Co=256

" Relative/absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
call NumberToggle()

if has("gui_running")
    set guioptions=egmrt
endif

" For git gutter, make colors work properly on start
" au VimEnter * highlight clear SignColumn

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

"Highlight search
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Powerline settings
let g:Powerline_symbols = 'fancy'

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 2
" let g:airline#extensions#tabline#enabled = 1

"ctrl-p settings
set wildignore+=*.pyc

let g:jsx_ext_required = 0

" :map <C-a> <Home>
" :map <C-e> <End>

" Whitespace
autocmd BufWritePre * StripWhitespace
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let mapleader=","
set list

" Python
let python_highlight_all = 1


let g:netrw_list_hide= '.*\.swp$,.*\.pyc'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn guifg=#75715E guibg=#3E3D32

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Weather"
let g:weather#area = 'tokyo,japan'

if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

set sessionoptions+=tabpages,globals
let NERDTreeIgnore = ['\.pyc$']

" set macligatures
" set guifont=Fira\ Code:h12

set guioptions-=e
set sessionoptions+=tabpages,globals

call matchadd('ColorColumn', '\%81v', 100)

let g:move_key_modifier = 'C'
set nowrap
set showcmd

au FileType coffee setl sw=2 sts=2 et


" Buffer usage

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>


" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
