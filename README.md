# Emacs 25 on macOS
# Install
## git clone
```
mkdir ~/.emacs.d
cd ~/.emacs.d
git clone https://github.com/walkersumida/emacs25.git .
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

## install packages
```
cask install
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

# Command
## Database connects (mysql)
```
M-x sql-mysql
```

## Grep (ag)
```
C-x g
```

## Replace (query-replace)
```
C-x re
```

## Org mode
### Section
`C-i` : Toggle emphasized text
```
* Emacs command
```

### Checbox
`C-c C-c` : org-toggle-checkbox
```
- [ ] item1
- [X] item2
```

### Program lang
`C-c C-c` : org-babel-execute-src-block
```
#+begin_src C
printf("a");
#+end_src
```

## Rspec mode
`C-c , v` : Verify the spec file associated with the current buffer

`C-c , s` : Verify the example or method defined at point

https://github.com/pezra/rspec-mode

## Bookmark
### Set
`C-x r m` : set a bookmark at the current location

### Jump
`C-x r b` : jump to a bookmark

### List
`C-x r l` : list your bookmarks
