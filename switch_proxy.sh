#! /bin/bash

HTTP_PROXY_HOST=127.0.0.1
HTTP_PROXY_PORT=1080
HTTPS_PROXY_HOST=127.0.0.1
HTTPS_PROXY_PORT=1080
SOCKS_PROXY_HOST=127.0.0.1
SOCKS_PROXY_PORT=1080

to_manual()
{
	gsettings set org.gnome.system.proxy mode manual
	gsettings set org.gnome.system.proxy.http host "$HTTP_PROXY_HOST"
	gsettings set org.gnome.system.proxy.http port "$HTTP_PROXY_PORT"
	gsettings set org.gnome.system.proxy.https host "$HTTPS_PROXY_HOST"
	gsettings set org.gnome.system.proxy.https port "$HTTPS_PROXY_PORT"
	gsettings set org.gnome.system.proxy.socks host "$SOCKS_PROXY_HOST"
	gsettings set org.gnome.system.proxy.socks port "$SOCKS_PROXY_PORT"

	#sudo sed -i.bak '/http[s]::proxy/Id' /etc/apt/apt.conf
	#sudo tee -a /etc/apt/apt.conf <<EOF
	#Acquire::http::proxy "http://$HTTP_PROXY_HOST:$HTTP_PROXY_PORT/";
	#Acquire::https::proxy "http://$HTTPS_PROXY_HOST:$HTTPS_PROXY_PORT/";
	#Acquire::socks::proxy "http://$SOCKS_PROXY_HOST:$SOCKS_PROXY_PORT/";
	#EOF

	#sudo sed -i.bak '/http[s]_proxy/Id' /etc/environment
	#sudo tee -a /etc/environment <<EOF
	#http_proxy="http://$HTTP_PROXY_HOST:$HTTP_PROXY_PORT/"
	#https_proxy="http://$HTTPS_PROXY_HOST:$HTTPS_PROXY_PORT/"
	#socks_proxy=""
	#EOF
}

to_disabled()
{
	gsettings set org.gnome.system.proxy mode none
}

print_cur_cfg()
{
	gsettings get org.gnome.system.proxy mode
}

if [ $# == 1 ]
then
	case $1 in
	"-m")
		echo "set proxy to manuanl"
		;;
	"-d")
		echo "set proxy to disabled"
		to_disabled
		;;
	*)
		echo "wrong input"
		;;
	esac
else
	echo $#
	print_cur_cfg
fi
