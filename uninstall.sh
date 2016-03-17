#!/bin/sh

if grep -q /opt/farm/ext/ntp/cron /etc/crontab; then
	sed -i -e "/\/opt\/farm\/ext\/ntp\/cron/d" /etc/crontab
fi
