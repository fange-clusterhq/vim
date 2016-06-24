git config --global core.editor "vim"
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config
cp -r $SRC_DIR/.vim $HOME/.config/nvim
cp -r $SRC_DIR/.vimrc $HOME/.config/nvim/init.vim
