#! /bin/bash

sudo apt -y update
sudo apt install -y git
# paramétrage
git config --global user.name "DrX7FFF"
git config --global user.email "dubourg.v@gmail.com"
git config --global init.defaultBranch main
git config --list

# create folder
mkdir ~/GIT
