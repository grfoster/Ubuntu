#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	#echo "Updating and Upgrading"
	#apt-get update && sudo apt-get upgrade -y
	
	#apt install dialog -y
	cmd=(dialog --backtitle "New Installation Script"  --separate-output --checklist  "Please Select Software you want to install:"  22 75 16)
	options=(
		1 "Update and Upgrade" off  # any option can be set to default to "on"
        2 "SMPlayer" off    
        3 "GIMP" off
        4 "Audacious" off
        5 "HTOP" off
        6 "Youtube-dl" off
        7 "Brave" off
        8 "Veracrypt" off
        9 "Ubuntu Restricted Extras" off
        10 "Gnome Tweak Tool" off
        11 "VLC" off
        12 "Bashtop Snap" off
        13 "Net Tools" off
        14 "Printer Driver" off
        15 "MPV" off
        16 "PulseAudio" off 
        17 "Wine 22.04" off
        18 "JUK" off
        19 "Librewolf" off
        20 "Stawberry" off
		21 "Remove Firefox" off
		)
	         
	         
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
		    
			1)
	                	#Update and Upgrade
				echo "Updating and Upgrading"
                		apt-get update && sudo apt-get upgrade -y
                            	;;		    
			2)
	            		#Install SMPlayer
				snap install smplayer
				;;
			3)
			    		#Install GIMP
				echo "Installing GIMP"
				apt install gimp -y
	            		;;
    			4)
					#Install Audacious GTK
				echo "Installing Audacious"
				apt install audacious -y
				;;
				
			5)
                    	#		Install htop
				echo "Installing htop"
				apt install htop -y
				;;

			6)
                    			#Install Youtube-dl
				echo "Installing Youtube-dl"
				snap install youtube-dl 
				;;
				
			7)
                    			#Install Brave
				echo "Installing Brave"
					apt install apt-transport-https curl gnupg
				curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
				echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
				apt update
				apt install brave-browser -y
				;;
	
			8)
		          		#Install Veracrypt
				echo "Installing Veracrypt"
						add-apt-repository ppa:unit193/encryption -y
				apt update -y
				apt install veracrypt -y
					;;
				
			9)
					#Ubuntu Restricted Extras
				echo "Installing Ubuntu Restricted Extras"
				apt install ubuntu-restricted-extras -y
				;;
            		10)
					#Ubuntu Gnome Tweak Tool
				echo "Installing Gnome Tweak Tool"
				apt install gnome-tweak-tool -y
				;;
			11)
                    			#Install VLC
				echo "Installing VLC"
				apt install vlc -y
				;;
            		12)
                    			#Install Bashtop
				echo "Installing Bashtop"
				snap install bashtop 
				;;
			13)
                    			#Install Net Tools
				echo "Installing Net Tools"
				apt install net-tools -y			
				;;	
            		14)
                    			#Install Printer Driver
				echo "Installing Printer Driver"
				wget http://download.ebz.epson.net/dsc/op/stable/debian/dists/lsb3.2/main/binary-amd64/epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb
				#sudo apt-get install lsb-release
				#dpkg -i epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb
				;;
            		
			15)
                    	#MPV
				echo "Installing MPV"
				apt install mpv -y			
				;;		
			16)
                    			#PulseAudio
				echo "Installing PulseAudio"
				apt install pulseaudio -y
				apt install pavucontrol -y				
				;;	
			
			17)
					#Wine
				echo "Wine"
				dpkg --add-architecture i386
				wget -nc https://dl.winehq.org/wine-builds/winehq.key
				mv winehq.key /usr/share/keyrings/winehq-archive.key
				wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
				mv winehq-jammy.sources /etc/apt/sources.list.d/
				apt update
				apt install --install-recommends winehq-stable		
				;;
				
		    	18)
                    			#JUK
				echo "Installing JUK"
				apt install juk -y
				;;
				
			19)
					#Librewolf
				echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
				wget http://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
				apt update
				apt install librewolf -y	
				;;

			20)
					#Stawberry
				echo "Installing Stawberry"
				add-apt-repository ppa:jonaski/strawberry
				apt update
				apt install strawberry
				;;
			21)
				snap remove firefox
			
				
				
	    esac
	done
fi
