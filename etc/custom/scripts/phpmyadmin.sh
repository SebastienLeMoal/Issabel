#!/bin/bash

#########################################################
# Création :    Sebastien Le Moal <slemoal51@gmail.com>
#               Gregoire Groison <gregoire@groison.eu>
# Fonction : Script d'automatisation d'installation d'un 
#			 phpmyadmin sur serveur Issabel
# Date : Avril 2015
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

# Installation de phpmyadmin via yum
yum install phpmyadmin -y > /dev/null

echo "# phpMyAdmin - Web based MySQL browser written in php
# 
# Allows only localhost by default
#
# But allowing phpMyAdmin to anyone other than localhost should be considered
# dangerous unless properly secured by SSL

Alias /modules/dbadmin /usr/share/phpMyAdmin

<Directory /usr/share/phpMyAdmin/>
   Order Deny,Allow
   Allow from 127.0.0.1
   Allow from ::1
</Directory>

<Directory /usr/share/phpMyAdmin/scripts/>
   Order Deny,Allow
   Allow from 127.0.0.1
   Allow from ::1
</Directory>" > /etc/httpd/conf.d/phpMyAdmin.conf

service httpd restart

echo -e "Installation de phpmyadmin  [$vert OK$default ]\n"

echo -e "L'installation est terminée. Pour acceder a phpmyadmin entrez l'url suivante :\n\t $vert http://IP_ISSABEL/modules/dbadmin/ $default"