Karabiner
---------
```Shell
cd "$HOME/Library/Application Support/Karabiner"
ln -sf ~/dotfiles/osx/karabiner/private.xml
```

XCode
-----
```Shell
cd ~/Library/Developer/Xcode/UserData
ln -sf ~/dotfiles/osx/xcode/Custom.dvtcolortheme FontAndColorThemes
```

ST3 & Package Control
---------------------
```Shell
cd "$HOME/Library/Application Support/Sublime Text 3/Packages"
rm -rf User && ln -s ~/dotfiles/osx/sublime-text User
```

OS X 잠자기 전 자동으로 외장 디스크 언마운트
--------------------------------------------
```Shell
brew install sleepwatcher
ln -sf /usr/local/opt/sleepwatcher/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist

ln -sf ~/dotfiles/osx/sleepwatcher/.sleep ~
ln -sf ~/dotfiles/osx/sleepwatcher/.wakeup ~
```
