#!/bin/bash

#########################################################
# Création	: Gregoire Groison <gregoire@groison.eu>
# Modif		: Sébastien Le Moal <slemoal51@gmail.com>
# Fonction	: Script d'automatisation d'installation du 
#			 module customcontexts sur serveur Issabel 
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

# On récupère le dbpasswd
dbPasswd=$(cat /etc/amportal.conf | grep AMPDBPASS | cut -d"=" -f2)

# Installation du module customcontexts (Installé de base à partir de Issabel 4.0)
#amportal a ma download customcontexts -R standard,extended,unsupported > /dev/null
#amportal a ma install customcontexts > /dev/null
#amportal a ma list | grep customcontexts
#echo -e "Installation du module CustomContexts [ $vert OK $default ]"

# Configuration du module customcontexts
mysql -uroot -p$dbPasswd asterisk < /etc/custom/templates/customcontexts.sql
echo -e "Import de la configuration du module CustomContexts [ $vert OK $default ]"