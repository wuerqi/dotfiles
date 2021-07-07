" not vi compatible
set nocompatible

"-------------------
" Syntax and indent
"-------------------
syntax on
set showmatch  " show matching braces when text indicator is over them

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

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set mouse+=a        " enable mouse mode (scrolling, selection, etc)
"---------------------
" Misc configurations
"---------------------


" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q    <Nop>

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
