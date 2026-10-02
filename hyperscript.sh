#!/bin/bash 
# script ver 1.4br

#check directory
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [ -f "$SCRIPT_DIR/install.sh" ]; then
	source "$SCRIPT_DIR/install.sh"
else
	echo "error - install.sh not found"
	exit 1
fi

export INSTALL_OPTIONAL_PKGS


if [ -f /etc/os-release ]; then 
	source /etc/os-release #импорт переменных
        
	case "$ID" in #переменая содержит короткое название дистро
                ubuntu|debian)
                echo "starting debian installation"
		bash "$SCRIPT_DIR/packages/debian_install.sh"
                ;;
        	arch)
                echo "starting arch installation"
		bash "$SCRIPT_DIR/packages/arch_stall.sh"
                ;;
		opensuse*|suse)
		echo "starting opensuse installation"
		bash "$SCRIPT_DIR/packages/opensuse_stall.sh"
		;;
	*)
		
		#backup for ID
		if [[ "$ID_LIKE" == "suse" ]]; then
	   		 bash "$SCRIPT_DIR/opensuse_stall.sh"
		elif [[ "$ID_LIKE" == "debian" ]]; then
			bash "$SCRIPT_DIR/debian_install.sh"
		else
		echo "script dont supporting this distro, im srry"
                exit 1
		fi
		;;

esac

else
        echo "os-release doesnt exists, ur system is okay?"
	exit 1
fi
