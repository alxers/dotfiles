#/bin/bash

sudo aptitude install -y vim-gtk

echo "Copying vim configs"
cp dotfiles/.vimrc ~/
cp -r dotfiles/.vim ~/

echo "Install vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# run vim command from shell
# vim -c "PluginInstall"
vim +PluginInstall +qall

echo "Install ctrl p"
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
vim -c "helptags ~/.vim/bundle/ctrlp.vim/doc" +qall

# run commands from file
#echo 'gg=G' > indent.txt
#echo ':wq' >> indent.txt
#vim -s indent.txt file
