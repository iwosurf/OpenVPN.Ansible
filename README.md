## Ansible OpenVpn Server

The role openvpn.yml includes
- configure the openvpn server
- setup the network
- create server and client certificates

Tested OS
- Ubuntu 16.04

Role Variables
- change Variables in folder /roles/openvpn/defaults/main.yml

### Configure the CA Variables
```
key_country: "DE"
key_province: "NRW"
key_city: "Cologne"
key_org: "it"
key_email: "it@hivemindtechnologies.com"
key_ou: "it"
```
### Key name OpenVpn server
```
key_name: "server"
```
### Key name OpenVpn client
```
openvpn_key_name: alpha
```

### OpenVpn Network configuration
```
openvpn_network_addr: 10.8.0.0
openvpn_network_mask: 255.255.255.0

openvpn_port: 1194
openvpn_proto: udp

openvpn_networks: []
openvpn_push_dns: []
openvpn_domains:  []
```
## Create new OpenVPN key client

You can create a new client certificates.  
Go to folder /etc/openvpn/openvpn-ca/    
With the command ./ create.clientkey.sh" execute the script
Insert keyname
In the folder /etc/keyname you find the .zip folder with the keys   
