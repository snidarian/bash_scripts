#! /usr/bin/bash



# Ansi color codes
green="\e[1;32m"
red="\e[1;31m"
blue="\e[1;34m"
cyan="\e[1;36m"
reset="\e[0m"


# --------------------------------------------------
# function definitions

function connect_p2p()
{
    
    echo "----------------------------------------------"
    echo "########  Connecting  to P2P server ##########"
    echo "########  ########################  ##########"
    echo "----------------------------------------------"
    sudo protonvpn c --p2p
    protonvpn status
    echo "--------------------"
    echo "  Connected to P2P  "
    echo "--------------------"
}

# list alpha-2 country codes
function ls_alpha2_country_codes()
{
    echo -e "${green}Argentina: ${red}AR\n${green}Belgium: ${red}BE\n${green}Brazil: ${red}BR\n${green}Colombia: ${red}CO\n${green}Croatia: ${red}HR\n${green}Denmark: ${red}DK\n${green}Estonia: ${red}EE\n${green}Finland: ${red}FI\n${green}France: ${red}FR\n${green}Iceland: ${red}IS\n${green}Netherlands: ${red}NL\n${green}Singapore: ${red}SG\n${green}Switzerland: ${red}CH\n${green}South Africa: ${red}ZA\n${green}United States: ${red}US\n"
}


function connect_random()
{
    echo "------------------------------------------------"
    echo "########  Connecting to random server  #########"
    echo "########  ###########################  #########"
    echo "------------------------------------------------"
    sudo protonvpn c -r
    protonvpn status
    echo "----------------------"
    echo "  Connected to Rando  "
    echo "----------------------"
}


function protonvpn_status()
{
    echo "----------------------------------------------"
    echo "########          VPN STATUS        ##########"
    echo "########  ########################  ##########"
    echo "----------------------------------------------"
    protonvpn status
    echo "----------------------------------------------"
}


function disconnect()
{    
    sudo protonvpn disconnect
    echo "--------------------"
    echo "    DISCONNECTED    "
    echo "--------------------"
    protonvpn status
}

# EXECUTIONS


while getopts :sdlpc: OPT; do
    case $OPT in
	s|+s)
	    protonvpn_status
	    ;;
	l|+l)
	    ls_alpha2_country_codes
	    ;;
	d|+d)
	    disconnect
	    ;;
	p|+p)
	    connect_p2p
	    ;;
	c|+c)
	    #"$OPTARG"
	    echo "The country you selected is $OPTARG"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-sdpc ARG} [--] ARGS..."
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1



























