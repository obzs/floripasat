#!/bin/bash
echo
echo "=========================================================================================="
echo
echo "                    ___ _    ___  ___ ___ ___  _     ___   _ _____  "
echo "                   | __| |  / _ \| _ \_ _| _ \/_\   / __| /_\_   _| "
echo "                   | _|| |_| (_) |   /| ||  _/ _ \  \__ \/ _ \| |   "
echo "                   |_| |____\___/|_|_\___|_|/_/ \_\ |___/_/ \_\_|   "
echo "                                                                    "
echo
echo "                    Automated Build System for Floripasat Project"
echo
echo "=========================================================================================="
echo
echo "How to use: .../auto-build.sh projectName projectWorkspace/"
echo
echo "Sample usage: ./auto-build.sh mcu-msp430f6659-blink1 /code/workspace_v6_1_3/"
echo

# Reference: http://processors.wiki.ti.com/index.php/Projects_-_Command_Line_Build/Create
#            http://processors.wiki.ti.com/index.php/Debug_Server_Scripting/Step_By_Step

if [ $# -lt "2" ]           # Test to see if there are 2 arguments
then
  echo "ERROR! Missing path argument!"
  echo "Usage: "$0" project_path"
  exit 1
fi 

PROJECT_NAME=$1
WORKSPACE_PATH=$2
COMPILER_PATH='/code/sdk/ti/ccsv6/eclipse/eclipse'

# - Clean project:
CMD_CLEAN=$COMPILER_PATH' -noSplash -data '$WORKSPACE_PATH' -application com.ti.ccstudio.apps.projectBuild -ccs.projects '$PROJECT_NAME' -ccs.clean'

# - Build projetct:
CMD_BUILD=$COMPILER_PATH' -noSplash -data '$WORKSPACE_PATH' -application com.ti.ccstudio.apps.projectBuild -ccs.projects '$PROJECT_NAME' -ccs.configuration Debug'

echo
echo "------------------------------------ CLEANING PROJECT ------------------------------------"
echo
echo $CMD_CLEAN
echo
$CMD_CLEAN
echo
echo "----------------------------------- CLEANING COMPLETED -----------------------------------"
echo

echo
echo "------------------------------------ BUILDING PROJECT ------------------------------------"
echo
echo $CMD_BUILD
echo
$CMD_BUILD
echo
echo "----------------------------------- BUILDING COMPLETED -----------------------------------"
echo
echo "=========================================================================================="
echo
