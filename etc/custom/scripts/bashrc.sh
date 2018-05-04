#!/bin/bash

#########################################################
# Création : Gregoire Groison <gregoire@groison.eu>        
# Fonction : Script d'automatisation d'installation d'un 
#			 serveur Issabel - Module commandes Bashrc 
# Date :     Juin 2015
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


echo "
PS1='\
\[\033[00m\][\
\[\033[31m\]\u\
\[\033[00m\]@\
\[\033[35m\]\H\
\[\033[00m\]:\
\[\033[34m\]\w\
\[\033[00m\]]\
\[\033[00m\]\$\
 '" >> /root/.bashrc

echo "alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias du='du -kh'
alias dud='du --max-depth=0'
alias df='df -kTh'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -lisah --color'
alias update='yum update'" >> /etc/bashrc