# dotvim configuration folder

This is my .vim folder.

All begins with `~/.vimrc` which is:

	runtime configurations/default/vimrc


# Notes

## ropevim

Keybindings:

[default](https://github.com/python-rope/ropevim#keybinding), plus:

	:map <C-x>rrwp :call RopeWriteProject()<CR>
	:map <C-c>rrag :call RopeGenerateAutoimportCache()<CR>
	:map <C-c>rra :call RopeAutoImport()<CR>
	:map <C-c>rrca :call RopeCodeAssist()

# Hacks

## jedi-vim

There is a problem in detecting the right virtualenv path, when the virtualenv is created with a python version different from the system one,
so:

[apply this patch](https://github.com/davidhalter/jedi/pull/829/commits/2ca6dd4a98a9f420d5c547c08aa1f9dfd6bd9801)

## completor

The jedi completion is not fired when the filetype is `python.django`, and in some old projects I forced this kind of filetype in order
to have all ultisnips snippets to work properly:

[check my comment](https://github.com/maralla/completor.vim/issues/76#issuecomment-338149521)
