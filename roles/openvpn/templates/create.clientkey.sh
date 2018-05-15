#!/bin/bash

echo "Please enter the key name:"
read name
echo "You entered: $name"
mkdir $name
mkdir /etc/$name
. ./vars
./pkitool $name
cp -v keys/$name.crt /etc/$name/client.crt
cp -v keys/$name.key /etc/$name/client.key
cp -a keys/ca.crt /etc/$name/ca.crt
cp -a keys/ta.key /etc/$name/ta.key
cp -v client.ovpn /etc/$name/$name.ovpn
cd /etc/$name
zip -9 $name.zip client.crt client.key ca.crt $name.ovpn
