#!/bin/bash

#pętla for
function zapis_do_pliku()
{
napis=$1

for ((i=0; i<${#napis}; i++)) do
{
if [ $i -eq 0 ]
then
echo "${napis:i:1}" > $2
else
echo "${napis:i:1}" >> $2
fi
}
done
}

#druga metoda
function zapis_do_pliku2()
{
echo "$1" | grep -o .> $2
}

function skladnia
{
echo ""
echo -e "skladnia: \033[32;40m zadanieEL.sh \033[37;40;1m Napis1 Napis2\033[0m"
echo ""
echo " Oba parametry Napis1 i Napis2 sa wymagane!"
}

function czy_parametry_we_OK()
{
if [ $1 -eq 0 ]
then 
echo ""
echo -e "\033[37;41m" "Uwaga!" "\033[0m" "Nie podales parametrow skryptu.\r"
skladnia
exit
elif [ $1 -eq 1 ]
then 
echo "" 
echo "Podales za malo parametrow wejsciowych"
skladnia
elif [ $1 -gt 2 ]
then
echo ""
echo "Podales za duzo parametrow wejsciowych"
skladnia
exit
elif [ $1 -eq 2 ]
then
echo ""
echo "Podales jako parametry wejsciowe dwa napisy"
echo "  Pierwszy parametr to : $2"
echo "     Drugi parametr to : $3"
echo ""
zapis_do_pliku $2 $3
#zapis_do_pliku2 $2 $3
fi
}

czy_parametry_we_OK $# $1 $2
