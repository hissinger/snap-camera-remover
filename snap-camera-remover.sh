#!/bin/bash

currentHome=/Users/hissinger
currentUser=`echo $currentHome | cut -d'/' -f 3`
currentUid=`id -u $currentUser`

launchctl asuser $currentUid launchctl unload -w $currentHome/Library/LaunchAgents/com.snap.AssistantService.plist
rm $currentHome/Library/LaunchAgents/com.snap.AssistantService.plist
launchctl asuser $currentUid launchctl remove com.snap.AssistantService

rm -rf $currentHome/'Library/Preferences/Snap/Snap Camera'
rm -rf $currentHome/'Library/Caches/Snap/Snap Camera'

rm -rf /Library/CoreMediaIO/Plug-Ins/DAL/SnapCamera.plugin

launchctl unload -w /Library/LaunchDaemons/com.snap.SnapCameraRemover.plist
rm /Library/LaunchDaemons/com.snap.SnapCameraRemover.plist
launchctl remove com.snap.SnapCameraRemover

rm -fr '/Applications/Snap Camera.app'
