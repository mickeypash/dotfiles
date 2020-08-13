# dotfiles
My new dotfiles

Install Homebrew

Install rc file management:
```
brew tap thoughtbot/formulae
brew install rcm
```
Download and install `oh-my-zsh`
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

[Thoughtbot rcm blog post](https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos)

If you're setting up on a new c
```
lsrc -d ~/Code/dotfiles
rcup -v -d ~/Code/dotfiles
```

Add a config to your dotfiles

```
mkrc .zshrc .vimrc
```

