#!/bin/bash
. /opt/farm/scripts/init

if [ "$HWTYPE" = "container" ] || [ "$HWTYPE" = "lxc" ]; then
	echo "skipping ntp configuration on container"
	exit 0
fi

if ! grep -q /opt/farm/ext/ntp/cron/check.sh /etc/crontab && [ "`ps aux|grep ntpd|grep -v grep`" = "" ]; then
	echo "setting up crontab entry"
	echo "$((RANDOM%60)) 6 * * * root /opt/farm/ext/ntp/cron/check.sh" >>/etc/crontab
fi
