oc delete -f wspark-sample-httpd-eap73-eap73-template.yaml
oc delete -f wspark-sample-httpd-eap73-eap73-volume.yaml
sleep 1

rm -rf  /mnt/openshift/wspark/sample-httpd-eap73-eap
ls -alR /mnt/openshift/wspark

oc get template wspark-sample-httpd-eap73-eap
oc get pv | grep wspark-sample-httpd-eap73
oc get pvc -n wspark | grep wspark-sample-httpd-eap73
