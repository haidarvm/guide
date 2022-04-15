# install sdk
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# install java
sdk install java
sdk install java 17.0.2-open

# check java
sdk list java

# use
sdk use java 11.0.11-open

# default
sdk default java 11.0.11-open


# uninstall
sdk uninstall java 16.

# current
sdk current java


# list installed
sdk list java | grep installed