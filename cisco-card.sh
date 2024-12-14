#!/bin/sh
set -xe
#openconnect vpnprod.redetendencia.com.br
#openconnect cg5567.redetendencia.com.br
case $1 in
    c)
        /opt/cisco/anyconnect/bin/vpn connect cg5567.redetendencia.com.br
        exit 0
        ;;
    d)
        /opt/cisco/anyconnect/bin/vpn disconnect cg5567.redetendencia.com.br
        exit 0
        ;;
esac
