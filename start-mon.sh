#!/bin/bash

clear

echo "What do you want to do?"

select action in "Start Monitor Mode" "Stop Monitor Mode" "Exit"; do
    case $action in
        "Start Monitor Mode")
            airmon-ng check kill
	    airmon-ng start wlan0
            echo "wlan0 in monitor mode"
            break
            ;;
        "Stop Monitor Mode")
	    airmon-ng stop wlan0mon
	    systemctl start wpa_supplicant
	    systemctl start NetworkManager
            echo "Monitor Mode Stoped"
            break
            ;;
        "Exit")
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done
