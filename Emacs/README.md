# Emacs profiles

There are two configurations here. I switch between them with
`--init-directory` flag that was introduced in Emacs 29.

* `doom.d` - [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration that's used daily
* `plain` - a work in progress configuration, that might replace Doom Emacs one fine day

## Setup

Doom's code lives in `~/.emacs.d`, Doom's config lives in `~/.doom.d`. Doom's scripts are already included in `$PATH` in zsh.

* Symlink Doom's config: `rake install:emacs`
* Clone Doom's repo: `git clone https://github.com/hlissner/doom-emacs ~/.emacs.d`

Next up: Emacs itself.

```
brew tap d12frosted/emacs-plus
brew install emacs-plus@29  --with-native-comp --with-modern-cg433n-icon
osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@29/Emacs.app" at POSIX file "/Applications" with properties {name:"Emacs.app"}'
```

Finally, initialize Doom: `doom install`.
Emacs should be available in Spotlight & boot with Doom's config.
