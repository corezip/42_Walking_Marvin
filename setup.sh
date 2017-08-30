#!/bin/sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/29 14:19:21 by jaleman           #+#    #+#              #
#    Updated: 2017/08/29 14:19:22 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Directories variables.
BIN_DIR="marvin"
GYM_DIR="gym"
RES_DIR="resources"
LOG_DIR="logzero"

# Check if the user uses a Mac.
if [ $OS_NAME == "Darwin" ] ; then
    echo " > Updating packages / installing python..."
    brew update
    brew install python3
fi

# Check if there's a previous installation already.
if [ -d $BIN_DIR/$GYM_DIR/ ] ; then
    echo " > It seems that OpenAI Gym is already installed."
    while true; do
        read -p "Do you wish to overwrite the installation? [y / n] " yn
        case $yn in
            [Yy]* ) echo " > Cleaning previous installation..."; \
                    rm -Rf $BIN_DIR/$GYM_DIR/; break;;
            [Nn]* ) echo " > Nothing has been modified. Bye :)"; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Git clone the OpenAI Gym repository.
echo " > Git cloning the lastest OpenAI Gym commit from the repository..."
git clone https://github.com/openai/gym.git $BIN_DIR/$GYM_DIR/
cd $BIN_DIR/$GYM_DIR/

# Install the OpenAI Gym package.
echo " > Installing the OpenAI Gym package..."
pip install --user -e .
cd ../../

# Extracts all the files needed for the walking marvin enviroment.
echo " > Extracting and installing the walking marvin enviroment..."
cd $RES_DIR/
unzip envs.zip
cd ../
cp -Rf $RES_DIR/envs $BIN_DIR/$GYM_DIR/gym/envs/

# Remove extracted files.
echo " > Cleaning files..."
rm -Rf $RES_DIR/envs/

# Check if there's a previous installation already.
if [ -d $BIN_DIR/$LOG_DIR ] ; then
    echo " > It seems that logzero is already installed."
    while true; do
        read -p "Do you wish to overwrite the installation? [y / n] " yn
        case $yn in
            [Yy]* ) echo " > Cleaning previous installation..."; \
                    rm -Rf $BIN_DIR/$LOG_DIR/; break;;
            [Nn]* ) echo " > Nothing has been modified. Bye :)"; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Install logzero package.
echo " > Installing the logzero package..."
git clone https://github.com/metachris/logzero.git $BIN_DIR/$LOG_DIR/
cd $BIN_DIR/$LOG_DIR/
pip install --user setuptools
pip install --user -e .
cd ../../

# Shows a success message :D
echo " > Done! Everything is pepa."
echo "   Check the readme file to see how this shit works"
