# Neovim Configuration

It took until 2023 for me to realise how awesome vim is. After tens of thousands of lines of code written with nano
and VScode becoming my go-to on the desktop I finally saw the light. I didn't like not understanding the various configs
out there (even kickstart) and so I've been writing my own.

## Config Reference

There are two great sets of tutorials on youtube for configuring Neovim.
- [Typecraft - Neovim for Newbs](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) is my goto and really explains the whole process in some detail. The corresponding configuration on github is [here](https://github.com/cpow/neovim-for-newbs/).
 - [Vyrrho](https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft) started doing a really detailed and accessible series, but it does not appear to have continued. Very comprehensive and worth a watch too, but there's probably more mileage in Typecraft.
 - [The Primeagen](https://www.youtube.com/@TheVimeagen) is a master at using neovim and is worth a watch. He's super fast, it's incredible to see how it can be used, and the payoff for perservering.
 - 
I've broken the plugins out into their own files within lua/plugins/ in keeping with typecraft on youtube.

## Vim Movements

If you don't understand why vim is so good then start here. The keyboard shortcuts for getting around the files are
incredibly powerful. There's a great [tutorial series](https://youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R&si=R6dQ_K0zt_8B9lM7) on YouTube by
[@ThePrimeagen](https://github.com/ThePrimeagen).


## Installation

Clone this repository into the default path for neovim configuration. If you don't know where that is then neovimt will tell you:
 - Inside neovim ensure you are in normal mode by pressing Esc
 - Type `:echo stdpath("config")` and press enter
 - The full path to the config folder will be displayed.

On linux the default is ~/.config/nvim and so to clone the neovim-config repo run this command from the shell: `git clone <path-to-repo> ~/.config/nvim`

After cloning the repository, the next time you run neovim it will install the new config and download anything else required. You'll see the Lazy package manager installing everything. When that's done you can quit `:q` then start neovim again. There may be dependencies which failed to load.


## Dependencies
There are a few things that need to be installed for this configuration to work. Here they are listed under the component which requires them.

#### Telescope
This is a plugin for finding things within the documents and filesystem.
```
sudo apt install ripgrep fd-find
```

#### Stylua
For styling LUA, this is useful for editting the neovim configuration docs.
```
sudo apt install unzip
```

#### Ruff
An LSP and linter for python. Works alongside pyright. The following line ensures that ruff is installed for the correct user.
Once this line is added, Ruff should be installed automatically. We've moved away from ruff-lsp in favour of Ruff (which is
the main development now and is supposed to be much faster.)
```
sudo apt install python3-venv
```

#### Pyright (install Node)
This is the main language server provider for python. It requires manual installation of Node for it to work.
```bash
# Get nvm which is the recommended way to install node.
# From https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

nvm install node
```
After installation, pyright should be installed on the next run of neovim.
