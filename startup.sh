#!/bin/bash
mkdir -p /run/sshd
/usr/sbin/sshd
/usr/sbin/apache2ctl  -D  FOREGROUND