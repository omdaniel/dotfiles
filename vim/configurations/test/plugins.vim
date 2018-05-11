"
Plug 'python-rope/ropevim'

let g:ropevim_guess_project = 1
let g:ropevim_goto_def_newwin = 'vnew'
let ropevim_vim_completion=1
let ropevim_extended_complete=1
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
map <c-c>i :RopeAutoImport<CR>
map <c-c>fo :RopeFindOccurrences<CR>
"   <C-c>rr RopeRename
"   <C-c>rl RopeExtractVariable
"   <C-c>rm RopeExtractMethod
"   <C-c>ri RopeInline
"   <C-c>rv RopeMove
