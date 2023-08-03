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

echo '7	100	clamscan	clamscan -i -r /home/alex >> /home/alex/clam_scan_logs' >> /etc/anacrontab

