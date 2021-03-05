#!/bin/sh

# LOG PATH Set #
#mkdir -p /hli_app/log/${HOSTNAME}-eap-log/
#cd /opt/eap/standalone/
#rm -rf log*
#ln -s /hli_app/log/${HOSTNAME}-eap-log/ log
#cd /opt/eap/bin/

# JAVA_OPTS #
export JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/eap/standalone/log/${HOSTNAME}_java_pid.hprof "

