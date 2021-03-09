#!/bin/sh

## PROJECT NAME ##
export oldPrjName=PROJECT9
export newPrjName=$1

## SERVICE NAME ##
export oldAppName=APPLE9
export newAppName=$2

## PV storage ##
export NAS_STORAGE="/data/nfs/app-pv"


### CHECK INPUT DATA ##
if [ e$newAppName == "e" ];
then
        echo " input PROJECT Info ....."
        echo " ex ) ./postinstall.sh \"New Project Name\" \"New Service Name\" "
        exit 1
fi

cp ./default/sample_yaml/default-eap7-template.yaml ${newPrjName}-${newAppName}-eap7-template.yaml
cp ./default/sample_yaml/default-eap7-volume.yaml ${newPrjName}-${newAppName}-eap7-volume.yaml

### create template ##
sed -i "s/${oldPrjName}/${newPrjName}/g" ./${newPrjName}-${newAppName}-eap7-*.yaml
sed -i "s/${oldAppName}/${newAppName}/g" ./${newPrjName}-${newAppName}-eap7-*.yaml

echo "#### SERVICE : $newAppName ####"
grep ${newAppName} ./${newPrjName}-${newAppName}-eap7-template.yaml

### create volume LOG,DATA ##
function new_vol() {
mkdir -p ${NAS_STORAGE}/${newPrjName}/${newAppName}/{log,app}
chown -R nfsnobody.nfsnobody ${NAS_STORAGE}/${newPrjName}
chmod -R 777 ${NAS_STORAGE}/${newPrjName}

echo "#### PV PATH ####"
ls -alR ${NAS_STORAGE}//${newPrjName}

oc login -u system:admin
oc create -f ${newPrjName}-${newAppName}-eap7-template.yaml
oc create -f ${newPrjName}-${newAppName}-eap7-volume.yaml

sleep 2
oc get pvc
}
new_vol

### Create Delete script ###
cat << EOF > ${newPrjName}-${newAppName}-delete.sh
oc delete -f ${newPrjName}-${newAppName}-eap7-template.yaml
oc delete -f ${newPrjName}-${newAppName}-eap7-volume.yaml
sleep 1

rm -rf  ${NAS_STORAGE}/${newPrjName}/${newAppName}
ls -alR ${NAS_STORAGE}/${newPrjName}

oc get template ${newPrjName}-${newAppName}
oc get pv | grep ${newPrjName}-${newAppName}
oc get pvc -n ${newPrjName} | grep ${newPrjName}-${newAppName}
EOF

chmod +x ./${newPrjName}-${newAppName}-delete.sh

