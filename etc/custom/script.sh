#!/bin/bash

#########################################################
# Création :    Sebastien Le Moal <slemoal51@gmail.com>
#               Gregoire Groison <gregoire@groison.eu>         
# Fonction : Script d'automatisation d'installation d'un 
#			 serveur Issabel
# Date :     Avril 2015
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
#               Aucune
################################################

# Couleurs 
rouge="\033[1;31m"
vert="\033[1;32m"
bleu="\033[1;34m"
default="\033[0m"

clear
echo -e "$bleu

$default"

# On récupère le dbpasswd dans le fichier /etc/amportal.conf
dbPasswd=$(cat /etc/amportal.conf | grep AMPDBPASS | cut -d"=" -f2)

# On vérifie la connexion a internet pour installer les paquets
isConnectedToInternet=$(ping -W 1 google.fr -c 1 > /dev/null 2>&1)
if [ $? -ne 0 ]; then 
    echo -e "$rouge ERROR : Impossible d'acceder à internet ! Verifiez les param. réseaux (DNS & default gw) puis relancez le script ! $default"
    exit
fi

########################## Mise a jour des paquets ###########################

echo -e "$bleu###################### Mises à jour #######################$default"
echo -e "Mise à jour du serveur"

yum update -y > /dev/null
echo -e "ETAPE 0 [ $vert Terminée$default ]\n"
sleep 5


########################## Configuration PBX ###########################

echo -e "$bleu###################### PBX #######################$default"
echo -e "Installation de la configuration PBX"
/etc/custom/scripts/pbx.sh $dbPasswd
if [ $? -ne 0 ]; then
    echo -e "$rouge ERROR : Erreur lors de l'execution du script /etc/custom/scripts/pbx.sh Merci de la corriger ! $default"
    exit
else
    echo -e "ETAPE 1 [$vert Terminée$default ]\n"
fi
sleep 5

########################## PhpMyAdmin ###########################

echo -e "$bleu###################### PhpMyAdmin #######################$default"
echo -e "Installation de phpmyadmin"
/etc/custom/scripts/phpmyadmin.sh
if [ $? -ne 0 ]; then
    echo -e "$rouge ERROR : Erreur lors de l'execution du script /etc/custom/scripts/phpmyadmin.sh Merci de la corriger ! $default"
    exit
else
    echo -e "ETAPE 2 [$vert Terminée$default ]\n"
fi
sleep 5


########################## Click2Call ###########################

echo -e "$bleu###################### Click2Call #######################$default"
echo -e "Installation du module Click2Call"
sleep 5

/etc/custom/scripts/click2Call.sh
if [ $? -ne 0 ]; then
    echo -e "$rouge ERROR : Erreur lors de l'execution du script /etc/custom/scripts/click2Call.sh Merci de la corriger ! $default"
    exit
else
    echo -e "ETAPE 5 [$vert Terminée$default ]\n"
fi
sleep 5

########################## Restriction d'appels ###########################

echo -e "$bleu###################### CustomContexts #######################$default"
echo -e "Installation et configuration du module CustomContexts"
sleep 5

/etc/custom/scripts/callRestrictions.sh
if [ $? -ne 0 ]; then
    echo -e "$rouge ERROR : Erreur lors de l'execution du script /etc/custom/scripts/callRestrictions.sh Merci de la corriger ! $default"
    exit
else
    echo -e "ETAPE 6 [$vert Terminée$default ]\n"
fi
sleep 5


########################## Reboot ###########################

clear
echo -e "$bleu###################### Installation terminée #######################$default"
echo -e "Redémarrage du système pour valider les changements..."
sleep 10

init 6