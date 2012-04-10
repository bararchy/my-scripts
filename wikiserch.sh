clear
echo "this nice script will serch a keyword in wikipedia for you"
echo "which volume would you like to serch?"
read serch
clear
echo "would you like to display in terminal(t) or notepad(n)?"
read display
if [ $display = "n" ]; then 
	dig +short txt $serch.wp.dg.cx | gedit &

elif [ $display = "t" ]; then
	tput bold 
	dig +short txt $serch.wp.dg.cx
	tput sgr0

fi
