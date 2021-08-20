" not vi compatible
set nocompatible


" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle and initialize
Plugin 'gmarik/Vundle.vim'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


"-------------------
" Syntax and indent
"-------------------
syntax on
set showmatch  " show matching braces when text indicator is over them

augroup AutoMake
    " Remove all auto-commands from the group AutoMake
    autocmd! 

"    autocmd BufWritePost *.c,*.cpp make
"    autocmd QuickFixCmdPost * copen
augroup END

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

if has('gui_running')
"	echo "has gui_running"
	colorscheme solarized
	let g:lightline = { 'colorscheme': 'solarized' }
elseif &t_Co < 256
"	echo "t_Co"
	colorscheme default
	set nocursorline  " looks bad in this mode
else
"	echo "t_Co = 256"
	set background=dark
	let g:solarized_termcolors=256  " instead of 16 color with mapping in terminal 
	colorscheme solarized

	" customized colors
	highlight SignColumn ctermbg=234
	highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
	highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
"	let g:lightline = { 'colorscheme': 'dark' }
	highlight SpellBad cterm=underline
	" patches
	highlight CursorLineNr cterm=NONE
endif


filetype plugin indent on  " enable filetype detection plugin indent
set autoindent

"----------------------
" Basic editing config
"----------------------
set shortmess+=I  	" disable startup message
set number		" line number
set relativenumber	" relative line number
set incsearch       " incremental search (as string is being typed)
set hlsearch        " highlight search results
set history=8192	" more history
set noshowmode		" hide mode
set laststatus=2	" enable status line
set backspace=indent,eol,start " allow backspacing over everything

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" smart case-sensitive search
set ignorecase
set smartcase

set mouse+=a        " enable mouse mode (scrolling, selection, etc)

" set shortmess+=F    " suppress 'Press Enter or type command ...' message

" set statusline+=%{gutentags#statusline()}

"---------------------
" Misc configurations
"---------------------


" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q    <Nop>

" terminal window size
set termwinsize=12x0

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"----------------------
" Plugin configuration
"----------------------

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" CtrlP
" nnoremap ; :CtrlPBuffer<CR>
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_show_hidden = 1

" YouCompleteMe
let g:ycm_confirm_extra_conf = 1
let g:ycm_open_loclist_on_ycm_diags = 1         " Open location list to view diagnostics
let g:ycm_enable_diagnostic_highlighting = 1    " Highlight regions of diagnostic text

nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>st :YcmCompleter GetType<CR>

nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)


" Open vim-dispatch window and scroll to bottom
nnoremap <C-m>m :Copen<CR> <bar> G

" Build targets
nnoremap <C-m>b :Dispatch! make -C build/<CR>


" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args  = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" lightline
"   adding Git branch info in the left
let g:lightline = {
     \   'active': {
     \     'left': [ ['mode', 'paste'],
     \               ['gitbranch', 'readonly', 'filename', 'modified'] ]
     \   },
     \   'component_function': {
     \     'gitbranch': 'FugitiveStatusline'
     \   },
     \ }




" Lose bad habits
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove newbie crutches in Insert Mode
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <Up>    <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down>  <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>
vnoremap <Up>    <Nop>
