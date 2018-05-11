" specific code configurations

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File types and Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Enable omnicomplete for supported filetypes
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" set line numbers
set number

" wildignore
set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*.pyc,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/**
set wildignore+=vendor/**
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"    These are common values, overwritten in project specific
"    vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Operation mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:onoremap p i(
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap in' :<c-u>normal! f'vi'<cr>
:onoremap in" :<c-u>normal! f"vi"<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=1

" expanded when opening a file
au BufRead * normal zR

let javaScript_fold=1         " JavaScript
let php_folding=1             " PHP
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
