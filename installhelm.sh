echo "###############################################################"
echo "# Script: Pull the latest helm and upgrade the helm           #"
echo "# Description: To create a observability instance.            #"
echo "# Created date: 17/10/25                                      #"
echo "# Arthur: Alex J Davison (alexdav@cisco.com)                  #"
echo "# Version: 0.0.1                                              #"
echo "# Starting...                                                 #"
echo "###############################################################"
echo ""
echo "#################"
echo "# Starting loop #"
echo "#################"
echo ""

pasttime=""

while true
do
    echo "##############################"
    echo "# Update according to Github #"
    echo "##############################"
    echo ""
    echo "Step 1/5: Set branch 'backup-main' set up to track remote branch 'main' from 'origin'"
    git branch --set-upstream-to=origin/main backup-main
    echo "Step 2/5: Update all origin/<branch> refs to latest:"
    git fetch --all
    echo "Step 3/5: Backup your current branch"
    git checkout -b backup-main
    echo "Step 4/5: Jump to the latest commit on origin/main and checkout those files"
    git reset --hard origin/main
    echo "Step 5/5: Pull latest"
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
    
    currenttime=`ls -ltr | grep SMEObs1.yaml >> lastupdated.txt`
    echo "$currenttime"

    if [ -e SMEObs1.yaml ]
    then
        if [ currenttime!=pasttime ]
        then
            echo "Step 1/1: Upgrade helm"
            sudo microk8s helm upgrade splunk-otel-collector --values SMEObs1.yaml splunk-otel-collector-chart/splunk-otel-collector
            pasttime=$currenttime
        fi
    else
        echo "Step 0/0: Upgrade not possible"
        echo "No values.yaml"
    fi
done

