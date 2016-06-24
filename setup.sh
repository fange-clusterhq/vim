git config --global core.editor "vim"
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $HOME/.config
ln -s $SRC_DIR/.vim $HOME/.config/nvim
ln -s $SRC_DIR/.vimrc $HOME/.config/nvim/init.vim
