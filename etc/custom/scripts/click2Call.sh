#!/bin/bash

#########################################################
# Création 	: Gregoire Groison <gregoire@groison.eu>
# Modif		: Sébastien Le Moal <slemoal51@gmail.com>
# Fonction 	: Script d'automatisation d'installation du 
#			 module click2Call sur serveur Issabel 
# Date : Avril 2018
#########################################################

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

################################################
# Variables passées en argument : 
#				Aucune
################################################

# Couleurs 
rouge="\033[1;31m"
vert="\033[1;32m"
bleu="\033[1;34m"
default="\033[0m"

# Récupération de l'IP de la machine
IPADDR=`LANG=C /sbin/ip addr show dev eth0 | perl -ne 'print $1 if /inet (\d+\.\d+.\d+.\d+)/;'`

# Configuration AJAM
echo "enabled=yes
bindaddr=$IPADDR
bindport=8088
prefix=asteriska" > /etc/asterisk/http_custom.conf 
service asterisk restart
/sbin/iptables -A INPUT -p tcp -m tcp --dport 8088 -j ACCEPT
echo -e "Configuration AJAM [ $vert OK $default ]"

# Configuration des fichiers conf manager WEB
sed -i 13i'webenabled = yes ' /etc/asterisk/manager.conf
echo "[click_to_call]
secret=_@ClickToCall!!
deny=0.0.0.0/0.0.0.0
permit=192.168.0.0/255.255.0.0
permit=172.16.0.0/255.240.0.0
permit=10.0.0.0/255.0.0.0
permit=127.0.0.1/255.255.255.0
read = system,call,log,verbose,command,agent,user,all,originate
write = system,call,log,verbose,command,agent,user,all,originate
" >> /etc/asterisk/manager_custom.conf
echo -e "Configuration des comptes Manager C2C Asterisk Web [ $vert OK $default ]"

# Configuration fichier conf TAPI
echo "[activatsp]
secret = _@ClickToCall!!
deny=0.0.0.0/0.0.0.0
permit=192.168.0.0/255.255.0.0
permit=172.16.0.0/255.240.0.0
permit=10.0.0.0/255.0.0.0
permit=127.0.0.1/255.255.255.0
read = system,call,log,verbose,command,agent,user,config,command,dtmf,reporting,cdr,dialplan,originate
write = system,call,log,verbose,command,agent,user,config,command,dtmf,reporting,cdr,dialplan,originate
" >> /etc/asterisk/manager_custom.conf
echo -e "Configuration des comptes Manager C2C Asterisk TAPI [ $vert OK $default ]"