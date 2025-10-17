echo "###############################################################"
echo "# Script: Step-1 Setup observability instance                 #"
echo "# Description: To create a observability instance.            #"
echo "# Created date: 17/10/25                                      #"
echo "# Arthur: Alex J Davison (alexdav@cisco.com)                  #"
echo "# Version: 0.0.1                                              #"
echo "# Starting...                                                 #"
echo "###############################################################"
echo ""
echo "##############################"
echo "# Update according to Github #"
echo "##############################"
echo ""
echo "Step 1/5:"
git branch --set-upstream-to=origin/main backup-main
echo "Step 2/5:"
git fetch --all
echo "Step 3/5:"
git checkout -b backup-main
echo "Step 4/5:"
git reset --hard origin/main
echo "Step 5/5:"
git pull
echo ""
echo "###########################"
echo "# Update file permissions #"
echo "###########################"
echo ""
echo "Step 1/1: Update permissions"
chmod +x installhelm.sh
echo ""
echo "###############"
echo "# Update helm #"
echo "###############"
echo ""
if [ -e SMEObs1.yaml ]
then
    echo "Updating helm"
    sudo microk8s helm upgrade splunk-otel-collector --values SMEObs1.yaml splunk-otel-collector-chart/splunk-otel-collector
else
    echo "No values.yaml"
fi

