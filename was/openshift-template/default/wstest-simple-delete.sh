oc delete -f wstest-simple-eap73-template.yaml
oc delete -f wstest-simple-eap73-volume.yaml
sleep 1

rm -rf  /mnt/openshift/wstest/simple-eap
ls -alR /mnt/openshift/wstest

oc get template wstest-simple-eap
oc get pv | grep wstest-simple
oc get pvc -n wstest | grep wstest-simple
