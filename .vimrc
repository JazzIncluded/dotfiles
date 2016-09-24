set nocompatible
filetype off

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-peekaboo'                                      " Inspect buffers
Plug 'junegunn/vim-easy-align'                                    " Align variables etc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'sheerun/vim-polyglot'                                       " Syntax highlighting, indent, for lots of languages
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search for files
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }                  " Completion, goto definition etc.
Plug 'scrooloose/syntastic', { 'for': 'python' }                " Find syntax error using e.g. flake8

filetype plugin indent on                   " required!
call plug#end()

syntax enable
set background=dark
colorscheme solarized

" Editing
if !has('nvim')
   set encoding=utf-8 "Use utf-8, default in neovim
end

" Hide buffers with unsaved changes instead of closing
set hidden

set autoread
au CursorHold * checktime

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set history=1000
set undolevels=500
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
if has("persistent_undo")       " Set undofile
    set undodir=~/.undodir/
    set undofile
endif
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.o,*.tmp
" set modelines=0               " Disable modeline
set backspace=indent,eol,start
set title
set wrap
set shiftwidth=4
set softtabstop=4
set expandtab                  " Turn tabs into spaces
set number
set autoindent
set copyindent
set showcmd                    " Show command in bottom bar
set cmdheight=1                " Set command bar height
set cursorline
set colorcolumn=80
set showmode                   " Show active mode
set wildmenu                   " Whildmenu when tabbing during vim command
set wildmode=longest,list,full " Bash style completion
set lazyredraw                 " Redraw only when we need to
set showmatch                  " Highlight parenthesis
set incsearch                  " Search as characters are entered
set hlsearch                   " Highlight matches
set gdefault                   " Replace globally on lines by default
set ignorecase
set smartcase                  " Ignore case if only lower case when searching
set smarttab                   " Insert tabs on the start of a line according to shiftwidth, not tabstop
set diffopt+=vertical          " use veritcal diffs, usefull for fugitive
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Map leader
let mapleader=","
set timeoutlen=500
" Turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" set nohlsearch
" Easier than pressing shift all the time
nnoremap - :
set pastetoggle=<F2>
" Easy access to vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Scroll view up and down
"nnoremap <c-k> <c-Y>
"nnoremap <c-j> <c-E>
" Scroll to center cursor
"nnoremap zm zz
inoremap jk <esc>
inoremap jj <esc>
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Move to beginning of line
"nnoremap A ^
" Move to end of line
nnoremap E $
" Remap follow link command
"nnoremap gt <C-]>
" Use 'normal' regex
"nnoremap / /\v
"vnoremap / /\v
" nnoremap <tab> %
" vnoremap <tab> %
" Tab left
inoremap <S-Tab> <c-d>
" Y to yank from cursor to end
map Y y$
" FZF
nnoremap <silent> <C-P> :FZF<CR>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>h :History<cr>

" Remap swedish keys
map ö [
map ä ]
map Ö {
map Ä }
" Windows
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
" Open up new vertical window
nnoremap <leader>w <C-w>v<C-w>l
" bash like keys for the command line
cno <c-a> <home>
cno <c-e> <end>
"cno <c-p> <up>
"cno <c-n> <down>
" Move about the quickfix list more easily
nmap <leader>n :cnext<CR>
nmap <leader>N :clast<CR>
nmap <leader>p :cprev<CR>
nmap <leader>P :cfirst<CR>

set splitbelow
set splitright

" NERDTree
map <c-n> :NERDTreeToggle<CR>
" Toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"set foldmethod=marker

" Use english for spellchecking, but don't spellcheck by default
"if version >= 700
"   set spl=en spell
"   set nospell
"endif

" Real men use gcc
"compiler gcc

"nnoremap JJJJ <Nop>

" Set off the other paren
"highlight MatchParen ctermbg=4

"let paste_mode = 0 " 0 = normal, 1 = paste

"func! Paste_on_off()
"   if g:paste_mode == 0
"      set paste
"      let g:paste_mode = 1
"   else
"      set nopaste
"      let g:paste_mode = 0
"   endif
"   return
"endfunc

