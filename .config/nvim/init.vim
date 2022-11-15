let mapleader =","

" Load plugin manager
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
endif

" Packages
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jreybert/vimagit'
 Plug 'itchyny/lightline.vim'
call plug#end()

set title
set incsearch
set nohlsearch
set noshowmode
set noshowcmd
set mouse=a

" Settings for spacing
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set expandtab               " converts tabs to white space
set autoindent

" Setup NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Set relative numbers
set number relativenumber

" Copy and paste keybindings for the + register
vnoremap <C-c> "+y
map <C-v> "+P

" move line or visually selected block - alt+j/k
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and jk to exit insert mode.
inoremap jk <Esc>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Recurse 4 subdirectories
set path+=**

command! MakeTags !ctags -R .

map <leader>t :MakeTags<CR>

set wildmenu
