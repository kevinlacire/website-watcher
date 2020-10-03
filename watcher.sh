#!/bin/bash

#vente-immobilier-222788
#terrain-en-parc-residentiel-de-loisirs-sis-st-jacques-a-sarzeau

VENTE=$1
DESCRIPTION=$2

curl -XGET "https://www.webencheresimmo.com/$1/$2" -o "$1.html"
xmllint --html --nowarning --xpath "//span[@class='prix']/text()" "$1.html" > "$1.html.parsed" #TODO: rediret std output to /dev/null
PRIX=$(cat "$1.html.parsed")
echo "$(date), $PRIX" >> "$1.evolution"