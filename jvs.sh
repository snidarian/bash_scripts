#! /usr/bin/bash



# function definitions

function connectp2p()
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


function connectRandom()
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


function protonvpnStatus()
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


# jvs s
if [ $1 == "s" ] || [ $1 == "status" ]
then
    protonvpnStatus
fi

# jvs p

if [ $1 == "p" ] || [ $1 == "p2p" ]
then
    connectp2p
fi


# jvs r
if [ $1 == "r" ] || [ $1 == "random" ]
then
    connectRandom
fi


# jvs d
if [ $1 == "d" ] || [ $1 == "disconnect" ]
then
    disconnect
fi




























