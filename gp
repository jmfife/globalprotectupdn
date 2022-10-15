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
    echo "    GlobalProtectUpDn activates and de-activates Global Protect on MacOS"
    echo
    echo "Options:"
    echo "    -h       Display this help message"
    echo
    echo "Commands:"
    echo "    up       Activate Global Protect"
    echo "    dn       De-Activate Global Protect"
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
      echo "GP Active"
   else
      echo "GP Inactive"
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
         if [[ -f "/Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak" ]]
         then
            echo "Activating Global Protect"
            sudo mv /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect
         else
            echo "GP Already Active"
         fi
         exit;;
      dn) # deactivate GP
         if [[ -f "/Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect" ]]
         then
            echo "Deactivating Global Protect"
            sudo mv /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect.bak
            sudo kill $(pgrep GlobalProtect)
         else
            echo "GP Already Deactivated"
         fi
         exit;;
      *) # Invalid option
         echo "Error: Invalid Argument"
         Usage
         exit;;      
   esac
fi

