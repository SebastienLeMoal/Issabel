#!/bin/bash

#########################################################
# Création :    Sebastien Le Moal <slemoal51@gmail.com>
#               Gregoire Groison <gregoire@groison.eu>
# Fonction : Configuration PBX Issabel
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

# Couleurs 
rouge="\033[1;31m"
vert="\033[1;32m"
bleu="\033[1;34m"
default="\033[0m"

dbPasswd=$1

# Suppression des messages inutiles
cd /var/lib/asterisk/mohmp3/
rm -f macroform-cold_day.gsm macroform-robot_dity.gsm macroform-the_simplicity.gsm manolo_camp-morning_coffee.gsm reno_project-system.gsm
cd /
echo -e "Supression des musiques  [$vert OK$default ]\n"

# Ajout des modèles de poste GS
mysql -p$dbPasswd -e "INSERT INTO endpointconfig.model VALUES('','21','SIP-T19/T19P','SIP-T19/T19P','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T19/T19P'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-T21/T21P','SIP-T21/T21P','2','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T21/T21P'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','2');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-T41/T41P','SIP-T41/T41P','3','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T41/T41P'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','3');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-T42/T42G','SIP-T42/T42G','3','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T42/T42G'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','3');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-T46/T46G','SIP-T46/T46G','6','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T46/T46G'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','6');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-T48/T48G','SIP-T48/T48G','6','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-T48/T48G'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','6');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','21','SIP-W52/W52P','SIP-W52/W52P','5','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='SIP-W52/W52P'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','5');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1100','GXP1100','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1100'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1105','GXP1105','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1105'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1100','GXP1100','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1100'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1160','GXP1160','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1160'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1165','GXP1165','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1165'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1620','GXP1620','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1620'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP1625','GXP1625','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1625'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP2130','GXP2130','3','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP2130'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','3');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP2140','GXP2140','4','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP2140'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','4');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXP2170','GXP2170','1','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXP2170'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','1');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXV3240','GXV3240','6','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXV3240'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','6');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXV3275','GXV3275','6','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXV3275'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','6');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXW4216','GXW4216','16','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXW4216'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','16');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXW4224','GXW4224','24','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXW4224'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','24');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXW4232','GXW4232','32','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXW4232'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','32');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','GXW4248','GXW4248','48','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='GXW4248'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','48');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

SELECT @id:=id FROM endpointconfig.model WHERE name='GXP1450'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'telnet_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'telnet_password','admin');

INSERT INTO endpointconfig.model VALUES('','10','DP715','DP715','5','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='DP715'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','5');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'ssh_password','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');

INSERT INTO endpointconfig.model VALUES('','16','M700','M700','200','1','1','1');
SELECT @id:=id FROM endpointconfig.model WHERE name='M700'; 
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_sip_accounts','200');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'max_iax2_accounts','0');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_username','admin');
INSERT INTO endpointconfig.model_properties VALUES('',@id,'http_password','admin');" > /dev/null

echo -e "Ajout des modèles  [$vert OK$default ]\n"

# Routes sortantes

mysql -p$dbPasswd -e "
INSERT INTO asterisk.outbound_routes VALUES
(2, 'Urgence', '', '', '', 'YES', '', 'default', NULL, ''),
(3, 'National', '', '', '', '', '', 'default', NULL, ''),
(4, 'GSM', '', '', '', '', '', 'default', NULL, ''),
(5, 'Speciaux', '', '', '', '', '', 'default', NULL, ''),
(6, 'International', '', '', '', '', '', 'default', NULL, '');

INSERT INTO asterisk.outbound_route_patterns VALUES
(2, '', '11[02459]', '', ''),
(2, '', '116000', '', ''),
(2, '', '116117', '', ''),
(2, '', '19[167]', '', ''),
(2, '', '1[578]', '', ''),
(3, '', '0[1-59]XXXXXXXX', '', ''),
(3, '', '080[0-5]XXXXXX', '', ''),
(4, '', '0[67]XXXXXXXX', '', ''),
(5, '', '08XXXXXXXX', '', ''),
(5, '', '118XXX', '', ''),
(5, '', '[1-3]XXX', '', ''),
(6, '', '00.', '', '');

INSERT INTO asterisk.outbound_route_sequence VALUES
(2, 0),
(3, 1),
(4, 2),
(5, 3),
(6, 4);

INSERT INTO asterisk.outbound_route_trunks VALUES
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0);

DELETE FROM asterisk.outbound_route_trunks WHERE route_id='1';
DELETE FROM asterisk.outbound_route_sequence WHERE route_id='1';
DELETE FROM asterisk.outbound_route_patterns WHERE match_pattern_prefix='9';
DELETE FROM asterisk.outbound_routes WHERE name='9_outside';" > /dev/null

echo -e "Ajout des routes sortantes  [$vert OK$default ]\n"

# Langages 
sed -i 4i'language=fr' /etc/asterisk/chan_dahdi.conf 
sed -i 14i'defaultlanguage=fr' /etc/asterisk/asterisk.conf

echo -e "Configuration de la langue  [$vert OK$default ]\n"

# 0 manquant lors de la présentation du numéro
echo '
[from-pstn-custom]
exten => _X.,1,Gosub(correction-callerid,1,1)

[correction-callerid]
exten => 1,1,noop(Correction du format du callerid)
same => n,GotoIf($[${CALLERID(num)} = ""]?fincorrection)
same => n,GotoIf($[${LEN(${CALLERID(num)})} = 9]?neufchiffres)
same => n,GotoIf($[${CALLERID(num):0:2} = 33]?debut33)
same => n,goto(fincorrection)
same => n(neufchiffres),Set(CALLERID(num)=0${CALLERID(num)})
same => n(neufchiffres),goto(fincorrection)
same => n(debut33),Set(CALLERID(num)=0${CALLERID(num):2})
same => n(debut33),goto(fincorrection)
same => n(fincorrection),NoOP(CALLERID->${CALLERID(num)})
same => n,Return()
' >> /etc/asterisk/extensions_custom.conf 

echo -e "Ajout du 0 manquant [$vert OK$default ]\n"

# Activation du routage
sysctl -w net.ipv4.ip_forward=1 > /dev/null

echo -e "Activation du routage [$vert OK$default ]\n"

# Activation du support video H264
echo "videosupport=yes
allow=h264" > /etc/asterisk/sip_custom.conf

echo -e "Activation du support vidéo H264 [$vert OK$default ]\n"