#!/bin/bash

CLIENTARGS=""
uname -m | grep i686 && CLIENTARGS="-client -Xmx256m"

export JAVA_HOME=$(archlinux-java-run --max 8 --java-home)

if [[ -n ${JAVA_HOME} ]]; then
  javabin=${JAVA_HOME}/bin/java
else
  javabin=java
fi

SCDIR=/usr/lib/jitsi
LIBPATH=$SCDIR/lib
CLASSPATH=$LIBPATH/felix.jar:$SCDIR/sc-bundles/sc-launcher.jar:$SCDIR/sc-bundles/util.jar:$SCDIR/sc-bundles/dnsjava.jar:$LIBPATH
FELIX_CONFIG=$LIBPATH/felix.client.run.properties
LOG_CONFIG=$LIBPATH/logging.properties
COMMAND="$javabin $CLIENTARGS -Djdk.gtk.version=2.2 -classpath $CLASSPATH -Djna.library.path=$LIBPATH/native -Dfelix.config.properties=file:$FELIX_CONFIG -Djava.util.logging.config.file=$LOG_CONFIG net.java.sip.communicator.launcher.SIPCommunicator"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBPATH/native

cd $SCDIR

exec $COMMAND $*

