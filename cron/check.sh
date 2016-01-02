#!/bin/sh
# Tomasz Klim, 2009, 2015, 2016

/usr/sbin/ntpdate ntp.task.gda.pl ntp.icm.edu.pl tempus2.gum.gov.pl tempus1.gum.gov.pl >>/var/log/ntpdate
