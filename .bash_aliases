#!/bin/bash
alias p3='python3.6'
alias p2='python2.7'
alias xclipin='xclip -i -selection "clipboard"'
alias off='shutdown now'
alias gCalendar="laun firefox https://calendar.google.com/calendar/r"
alias k='kubectl'
alias pycharm='nohup snap run pycharm-professional & disown'
alias unigrep='grep -P "[^\x00-\x7F]"'
alias toPandas="~/scripts/toPanda.py"
alias toPyList="~/scripts/toPyList"
alias pdplot="~/scripts/pdplot.py"
alias replaceNoBreak="sed $'s/\u00A0/ /g'"
alias deleteNoBreak="sed $'s/\u00A0//g'"
alias click="xdg-open"
alias sl="sl -aF | lolcat"

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

