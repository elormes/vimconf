"Installed vim-plug using 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"Installed Plugins
call plug#begin()
Plug 'https://github.com/python-mode/python-mode.git'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

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
let g:pymode_python = 'python3'

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
