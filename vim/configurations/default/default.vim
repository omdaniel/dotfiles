"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim abidibo configuration
"
" This is a default configuration file sourced by all other specific
" configurations, included the default one
"
" vim-plug operates inside $VIMDIRPATH defined here, but plugins are
" loaded inside plugins.vim files defined by the active configuration
" All configutations source the default plugins.vim file, which is
" intended as a common plugin list
"
" A vimrc representing a new configuration must:
" - define a $CONFPATH variable which is the root directory
"   containing the conf vimrc and plugins file
" - source this file
" - add plugins and their configurations inside the plugins file
" - add extra configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $VIMDIRPATH = '~/.vim'

""""""""""""""""""""""""""""""
" => Leader
""""""""""""""""""""""""""""""
let mapleader = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread

" Use awesome features
set nocompatible " be iMproved

" create missing dirs
nnoremap <leader>md :!mkdir -p %:p:h<cr>

" good habits
" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" jk is escape
inoremap jk <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin management with vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin($VIMDIRPATH.'/plugged')

" Plugins in external file depending upon configuration
source $CONFPATH/plugins.vim

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => History
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Net
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ftp
let g:netrw_ftp_cmd="ftp -p"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable mouse
set mouse=a
set ttymouse=sgr

" highlight cursor line
set cursorline

" show commands
" set showcmd
set noshowmode

" GUI Font
set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 10

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
"set noerrorbells
"set novisualbell
set noeb vb t_vb=
set t_vb=
set tm=500

" remap resize split windows ctrls
noremap <c-w><left> <c-w><
noremap <c-w><right> <c-w>>

" buffer move
nnoremap <leader>bl :bnext<cr>
nnoremap <leader>bh :bprev<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme tir_black

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"    These are common values, overwritten in project specific
"    vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" split
nnoremap <space>h <c-w>h
nnoremap <space>l <c-w>l
nnoremap <space>j <c-w>j
nnoremap <space>k <c-w>k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
