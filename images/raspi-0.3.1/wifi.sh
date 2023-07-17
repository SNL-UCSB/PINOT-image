nmcli con add con-name SNLInternal type wifi ifname wlan0 ssid SNLInternal
nmcli con add con-name "UCSB Wireless Web" type wifi ifname wlan0 ssid "UCSB Wireless Web"

nmcli con modify SNLInternal wifi-sec.key-mgmt wpa-psk wifi-sec.psk "<redacted>"

nmcli con modify SNLInternal connection.autoconnect yes
nmcli con modify "UCSB Wireless Web" connection.autoconnect yes

nmcli con modify "UCSB Wireless Web" connection.autoconnect-priority 5
nmcli con modify SNLInternal connection.autoconnect-priority 10