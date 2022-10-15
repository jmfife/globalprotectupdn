#!/bin/bash

# Script for activating and deactivating Global Protect on MacOS
# Adapted from commands provided by Lance Delorme
# J. M. Fife
# 2022-10-14

#########################
# The command line help #
#########################
Help() {
    Usage;
    echo
    echo "Description:"
    echo "    GlobalProtectUpDn can be used to disable and re-enable Global Protect on MacOS."
    echo
    echo "Options:"
    echo "    -h       Display this help message"
    echo
    echo "Commands:"
    echo "    up       Re-Enable Global Protect"
    echo "    dn       Disable Global Protect"
    echo
    echo "Example:"
    echo "    gp up"
    echo
}
Usage() {
    echo "Usage: gp [-h] [up|dn]"
}

if [ $# -eq 0 ]
then
   if [[ -f "/Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect" ]]
   then
      echo "GP Enabled"
   else
      echo "GP Disabled"
   fi
else

   # Call getopt to validate the provided input. 
   # options=$(getopt h --long help)
   # [ $? -eq 0 ] || { 
   #     echo "Incorrect options provided"
   #     exit 1
   # }
   # eval set -- "$options"

   # Get the options
   while getopts "h" option; do
      case $option in
         h) # display Help
            Help
            exit;;
         \?) # Invalid option
            Usage
            exit;;
      esac
   done

   # Process functional argument
   case $1 in
      up) #activate GP
         # if [[ -f "/Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak" ]]
         if ! launchctl list | grep pangps > /dev/null
         then
            echo "Re-Enabling Global Protect"
            # sudo mv /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect
            launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
         else
            echo "GP Already Enabled"
         fi
         exit;;
      dn) # deactivate GP
         # if [[ -f "/Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect" ]]
         if launchctl list | grep pangps > /dev/null
         then
            echo "Disabling Global Protect"
            # sudo mv /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak
            # sudo kill $(pgrep GlobalProtect)
            # sudo kill $(pgrep PanGPS)
            launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
         else
            echo "GP Already Disabled"
         fi
         exit;;
      *) # Invalid option
         echo "Error: Invalid Argument"
         Usage
         exit;;      
   esac
fi

