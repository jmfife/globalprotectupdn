#!/bin/bash

# Script for activating and deactivating Global Protect on MacOS
# Adapted from commands provided by Lance Delorme
# J. M. Fife
# 2022-10-14

# The command line help and usage
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
   if launchctl list | grep pangps > /dev/null
   then
      echo "Global Protect Enabled"
   else
      echo "Global Protect Disabled"
   fi
else

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

   # Process command
   case $1 in
      up) #activate GP
         if ! launchctl list | grep pangps > /dev/null
         then
            echo "Re-Enabling Global Protect"
            launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
         else
            echo "GP Already Enabled"
         fi
         exit;;
      dn) # deactivate GP
         if launchctl list | grep pangps > /dev/null
         then
            echo "Disabling Global Protect"
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

