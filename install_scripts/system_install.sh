#!/bin/bash

#sudo aptitude install -y zathura zathura-djvu

echo "Configuring git"

# git config --global --replace-all user.name # To replace all

git config --global color.ui true

read -p "Enter global user.name " name
git config --global user.name "$name"

read -p "Enter global user.email " email
git config --global user.name "$email"

git config --list
