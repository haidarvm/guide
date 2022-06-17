# download
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# save bash
source ~/.bashrc

# usage
nvm install 16 # or 16.3.0, 12.22.1, etc

# list available
nvm ls-remote

# list downloaded

# use
nvm use node
nvm run node --version


# uninstall 
nvm uninstall 16
