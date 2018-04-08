"Force to use python
if has('python')
endif

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.6'

"Installed vim-plug using 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"Installed Plugins
call plug#begin()
Plug 'https://github.com/python-mode/python-mode.git'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'git://github.com/majutsushi/tagbar'
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/kien/ctrlp.vim.git'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

let g:deoplete#enable_at_startup = 1
:let mapleader = "-"

"Show buffers
let g:airline#extensions#tabline#enabled = 1

"Show only filename in bufferline
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Enable folding
set foldmethod=indent
set foldlevel=99


"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding with the spacebar
nnoremap <space> za

"Positions of split
set splitbelow
set splitright

"Settings for python-mode
let g:pymode_python = 'python'

"Copying and pasting from clipboard
vnoremap <C-c> "+y
nnoremap <C-v> "+p

"Prevent vim from clearing the clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"Change color of python-mode width
hi ColorColumn ctermbg=8

"Enable mouse support
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"Close vim if only open window is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Open NERDTree with shortcut
map <C-n> :NERDTreeToggle<CR>

"Fix vim color change in tmux
set background=dark
set t_Co=256

set hidden
set nowrap

"Change cursor shape in different modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


"Toggle TagBar with F8	
map <F8> :TagbarToggle<CR>

nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

"Close buffer without closing window with NERDTree
nnoremap <leader>q :bp<cr>:bd #<cr>

"Disable deocomplete autocompletion
"let g:deoplete#disable_auto_complete = 1

" Bind nohl
" " Removes highlight of your last search
noremap <leader>n :nohl<CR>
vnoremap <leader>n :nohl<CR>
inoremap <leader>n :nohl<CR>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Useful settings
set history=700
set undolevels=700

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
