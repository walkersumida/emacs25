# Emacs 25 on macOS
## git clone
```
mkdir ~/.emacs.d
git clone git@github.com:walkersumida/emacs25.git .
```

## install Emacs
```
brew install emacs --devel --with-cocoa --srgb
brew linkapps emacs
echo 'alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"' >> ~/.bash_profile
```

## install Cask
```
brew install cask
```

## install ctags
```
brew install ctags-exuberant
echo 'alias ctags="`brew --prefix`/bin/ctags"' >> ~/.bash_profile
source ~/.bash_profile
```

## install The Silver Searcher
```
brew install the_silver_searcher
```

## cask install
```
cask install
```

## install Pallet
launch Emacs
```
M-x package-install
pallet
```

## create tag file(ruby)
```
ctags -Re --langmap=RUBY:.rb
```

## install rubocop(ruby)
install robocop on global
```
gem install rubocop -v [version]
```

## install flake8(pyenv)
```
pip install flake8
```
