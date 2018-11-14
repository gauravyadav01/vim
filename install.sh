#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source lib/echos.sh
source lib/requires.sh

#####
# install homebrew (CLI Packages)
#####

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
      error "unable to install homebrew, script $0 abort!"
      exit 2
  fi
else
  ok
  # Make sure we’re using the latest Homebrew
  running "updating homebrew"
  brew update
  ok
  bot "before installing brew packages, we can upgrade any outdated packages."
  read -r -p "run brew upgrade? [y|N] " response
  if [[ $response =~ ^(y|yes|Y) ]];then
      # Upgrade any already-installed formulae
      action "upgrade brew packages..."
      brew upgrade
      ok "brews updated..."
  else
      ok "skipped brew package upgrades.";
  fi
fi

env brew bundle 


#Setup zsh as your shell
CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  bot "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  # sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  # chsh -s /usr/local/bin/zsh
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
  ok
fi

#Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh >/dev/null 2>&1
fi

#Install rvm  with stable ruby 
if [ ! -d "$HOME/.rvm" ]; then
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

cp -pr dotfiles $HOME
mkdir -p $HOME/.config/nvim
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim


curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./dein.sh $HOME/.cache/dein


nvim +"call dein#install()" +qall

running "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;ok

running "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false;ok

running "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true;ok

running "Reveal IP, hostname, OS, etc. when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName;ok

running "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on;ok

running "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false;ok

running "Set the icon size of Dock items to 30 pixels"
defaults write com.apple.dock tilesize -int 30;ok



bot "Woot! All done. Kill this terminal and launch iTerm"
