#!/bin/bash
source Scripts/config.env

aws ec2 reboot-instances --instance-id ${INSTANCE_ID}
echo "RESTARTED INSTANCE ID ${INSTANCE_ID}"