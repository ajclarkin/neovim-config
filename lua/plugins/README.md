## Plugins

Each of these is loaded automatically by Lazy. The files themselves are written
by taking the suggested config from the respective github page using the Lazy setup.


### autopairs.lua
Causes brackets, quotes, and so on to be created in pairs.


### completions.lua
This one is a bit of a hotch-potch and is completely taken from video 5 in the typecraft tutorial on youtube.
There are a bunch of plugins required to do auto-completion and to use the same snippet selection as is available
in VSCode. **Requires LSP to be configured first.**


### lsp-config.lua
Another collection of plugins required for Language Server Protocol. All based around Mason.


### lualine.lua
This creates a nicer status bar at the bottom. Need to make sure that the terminal is using a nerd font.


### neotree.lua
This creates a file browser. You can set it to be displayed constantly at the side of the screen.
I have set it up to be available by pop-up using - in normal mode.


### none-ls.lua
Linting and formatting. Uses the modules listed in Mason but have to be specified separately.


### onedark.lua
This is a colour scheme. There are loads available.


### telescope.lua
Fuzzy finder. Use it to search for other files and within the current file.
Can also be used to show active keymaps: `:Telescope keymaps`


## treesitter.lua
This parses the given file into a nested tree stucture to then apply highlighting and indenting.
