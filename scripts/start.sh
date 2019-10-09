#!/bin/bash
nfd-start &
sleep 2s
ndn-repo-ng&
sleep 2s
nfdc face create udp4://atmos-den.es.net
sleep 2s
output=`nfdc route add /irods udp4://atmos-den.es.net`
echo $output
supervisord -n
