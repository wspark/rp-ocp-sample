#!/bin/sh

docker build -t ip-10-253-201-223.ap-northeast-2.compute.internal/jboss-eap-7/hanwhalife-eap72-openshift:v1.0 .
#docker build --no-cache=true -t ip-10-253-201-223.ap-northeast-2.compute.internal/jboss-eap-7/hanwhalife-eap72-openshift:v1.0 .
docker push ip-10-253-201-223.ap-northeast-2.compute.internal/jboss-eap-7/hanwhalife-eap72-openshift:v1.0

oc import-image  openshift/hanwhalife-eap72-openshift:v1.0  --from=ip-10-253-201-223.ap-northeast-2.compute.internal/jboss-eap-7/hanwhalife-eap72-openshift:v1.0  --insecure --confirm -n openshift
