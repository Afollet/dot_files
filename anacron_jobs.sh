#!/bin/bash

if ! command -v clamscan &> /dev/null
then
    echo "clamav is not installed. Installing now..."
    sudo apt-get install clamav clam-daemon
fi

if ! dpkg -s anacron &> /dev/null
then
    echo "anacron is not installed. Installing now..."
    sudo apt-get install anacron
fi

echo '@weekly	100	clamscan	freshclam && sudo clamscan -i -r /home/alex >> /home/alex/clam_scan_logs' >> /etc/crontab

