#!/bin/bash

alias cleardb='rm -rf --preserve-root  /home/afollette/Documents/pdx.graphdb/*'
alias neostart='sudo neo4j start'
alias loaddb='sudo rm -rf /home/afollette/Documents/neo4jdb/databases/graph.db/*; sudo mv /home/afollette/Documents/pdx.graphdb/* /home/afollette/Documents/neo4jdb/databases/graph.db'
alias sebi='ssh -A -X ebi-cli'
alias neokill="ps -ax | fgrep '/var/lib/neo4j/plugins:/etc/neo4j:/usr/share/neo4j/lib/*:/var/lib/neo4j/plugins' | grep -v 'grep' | sed 's/^\s//g'  | cut  -d ' ' -f 1 | xargs sudo  kill && echo 'Neo probably was terminated'"
alias neoload='sudo rm -rf /home/afollette/Documents/neo4jdb/databases/graph.db && sudo cp -r /home/afollette/Documents/pdx.graphdb /home/afollette/Documents/neo4jdb/databases/graph.db'
alias neobackup='tar -czvf /home/afollette/Documents/backups/pdx.graphdb.$(date +%Fhour%Hmin%M).tgz /home/afollette/Documents/pdx.graphdb'
alias loadMappings='sudo rm -rf /home/afollette/Documents/pdx.graphdb/*;   tar -xvf /home/afollette/Documents/backups/mappings.tgz -C /home/afollette/Documents/pdx.graphdb --strip-components=4'
alias bolt='firefox localhost:7474/ &'
alias neowf='neokill; neobackup && neoload && neostart && bolt'
alias updateCache='tar -czvf /home/afollette/Documents/backups/mappings.tgz /home/afollette/Documents/pdx.graphdb'
alias p3='python3.6'
alias p2='python2.7'
alias getLive='rsync -avz mi_adm@ves-ebi-d9:/nfs/web-hx/mouseinformatics/pdx/dev/neo4j-community-3.2.2/data/databases/pdxfinder.graphdb /home/afollette/Documents/backups/pdxfinder.graphdb-latest'
alias loadLive='rm -rf /home/afollette/Documents/neo4jdb/databaes/graph.db && cp /home/afollette/Documents/backups/pdxfinder.graphdb-latest/pdxfinder.graphdb/* /home/afollette/Documents/neo4jdb/databases/graph.db'
alias tsvHeaders='find . -name "*.tsv" -exec head -n 1 {} \; | sort | uniq -c'
alias ebiT='ssh -X -D 9090 -J afollette@ligate.ebi.ac.uk afollette@ebi-cli.ebi.ac.uk'
alias xclipin='xclip -i -selection "clipboard"'
alias off='shutdown now'
alias basicPS1="PS1='\[\033[01;32m\]user\$ \[\033[00m\]'"
alias standUp='laun firefox "$(cat /home/afollette/standUpZoom)"'
alias gCalendar="laun firefox https://calendar.google.com/calendar/r"
alias spotify="firefox https://open.spotify.com/"
alias gitter="laun firefox https://gitter.im/home/explore"
alias k='kubectl'
alias pd='pushd'
alias dirs='dirs -v'
#alias calc='libreoffice --calc'
alias pycharm='nohup snap run pycharm-professional & disown'
alias unigrep='grep -P "[^\x00-\x7F]"'
alias toPandas="~/scripts/toPanda.py"
alias toPyList="~/scripts/toPyList"
alias pdplot="~/scripts/pdplot.py"
alias replaceNoBreak="sed $'s/\u00A0/ /g'"
alias deleteNoBreak="sed $'s/\u00A0//g'"
alias click="xdg-open"
alias sl="sl -aF | lolcat"
alias pui="laun /usr/local/pulse/pulseUi"
alias nm="neomutt"
alias getm="mw -Y"

function by_provider(){
  previousDir="$(pwd)"
  cd /home/afollette/pdxfinder-data \
  &&  ./generate_tsv.bash --provider $1 \
  && cd "$previousDir"
}



function laun(){
  nohup $@ > /dev/null 2>&1 & disown
}

function ca(){
  libreoffice --calc "$1" & disown > /dev/null
}

function snapr(){
  laun snap run "$1"  
}

function neoload-custom(){
  sudo rm -rf /home/afollette/Documents/neo4jdb/databases/graph.db && sudo cp --verbose -r "$1" /home/afollette/Documents/neo4jdb/databases/graph.db
}

function loadIDE-custom(){
  sudo rm -rf /home/afollette/Documents/pdx.graphdb/* &&  tar -xvf "$1" -C /home/afollette/Documents/pdx.graphdb --strip-components=4
}

function lookupRs(){
curl --ciphers DEFAULT@SECLEVEL=1 'https://rest.ensembl.org/variation/human/'"$1" -H 'Content-type:application/json' | jq . -
}

function lookupSnpf(){
firefox 'https://www.ncbi.nlm.nih.gov/snp/'"$1" &
}
function lookupSeq(){
curl --ciphers DEFAULT@SECLEVEL=1 'https://rest.ensembl.org/sequence/region/human/'"$1"'?'  -H 'Content-type:application/json' | jq . -
}
function md_to_html(){
md_file="$1"
pandoc -o ${md_file[1,-4]}.html -t html -f commonmark "$md_file"
}
function recent(){
rows="$1"
ls -t | head -n "$rows" 
}

