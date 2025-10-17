echo "###############################################################"
echo "# Script: Step-1 Setup observability instance                 #"
echo "# Description: To create a observability instance.            #"
echo "# Created date: 17/10/25                                      #"
echo "# Arthur: Alex J Davison (alexdav@cisco.com)                  #"
echo "# Version: 0.0.1                                              #"
echo "# Starting...                                                 #"
echo "###############################################################"
echo ""

git pull

if [ -e values.yaml ]
then
    echo "Updating helm"
    helm upgrade splunk-otel-collector --values values.yaml splunk-otel-collector-chart/splunk-otel-collector
else
    echo "No values.yaml"
fi

