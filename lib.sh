#!/bin/sh

filename=./db
. ./functions.sh
#			COLORS
R='\033[0;31m'
NC='\033[0m'
B='\033[0;34m'
Y='\033[0;33m'

while true
do

if [ ! -f $filename ]
	then
		echo "\n${R}[*]${NC}Database not found!"
		touch $filename
		echo "${B}[*]${NC}New database initiated!"
		sleep 2
fi
	clear
	echo "
\t██╗     ██╗██████╗    ███████╗██╗  ██╗
\t██║     ██║██╔══██╗   ██╔════╝██║  ██║
\t██║     ██║██████╔╝   ███████╗███████║
\t██║     ██║██╔══██╗   ╚════██║██╔══██║
\t███████╗██║██████╔╝██╗███████║██║  ██║
\t╚══════╝╚═╝╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝
\t	    Library Manager

\t			Written by ${R}Paun Alexandru${NC}
\t				   ${R}Udrescu Catalin${NC}

"
	echo "${B}[*]${NC}Current database is ${Y}$filename${NC}\n"
	echo "
${B}[*]${NC}Please select an option:

${Y}[1]${NC} Add books...
${Y}[2]${NC} Delete books...
${Y}[3]${NC} Update books..
${Y}[4]${NC} Search for a book...
${Y}[5]${NC} Change current database...


${Y}[99]${NC}Exit 
"
	
	read option
	case $option in
		1) add_f;;
		2) delete_f;;
		3) update_f;;
		4) search_f;;
		5) change_f;;
		99) echo "\n${B}[*]${NC}Exiting...\n"
			exit 0;;
	esac
done
