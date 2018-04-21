set nocompatible
filetype off

call plug#begin()

"Plug 'altercation/vim-colors-solarized'
" Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/lifepillar/vim-solarized8'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'                                        ", { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-peekaboo'                                      " Inspect buffers
Plug 'junegunn/vim-easy-align'                                    " Align variables etc
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bkad/CamelCaseMotion'
Plug 'derekwyatt/vim-fswitch'                                     " Switch header source files
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-obsession'
Plug 'tomtom/tcomment_vim'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }                  " Completion, goto definition etc.
Plug 'scrooloose/syntastic', { 'for': 'python' }                  " Find syntax error using e.g. flake8
Plug 'nvie/vim-flake8'

filetype plugin indent on " required!
call plug#end()

syntax enable
" set t_Co=256
" set termguicolors
set background=dark
colorscheme solarized8

" Editing
set encoding=utf-8 "Use utf-8, default in neovim

" Hide buffers with unsaved changes instead of closing
set hidden

set autoread
au CursorHold * checktime

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

set history=1000
set undolevels=500

set nobackup
set noswapfile
set undofile

set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.o,*.tmp
" set modelines=0               " Disable modeline
set backspace=indent,eol,start
set title
set nowrap
set shiftwidth=4
set softtabstop=4
set expandtab                  " Turn tabs into spaces
set number relativenumber
set autoindent
set copyindent
set showcmd                    " Show command in bottom bar
set cmdheight=1                " Set command bar height
set cursorline
"set colorcolumn=80
set showmode                   " Show active mode
set wildmenu                   " Whildmenu when tabbing during vim command
set wildmode=longest,list,full " Bash style completion
set lazyredraw                 " Redraw only when we need to
set showmatch                  " Highlight parenthesis
" set incsearch                  " Search as characters are entered
" set hlsearch                   " Highlight matches
set gdefault                   " Replace globally on lines by default
set ignorecase
set smartcase                  " Ignore case if only lower case when searching
set smarttab                   " Insert tabs on the start of a line according to shiftwidth, not tabstop
set diffopt+=vertical          " use veritcal diffs, usefull for fugitive
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Events not working propertly in some terminals?
:augroup numbertoggle
:  au!
:  au BufEnter,FocusGained,InsertLeave * set relativenumber
:  au BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

autocmd FileType make setlocal noexpandtab


" Map leader
" let mapleader=","
set timeoutlen=500

map <space> <leader>
nnoremap m <c-d>
nnoremap f <c-u>

" Turn off search highlighting
" nnoremap ,<space> :nohlsearch<CR>
" nnoremap <F3> :nohlsearch<CR>
" set nohlsearch

" Easier than pressing shift all the time
nnoremap s :

set pastetoggle=<F2>

nmap <F3> :set relativenumber!<CR>
nmap <F4> :set wrap!<CR>

" Easy access to vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Save
inoremap <c-s> <esc>:w<cr>
nnoremap <c-s> :w<cr>
nnoremap <leader>s :w<cr>

" Escape
inoremap jj <esc>

" Enter
map <c-m> <ENTER>
cno <c-m> <cr>

" Clear line
nnoremap <leader>d 0D

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Move to beginning of line
map H ^
map L $
nnoremap < <<
nnoremap > >>
" map ¤ $
" imap ¤ $
" Remap follow link command
" Use 'normal' regex
"nnoremap / /\v
"vnoremap / /\v
" nnoremap <tab> %
" vnoremap <tab> %
" Tab left
" inoremap <S-Tab> <c-d>
" inoremap <c-x> <bs>

" Y to yank from cursor to end of line
map Y y$

" Remap swedish keys
map ö [
map ä ]
map Ö {
map Ä }
imap ö [
imap ä ]
imap Ö {
imap Ä }

nnoremap <leader>q :q<CR>

" Windows
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>h <c-w>h
nnoremap <leader>k <c-w>k

" Open up new vertical window
nnoremap <leader>w <C-w>v<C-w>l
" bash like keys for the command line
" cno <c-a> <home>
" cno <c-e> <end>
"cno <c-p> <up>
"cno <c-n> <down>
set splitbelow
set splitright

" NERDTree
" map <c-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
" map <c-n> :NERDTreeFind<CR>
function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeToggle'
    else
        execute ':NERDTreeFind'
    endif
endfunction

function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

" let g:NERDTreeMouseMode = 3 " Open folders/files with single-click. Currently not working

" Toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" Toggle header source file
nmap <silent> § :FSHere<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
" nmap <Leader>s <Plug>(easymotion-s2)
" nmap <Leader>t <Plug>(easymotion-t2)
nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" " nnoremap <F3> :YcmCompleter GoTo<CR>
" let g:ycm_register_as_syntastic_checker = 1
" let g:ycm_always_populate_location_list = 1 "default 0
" let g:ycm_extra_conf_globlist = ['~/dev/*']
" let g:ycm_python_binary_path = 'python3'
" let g:ycm_add_preview_to_completeopt = 0
" " nnoremap <leader>fd :YcmCompleter GoToImplementationElseDeclaration<cr>
" nnoremap <leader>gd :YcmCompleter GoTo<cr>
" nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
" nnoremap <leader>gr :YcmCompleter GoToReferences<cr>
" nnoremap <leader>rf :YcmCompleter FixIt<cr>
" " nnoremap <leader>rr :YcmCompleter RefactorRename-new-name<cr>

" Move about the quickfix list more easily
" nmap <leader>n :cnext<CR>
" nmap <leader>N :clast<CR>
" nmap <leader>p :cprev<CR>
" nmap <leader>P :cfirst<CR>

" FZF
nnoremap <silent> <leader>p :FZF<CR>
nnoremap <silent> <leader>b :Buffers<cr>
" nnoremap <silent> <leader>h :History<cr>

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
