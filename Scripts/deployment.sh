#!/bin/bash
source Scripts/config.env

USER="ubuntu"
PUBLIC_IP="${PUBLIC_IP}"

chmod 400 Scripts/Key/mc-server-key

ls -l Scripts/Key/mc-server-key

ssh -i "Scripts/Key/mc-server-key" ${USER}@${PUBLIC_IP} << 'EOF'
    echo "--Connected To Server--"

    sudo apt update -y

    echo "--UPDATE FINISHED--"
    
    sudo apt install openjdk-25-jre-headless -y

    echo "--INSTALLED OPENJDK--"


    mkdir ~/minecraft-server && cd ~/minecraft-server
    echo "--FOLDER MADE--"

    wget -O server.jar "$(curl -s "$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r      '.versions[] | select(.id=="26.1.2") | .url')" | jq -r '.downloads.server.url')"
    echo "--GOT SERVER FILES--"

    echo "eula=true" > eula.txt
    echo "--AGREED TO EULA--"

    cd /etc/systemd/system/
    sudo touch minecraft.service
    sudo su
    sudo echo -e '[Unit]\nDescription=Minecraft Server 2\nAfter=network.target\n[Service]\nUser=ubuntu\nWorkingDirectory=/home/ubuntu/minecraft-server\nExecStart=/usr/bin/java -Xmx2G -Xms2G -jar server.jar nogui\nRestart=on-failure\n[Install]\nWantedBy = multi-user.target\n' >> /etc/systemd/system/minecraft.service
    echo "--CREATED MINECRAFT SERVICE--"

    sudo systemctl enable minecraft
    sudo systemctl start minecraft
    echo "--STARTED SERVER--"


    exit
    
EOF