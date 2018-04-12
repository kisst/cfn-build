#!/usr/bin/env bash

sys_r=$(wc -l < system-requirements.txt)
pip_r=$(wc -l < pip-requirements.txt)
node_r=$(wc -l < node-requirements.txt)

apt-get update -qq

if [ "$sys_r" -ne "0" ]
then
  xargs apt-get install -y < system-requirements.txt || exit 1
fi

pip install --upgrade pip

if [ "$pip_r" -ne "0" ]
then
  pip install -r pip-requirements.txt || exit 1
fi

if [ "$node_r" -ne "0" ]
then
  xargs npm i -g < node-requirements.txt || exit 1
fi

wget -O /usr/bin/yq https://github.com/mikefarah/yq/releases/download/1.14.1/yq_linux_amd64
chmod +x /usr/bin/yq

