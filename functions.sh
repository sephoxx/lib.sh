add_f()
{

while true
do
	echo "\n${B}[*]${NC}--------------------------------------------------"
	echo "\n${B}[*]${NC}Adding to database ${Y}$filename${NC}\n"
	echo "${B}[*]${NC}Please enter requested information to add a book\n"
	echo "${Y}[*]${NC}Book name: " ; read name 
	echo "\n${Y}[*]${NC}Author: " ; read auth
	echo "\n${Y}[*]${NC}ISBN: " ; read isbn
	echo "\n${Y}[*]${NC}Date: " ; read date
	echo "\n${B}[*]${NC}Name: $name Author: $auth ISBN: $isbn Date: $date"
	echo "${Y}[*]${NC}Is the data correct? (y/n)" ; read answ
	case $answ in
		[Yy]) echo "\n${B}[*]${NC}Adding the data.."
		      echo $name:$auth:$isbn:$date >> $filename
		      sort -u $filename -o $filename
		      echo "\n${Y}[*]${NC}Do you want to continue? (y/n) " ; read answ
	   	      if [ $answ = "y" -o $answ = "Y" ]
		      then continue
		      else return
		      fi;;
		   *) echo "\n${Y}[*]${NC}Try again? (y/n) " ; read answ
		      case $answ in
			      [Yy]) continue;;
			      [Nn]) return;;
			      *) echo "\n${R}[*]${NC}Invalid option!"
				 return
				 esac;;
	esac
done
}

delete_f()
{
while true
do
	echo "\n${B}[*]${NC}--------------------------------------------------"
	echo "\n${B}[*]${NC}Deleting from database ${Y}$filename${NC}"
	echo "\n${Y}[*]${NC}Which book would you like to delete? (search by book, author, ISBN, or date)"
	read answ
	found=$(cat $filename | grep -i -i $answ | wc -l | tr -d '\n')
	if [ "$found" != "1" ];
	then
		echo "\n${B}[*]${NC}$found books found:"
		cat $filename | grep -i -i --color=always $answ | sed -e 's/:/ - /g'
		echo "${B}[*]${NC}Please be more specific. Would you lke to try again? (y/n) "
		read answer
		case $answer in
			[Yy]) continue;;
			[Nn]) return;;
			*) echo "\n${R}[*]${NC}Invalid option!"
				return;;
		esac
	else
		echo -n "\n${Y}[*]${NC}Are you soure you want to delete " ; cat $filename | grep -i --color=always $answ | sed -e 's/:/ - /g' | tr '\n' '?'
		read answer
		case $answer in
			[Yy]) sed -i "/$answ/d" $filename 
			      echo "\n${B}[*]${NC}Book deleted";;
			[Nn]) return;;
			*) echo "\n${R}[*]${NC}Invalid option!"
				return;;	
		esac	
	fi
	echo "\n${Y}[*]${NC}Do you want to continue? (y/n) " ; read answ
	if [ $answ = "y" -o $answ = "Y" ]
	then continue
	else return
	fi

done
}

update_f()
{
while true
do
	echo "\n${B}[*]${NC}--------------------------------------------------"
	echo "\n${B}[*]${NC}Updating from database ${Y}$filename${NC}"
	echo "\n${Y}[*]${NC}Which book would you like to update? (search by book, author, ISBN, or date)"
	read answ
	found=$(cat $filename | grep -i  $answ | wc -l | tr -d '\n')
	if [ "$found" != "1" ];
	then
		echo "\n${B}[*]${NC}$found books found:"
		cat $filename | grep -i --color=always $answ | sed -e 's/:/ - /g'
		echo "${B}[*]${NC}Please be more specific. Would you lke to try again? (y/n) "
		read answer
		case $answer in
			[Yy]) continue;;
			[Nn]) return;;
			*) echo "\n${R}[*]${NC}Invalid option!"
				return;;
		esac
	else
		sed -i "/$answ/d" $filename
		echo "${Y}[*]${NC}Book name: " ; read name 
		echo "\n${Y}[*]${NC}Author: " ; read auth
		echo "\n${Y}[*]${NC}ISBN: " ; read isbn
		echo "\n${Y}[*]${NC}Date: " ; read date
		echo "\n${B}[*]${NC}Name: $name Author: $auth ISBN: $isbn Date: $date"
		echo "${Y}[*]${NC}Is the data correct? (y/n)" ; read answ
		case $answ in
			[Yy]) echo "\n${B}[*]${NC}Updating the data.."
		      	echo $name:$auth:$isbn:$date >> $filename
		      	sort -u $filename -o $filename
		echo "\n${Y}[*]${NC}Do you want to continue? (y/n) " ; read answ
	   	if [ $answ = "y" -o $answ = "Y" ]
		then continue
		else return
		fi;;
		*) echo "\n${Y}[*]${NC}Try again? (y/n) " ; read answ
		      	case $answ in
			      	[Yy]) continue;;
			      	[Nn]) return;;
			      	*) echo "\n${R}[*]${NC}Invalid option!"
				 	return
				 	esac;;
			esac
	fi

done

}

search_f()
{
while true
do
	echo "\n${B}[*]${NC}--------------------------------------------------"
	echo "\n${Y}[*]${NC}Search in ${Y}$filename${NC} by book, author, ISBN, or date:"
	read answ
	found=$(cat $filename | grep -i  $answ | wc -l | tr -d '\n')
	echo "\n${B}[*]${NC}$found books found:"
	cat $filename | grep -i --color=always $answ | sed -e 's/:/ - /g'
	echo "\n${Y}[*]${NC}Search again? (y/n) "
		read answer
		case $answer in
			[Yy]) continue;;
			[Nn]) return;;
			*) echo "\n${R}[*]${NC}Invalid option!"
				return;;
		esac


	
done
}

change_f()
{
	echo "\n${B}[*]${NC}--------------------------------------------------"
	echo "\n${B}[*]${NC}Current database is ${Y}$filename${NC}"
	echo "\n${Y}[*]${NC}What do you want to change it into? (Will be created if it doesn't exist)"
	read answer
	filename=./$answer
	echo "\n${B}[*]${NC}Database changed"	
}
