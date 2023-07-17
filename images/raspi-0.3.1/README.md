# Raspberry Image 0.3.1 for PINOT

Base: Ubuntu for Raspberry Pi 22.04.2

## Additional Software

- net-tools
- iw
- wireless-tools
- salt-minion
- Docker
- ufw
- tcpdump
- byobu
- python3-pip
- ncdu

## Configuration

- Create a separate user
- Block root: `passwd -d root`, `passwd -l root`
- remove snapd: https://www.debugpoint.com/remove-snap-ubuntu/
- switch from neplan to NetworkManager
- Setup USB access via serial console as per this article: https://www.tal.org/tutorials/setup-raspberry-pi-headless-use-usb-serial-console
- SSH: configure certificate-based authentication, disable password-based authentication
- Put [50-rpi-fan.rules](50-rpi-fan.rules) with addiitional settings for PoE hat fan to `/etc/udev/rules.d/50-rpi-fan.rules`
- Setup hostname to `pinotnode` and add it to /etc/hosts
- Configure networks using nmcli
  - see wifi.sh
- Put [98-lookup-tables.sh](98-lookup-tables.sh) to `/etc/NetworkManager/dispatcher.d` and make executable (`chmod +x`)
- Put [minion](minion) to `/etc/salt/minion`
- Add the next lines to the crontab:

  ```shell
  @reboot echo "raspi-"`cat /sys/class/net/eth0/address` > /etc/salt/minion_id
  @reboot rm /var/lib/salt/pki/minion/minion_master.pub
  ```

- execute all commands from [ufw-config.sh](ufw-config.sh) to enable the firewall
- run `byobu-enable` from non-sudo user
- set salt-minion to start after cron.service
