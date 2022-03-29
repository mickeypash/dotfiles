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

set clipboard=unnamed
set guioptions+=a
set relativenumber
set splitright

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'skanehira/gh.vim'

Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'
"Plug 'jremmen/vim-ripgrep'

Plug 'wakatime/vim-wakatime'

" Multiselect like in SublimeText"
"Plug 'terryma/vim-multiple-cursors'

"the Python formatter"
"Plug 'psf/black'

" Git blame, status etc"
Plug 'tpope/vim-fugitive'

" Man pages for VIM"
"Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim'

" Autocompletion"
Plug 'git@github.com:Valloric/YouCompleteMe.git',"

" Python syntax
Plug 'vim-syntastic/syntastic'
"Plug 'mbbill/undotree'

Plug 'etdev/vim-hexcolor'

" NerdTree
Plug 'preservim/nerdtree'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocompletion using AI
" Plug 'codota/tabnine-vim'

" Sum/max/min/avg on columns of numbers
"Plug 'drxcc/vim-vmath'

" TableMode
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

if executable('rg')
    let g:rg_derive_root='true'
endif

" let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

" fzf
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Swap \n for newline
nnoremap <leader>n   :%s/\\n/\r/g

" Swap comma + space for comma + newline
nnoremap <leader>nn   :%s/,\s/,\r/g

" Change vim config
nmap <silent> <leader>vim :e ~/.vimrc<CR>

" Format JSON
nmap <leader>json :%!python -m json.tool

" Get GitHub URL for the line under your cursor
nnoremap <leader>gh :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

nnoremap <leader>o :GFiles<CR> 

" Run Python script
nmap <leader>py <Esc>:w<CR>:!clear;python %<CR>

" PLUGIN: NERDTree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']

" Emoji shortcuts
ab :white_check_mark: ✅
ab :bomb: 💣
ab :boom: 💥
ab :init: 🌱
ab :raised_hands: 🙌

let g:gh_token = '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'

" Mappings for vmath
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
