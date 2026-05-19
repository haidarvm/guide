export PATH="$PATH:$HOME/.composer/vendor/bin"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/opt/gradle/gradle-9.1.0/bin



if [ -f ~/guide/bash_alias.conf ]; then
    . ~/guide/bash_alias.conf
fi

if [ -f ~/guide/alias_fedora.conf ]; then
    . ~/guide/alias_fedora.conf
fi

if [ -f ~/guide/bash_function.conf ]; then
    . ~/guide/bash_function.conf
fi