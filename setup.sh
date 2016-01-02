#!/bin/sh

if grep -q /opt/farm/scripts/check/clock.sh /etc/crontab; then
	echo "removing old crontab entry"
	sed -i -e "/farm\/scripts\/check\/clock.sh/d" /etc/crontab
fi

if ! grep -q /opt/sf-ntp/cron/check.sh /etc/crontab && [ "`ps aux|grep ntpd|grep -v grep`" = "" ]; then
	echo "setting up crontab entry"

	if [ -x /usr/bin/shuf ]; then
		rn=`shuf -i0-59 -n1`
	else
		rn=$((RANDOM%60))
	fi

	if [ "$rn" = "" ] || [ "$rn" = "0" ]; then
		rn=3
	fi

	echo "$rn 6 * * * root /opt/sf-ntp/cron/check.sh" >>/etc/crontab
fi
