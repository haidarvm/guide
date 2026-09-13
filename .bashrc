export PATH="$PATH:$HOME/.composer/vendor/bin"
export JAVA_HOME=/usr/lib/jvm/java-latest-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/opt/gradle/gradle-9.1.0/bin
export PATH="$PATH:$HOME/.composer/vendor/bin"



if [ -f ~/guide/bash_alias.conf ]; then
    . ~/guide/bash_alias.conf
fi

if [ -f ~/guide/alias_fedora.conf ]; then
    . ~/guide/alias_fedora.conf
fi

if [ -f ~/guide/bash_function.conf ]; then
    . ~/guide/bash_function.conf
fi
