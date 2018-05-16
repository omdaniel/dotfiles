ln -sv "$HOME/dotfiles/runcom/bash_profile" ~/.bash_profile
ln -sv "$HOME/dotfiles/runcom/inputrc" ~/.inputrc
ln -sv "$HOME/dotfiles/git/gitconfig" ~/.gitconfig
ln -sv "$HOME/dotfiles/vim/vimrc" ~/.vimrc
ln -sv "$HOME/dotfiles/tmux.conf" ~/.tmux.conf

[ ! -d "$HOME/.vim" ] && ln -sv "$HOME/dotfiles/vim"  ~/.vim
[ ! -d "$HOME/.tmux" ] && ln -sv "$HOME/dotfiles/tmux"  ~/.tmux
