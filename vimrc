syntax on

let mapleader=","         " The <leader> key
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
" set backspace=indent,eol,start
set backspace=2           " Makes backspace behave like you'd expecti
" set showmatch             " Highlight matching braces
set colorcolumn=80        " Highlight 80 character limit
set showmode              " Show the current mode on the open buffer
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox',
Plug 'jremmen/vim-ripgrep',

" Multiselect like in SublimeText"
Plug 'terryma/vim-multiple-cursors'

"the Python formatter"
Plug 'psf/black'

" Git blame, status etc"
Plug 'tpope/vim-fugitive',

" Man pages for VIM"
Plug 'vim-utils/vim-man',
Plug 'git@github.com:kien/ctrlp.vim',

" Autocompletion"
"Plug 'git@github.com:Valloric/YouCompleteMe.git',"
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Swap \n for newline
nnoremap <leader>n   ::%s/\\n/\r/g

" Change vim config
nmap <silent> <leader>vim :e ~/.vimrc<CR>
