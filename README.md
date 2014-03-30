# Markets dotfiles

These are some config files (git, bash, aliases, ruby, sublime text 2, ...) to set up some useful settings that I like :blue_heart:

## Installation
Run this:

```
git clone https://github.com/markets/dotfiles.git
cd dotfiles
script/install
```

Alternatively, to install it avoiding the confirmation prompt:

```
script/install -f # or --force
```

To update it, `cd` into your local `dotfiles` folder and run again:

```
script/install
```

You can remove :boom: this configuration with:

```
script/uninstall
```

## Prompt
Includes `Rails` version:

```
2.0.0-p353on4.0.4 markets: ~/workspace/dotfiles (master)* $
```

## Notes
Use `~/.secrets` for stuff that you don't want to share in your public, versioned repo. It will be automatically symlinked to your `~` directory.

Enjoy :metal: