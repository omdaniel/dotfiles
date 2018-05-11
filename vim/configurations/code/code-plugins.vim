" Indentation
Plug 'Yggdroot/indentLine'

" folding
Plug 'Konfekt/FastFold'

" pairs
Plug 'jiangmiao/auto-pairs'

" commentary
Plug 'tpope/vim-commentary'

" matchit
Plug 'tmhedberg/matchit'

" surroundings
Plug 'tpope/vim-surround'

" syntax checking
Plug 'w0rp/ale'

" completion
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Debug
" python: https://github.com/gotcha/vimpdb
" php and more
Plug 'joonty/vdebug'

" semantic highlight
Plug 'jaxbot/semantic-highlight.vim'

" tagbar
Plug 'majutsushi/tagbar'

" scratchpad
Plug 'metakirby5/codi.vim'

" dev icons
Plug 'ryanoasis/vim-devicons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the below rules where commented out because of supertab
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" swith the following lines to autocomplete python 2/3
" let g:completor_python_binary = '/usr/bin/python2.7'
let g:completor_python_binary = '/usr/bin/python3.5'
let g:completor_filetype_map = {'python.django': 'python'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utilsnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_javascript_flow_use_global = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Prettier does not have spaceBeforeFunctionParen option => fix with eslint after
" https://github.com/prettier/prettier/issues/1139
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'scss': ['prettier'], 'python': ['yapf', 'isort']}
" create a .prettierrc file in the project root
" {
"   'semi':false,
"   'singleQuote':true,
"   'bracketSpacing':true
" }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters = {
\   'scss': ['sasslint'],
\}
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '⚠'
nnoremap <leader>f :ALEFix<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => semantic-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <Leader>s :SemanticHighlightToggle<cr>
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=RobotoMono\ Nerd\ Font\ Mono\ 11
