FROM bastion.ps.example.com:5000/jboss-eap-7/eap73-openjdk8-openshift-rhel7:latest

USER root

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
#ENV JAVA_OPTS_APPEND="-Djboss.modules.system.pkgs=org.jboss.byteman,org.jboss.logmanager -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 "

ADD files/              /tmp

WORKDIR /tmp

RUN cp deployments/simple.war                 /deployments/                        

WORKDIR /opt/eap

#RUN mv -f rockplace-launch.sh /opt/eap/bin/launch/  \
# && mv -f standalone-openshift.xml /opt/eap/standalone/configuration/  \
# && mv -f modules.ext/com/mysql/8.0.16 /opt/eap/modules/system/layers/openshift/com/mysql/  \
# && mv -f modules.ext/com/oracle /opt/eap/modules/system/layers/openshift/com/    \
#RUN sed -i "4i\source $JBOSS_HOME/bin/launch/rockplace-launch.sh"  /opt/eap/bin/openshift-launch.sh \
# && chmod 664 /opt/eap/bin/launch/rockplace-launch.sh

RUN mkdir -p /app /logs            \
 && chown -R 185.root /app /logs /opt/eap  \
 && chmod -R 775 /app  /logs     

USER 185
