OS X 잠자기 전 자동으로 외장 디스크 언마운트
--------------------------------------------

```Shell
brew install sleepwatcher
ln -sf /usr/local/opt/sleepwatcher/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist

ln -sf ~/dotfiles/sleepwatcher/.sleep ~
ln -sf ~/dotfiles/sleepwatcher/.wakeup ~
```
