# Issabel
Install script

## Télécharger et installer en racine.
wget -P /tmp/ 'https://github.com/SebastienLeMoal/Issabel/archive/master.zip' --no-check-certificate

unzip /tmp/master.zip -d /tmp

/bin/cp -r /tmp/Issabel-master/* /

## On nettoie
rm -fR /tmp/Issabel-master

rm -f /tmp/archive.zip

rm -f /README.md

## Donner les droits au dossier
chmod -R +x /etc/custom

## Lancer le script d'installation
sh /etc/custom/script.sh