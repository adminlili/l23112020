#!/bin/bash

yum -y remove bind bind-utils

rm -f /etc/named.conf
rm -rf /var/named


