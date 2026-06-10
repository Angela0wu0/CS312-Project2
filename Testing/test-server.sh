#!/bin/bash
source Scripts/config.env

PUBLIC_IP="${PUBLIC_IP}"

nmap -sV -Pn -p T:25565 ${PUBLIC_IP}
