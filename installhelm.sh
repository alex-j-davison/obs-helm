echo "###############################################################"
echo "# Script: Step-1 Setup observability instance                 #"
echo "# Description: To create a observability instance.            #"
echo "# Created date: 17/10/25                                      #"
echo "# Arthur: Alex J Davison (alexdav@cisco.com)                  #"
echo "# Version: 0.0.1                                              #"
echo "# Starting...                                                 #"
echo "###############################################################"
echo ""

git branch --set-upstream-to=origin/main backup-main

git fetch --all

git checkout -b backup-main

git reset --hard origin/main

git pull

if [ -e SMEObs1.yaml ]
then
    echo "Updating helm"
    sudo microk8s helm upgrade splunk-otel-collector --values SMEObs1.yaml splunk-otel-collector-chart/splunk-otel-collector
else
    echo "No values.yaml"
fi

