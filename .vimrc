"Installed vim-plug using 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"    Installed Plugins
call plug#begin()
Plug 'https://github.com/python-mode/python-mode.git'
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
