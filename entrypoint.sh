#!/bin/bash  

set -e
DOMAIN=`echo $USER | cut -s -d'@' -f 2`

[[ -z $USER ]]   && echo "Error USER not defined. Please, define the USER enviroment variable (e.g.: bob@gmail.com)." && exit -1
[[ -z $PASSWORD ]]   && echo "Error PASSWORD not defined. Please, define the PASSWORD environment variable." && exit -2
[[ -z $DOMAIN ]] && echo "Error invalid DOMAIN. Could not extract domain from USER." && exit -3

echo "User:   $USER"
echo "Domain: $DOMAIN"

echo $DOMAIN > /etc/mailname


# Configure postfix
echo -e "
biff = no
append_dot_mydomain = no
recipient_delimiter = +
inet_interfaces = all
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_path = smtpd
smtp_sasl_password_maps = hash:/etc/postfix/saslpass
smtp_sasl_auth_enable = yes
smtp_cname_overrides_servername = no
smtp_sasl_security_options = noanonymous
smtp_tls_CApath = /etc/ssl/certs
smtp_use_tls = yes
maillog_file = /dev/stdout
smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination
" > /etc/postfix/main.cf

echo "[smtp.gmail.com]:587 $USER:$PASSWORD" \
	>> /etc/postfix/saslpass

postmap /etc/postfix/saslpass

echo "Starting postfix"
exec postfix start-fg
