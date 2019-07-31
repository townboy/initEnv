# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

c=`grep initEnv/init.sh $HOME/.zshrc`

echo c
if [ -z c ]
then 
	echo "start append source to zshrc tail"
	echo "source $HOME/initEnv/init.sh" >> $HOME/.zshrc
fi

#cp tmux conf
echo "start cp tmux conf"
cp ./tmux.conf $HOME/.tmux.conf

#build vim conf
echo "start download Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp vimrc $HOME/.vimrc
vim +PluginInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe && python3 install.py --clang-completer --go-completer

#install vim-go required binaries
vim +GoInstallBinaries +qall

echo "init success"
