#!/bin/bash
# place this file in your dhclient or dhcpcd client exit hooks folder
# dhcpcd: /etc/dhcpcd.exit-hook (file)
# dhclient: /etc/dhcp/dhclient-exit-hooks.d/ (folder on debian)
# replace this variable with your WAN interface name
wan_interface="enp0s1"

aftr_name=$new_dhcp6_aftr_name
# dhclient appends an extra dot at the end
aftr_name="${aftr_name%\.}"

# Only execute on specific occasions
case $reason in
	BOUND6|EXPIRE6|REBIND6|REBOOT6|RENEW6)
	  if "$interface" = "$wan_interface" ]; then
	  	# act on the aftr_name by calling another script that creates the DS-Lite tunnel
	  	establish-ds-lite-tunnel $wan_interface $aftr_name 
	  else
	  	echo "WRONG INTERFACE"
	  fi
	;;
esac