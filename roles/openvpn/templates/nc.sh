#!/bin/bash
cd `dirname "$0"`
if mkdir -v {{ openvpn_key_name }}
    then
    . ./vars
    ./pkitool {{ openvpn_key_name }}
else
    # pushd {{ openvpn_key_name }}
    a=1
fi

cp -v keys/{{ openvpn_key_name }}.crt /etc/{{ openvpn_key_name }}/client.crt
cp -v keys/{{ openvpn_key_name }}.key /etc/{{ openvpn_key_name }}/client.key
cp -v keys/ca.crt /etc/{{ openvpn_key_name }}/ca.crt
cp -v keys/ta.key /etc/{{ openvpn_key_name }}/
cp -v client.ovpn /etc/{{ openvpn_key_name }}/
pushd {{ openvpn_key_name }}
zip -9 {{ openvpn_key_name }}.zip client.crt client.key ca.crt ta.key client.ovpn
tar cvf - client.crt client.key ca.crt ta.key client.ovpn | gzip -9 - > {{ openvpn_key_name }}.tgz
