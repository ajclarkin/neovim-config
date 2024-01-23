# Installation script for all the OS dependencies required for my configuration.

# Ripgrep is needed for Telescope. There is a msvc and gnu version. Both should
# work; former is apparently smaller.
winget install "ripgrep msvc"


# Zip is one of the c compilers and seems to be small and easy to install.
# Needed for treesitter.
winget install zip.zip

# Node.js and npm are required for some features, particularly to get pyright working
# (which is a language server for python.)
winget install OpenJS.NodeJS.LTS
