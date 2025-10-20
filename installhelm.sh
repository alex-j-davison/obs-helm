echo "###############################################################"
echo "# Script: Pull the latest helm and upgrade the helm           #"
echo "# Description: To create a observability instance.            #"
echo "# Created date: 17/10/25                                      #"
echo "# Arthur: Alex J Davison (alexdav@cisco.com)                  #"
echo "# Version: 1.0.0                                              #"
echo "# Starting...                                                 #"
echo "###############################################################"
echo ""

echo "##################"
echo "# Initialization #"
echo "##################"
echo ""
file=$1
echo "YAML:" ${file}
echo ""
echo "#################"
echo "# Starting loop #"
echo "#################"
echo ""

pasttime=`ls -ltr | grep "${file}.yaml"`

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
    
    echo "Step 1/4: Get file details" 
    currenttime=`ls -ltr | grep SMEObs1.yaml`
    
    echo "Step 2/4: Check if ${file}.yaml exists" 
    if [ -e ${file}.yaml ]
    then
        echo "Step 3/4: Check if ${file}.yaml has changed" 
        echo "C: $currenttime"
        echo "P: $pasttime"
        if [ "$currenttime" = "$pasttime" ];
        then
            echo "Step 4/4: Upgrade not possible, no change"
        else
            echo "Step 4/4: Upgrade helm"
            sudo microk8s helm upgrade splunk-otel-collector --values ${file}.yaml splunk-otel-collector-chart/splunk-otel-collector
            pasttime=$currenttime
            
        fi
    else
        echo "Step 3/4: Upgrade not possible, no yaml"
    fi
    echo ""
    total_seconds=15
    while [ $total_seconds -gt 0 ]; do
        printf "Time remaining: %d seconds\r" "$total_seconds"
        sleep 1
        total_seconds=$((total_seconds - 1))
    done
done