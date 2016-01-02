#!/bin/sh

if grep -q /opt/sf-ntp/cron /etc/crontab; then
	sed -i -e "/\/opt\/sf-ntp\/cron/d" /etc/crontab
fi
