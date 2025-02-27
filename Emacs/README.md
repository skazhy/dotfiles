# Emacs

I'm using Emacs 30 as the default editor. There are two Emacs configurations here:

* `doom.d` - [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration that's used daily
* `plain` - a work in progress, that might replace Doom one fine day

## Setup

* Symlink Doom's config: `rake install:emacs`
* Clone Doom's repo: `git clone https://github.com/hlissner/doom-emacs ~/.emacs.d`
* [Setup Doom](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#doom-emacs)

Note that `~/.emacs.d` only contains Doom's code. Any custom configuration lives in the `doom.d` folder.

I'm using [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus) on macOS.

```
brew tap d12frosted/emacs-plus
brew install emacs-plus@30 --with-modern-cg433n-icon
```

Make Emacs available in Spotlight:

```
osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@30/Emacs.app" at POSIX file "/Applications" with properties {name:"Emacs.app"}'
```

Doom comes with a [utlility script](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#the-bindoom-utility), which is already included in `$PATH` in zsh.
Use it to initialize Doom: `doom install`. Emacs should now be available in Spotlight & start with Doom's config.

Emacs with the _plain_ configuration can be started with `plainemacs` zsh alias.

## Updating Emacs itself

```bash
brew unlink emacs-plus@CURRENT-VERSION
rm /Applications/Emacs.app
```

Run the installation steps for the new Emacs version

## Troubleshooting

Fixing bad state after a Doom upgrade:

```
cd ~/.emacs.d
git clean -fdX
doom sync
```
