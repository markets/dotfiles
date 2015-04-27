# Markets dotfiles [![markets/dotfiles](http://img.shields.io/badge/good-stuff-blue.svg)](https://github.com/markets/dotfiles)

This repository contains some configuration files (Git, Bash, aliases, Ruby, Sublime Text, ...) and some custom scripts/tools to bootstrap a friendly development environment :ok_hand:

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

To update, `cd` into your local `dotfiles` folder and run again:

```
script/install
```

You can remove :boom: this configuration with:

```
script/uninstall
```

## Prompt

Includes current Ruby version and Git branch/status:

```
[2.2.0] markets: ~/workspace/dotfiles (master)* $
```

## Secrets

Use `~/.secrets` for stuff that you don't want to share in your public, versioned repo. It will be automatically symlinked to your `~` directory.

Git credentials are configured via the `~/.secrets` file.

Enjoy :metal: