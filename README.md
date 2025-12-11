# Obs-Helm

## Summary 

Script does the following:-

* Script: Helm installation script.
* Description: This application is designed to setup with Splunk Otel collector with a default configuration.
* Created by: Alex J Davison (alexdav@cisco.com)
* Created date: 20/10/25
* Version: 2.0.0 

## Scope of script

* Go to namespace
* Stash any changes in current repo
* Pull the latest version of the repo from the repo
* Ensure that the shell script in executable
* Upgrade the helm deployment if there is a newer data timestamp compare to the last time the script was ran
* Wait 15 seconds before starting loop again

## Files

* **_examples_** - folder containing example otel configs 
* .gitattributes - (https://git-scm.com/docs/gitattributes)
* .gitignore - (https://git-scm.com/docs/gitignore)
* installhelm.sh - Script to install helm (Script is a loop.)
* LICENSE
* newinstall.yaml - Otel fresh install config.
* README.md - This file (https://www.markdownguide.org/basic-syntax/)

## Arguments

* "$1" - yaml to be deployed

**_Note:-_** File type NOT required

**_Do below:-_**

<code>./obs-helm/installhelm.sh SMEObs1</code>

**_Do NOT below:-_**

<code>./obs-helm/installhelm.sh SMEObs1.yaml</code>

## Installation steps

Steps:-

1. Clone repo

<code>git clone https://github.com/alex-j-davison/obs-helm.git </code>

**_Note:-_** This is initialisation steps of the process, the shell script loops and updates itself

2. Change permissions on shell scripts to execution

<code> chmod +x ./obs-helm/installhelm.sh</code>

4. Run setup

<code>./obs-helm/installhelm.sh $HELM_CHART_NAME_HERE$</code>

**_Example below:-_**

<code>./obs-helm/installhelm.sh SMEObs1</code>

**_Note:-_** To stop the script, <code>Ctrl+C</code>

## Change log

### Version 2.0.0
- Update README
### Version 1.0.0
- Initial creation