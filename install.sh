#!/bin/bash
set -e

./Scripts/bootstrap-ec2.sh


./Testing/test-server.sh
