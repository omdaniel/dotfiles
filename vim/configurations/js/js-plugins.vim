" jsdoc
Plug 'heavenshell/vim-jsdoc'

" autocompletion and tern stuff
Plug 'ternjs/tern_for_vim'

" js syntax
Plug 'pangloss/vim-javascript', {'for': 'javascript,javascript.jsx'}
" Plug 'jelera/vim-javascript-syntax',  {'for': 'javascript.jsx'}

" syntax and snippets
Plug 'isRuslan/vim-es6'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-jsdoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-l> <Plug>(jsdoc)
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tern_for_vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
