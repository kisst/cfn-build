#!/usr/bin/env bash

sys_r=$(wc -l < system-requirements.txt)
pip_r=$(wc -l < pip-requirements.txt)

apt-get update -qq

if [ "$sys_r" -ne "0" ]
then
  xargs apt-get install -y < system-requirements.txt || exit 1
fi

pip3 install --upgrade pip

if [ "$pip_r" -ne "0" ]
then
  pip3 install -r pip-requirements.txt || exit 1
fi
