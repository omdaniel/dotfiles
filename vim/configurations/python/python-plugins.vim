Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'python-rope/ropevim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 1
let g:jedi#show_call_signatures = "2"
autocmd FileType python setlocal omnifunc=jedi#completions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ropevim
" N.B, In order to have autoimport for venv modules working, add this line to the
" .ropeproject/config.py:
" prefs.add('python_path', '../.virtualenv/lib/python2.7/site-packages')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ropevim_autoimport_modules = ["os", "shutil", "datetime", "json", "re", "django.*", "ckeditor_uploader.*", "ckeditor.*", "captcha.*", "constance.*", "easy_thumbnails.*", "widget_tweaks.*"]
let g:ropevim_goto_def_newwin = 'tabnew'
nnoremap <leader>rwp :call RopeWriteProject()<CR>
nnoremap <leader>rag :call RopeGenerateAutoimportCache()<CR>
nnoremap <leader>ra :call RopeAutoImport()<CR>
inoremap <c-c>rca <esc>:call RopeCodeAssist()<CR>
nnoremap <leader>rop :call RopeOpenProject()<CR>
nnoremap <leader>rr :call RopeRename()<CR>
nnoremap <leader>rf :call RopeFindOccurrences()<CR>
