# install sdk
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# install java
sdk install java

# check java
sdk list java

# use
sdk use java 11.0.11-open

# default
sdk default java 11.0.11-open

# current

sdk current java
