# Install yay (AUR)
git clone https://aur.archlinux.org/yay-git.git && cd yay && makepkg -si && cd .. && rm -r yay

# Install vscode
sudo pacman -S visual-studio-code-bin

# Install keepassXC
sudo pacman -S keepassxc

# Install obsidian
sudo pacman -S obsidian

# Install MariaDB
sudo pacman -S mariadb
sudo mysql_secure_installation # run the secure installation script to set up a root password and secure the installation

# Install Subversion (SVN)
sudo pacman -S subversion

# Install Apache (httpd)
sudo pacman -S apache

# Install cmake
sudo pacman -S cmake

# Install ccache (compiler cache)
sudo pacman -S ccache

# Install nodejs and npm
sudo pacman -Syu nodejs npm

# Install Qt6 base development pkgs
sudo pacman -S qtcreator-devel(qtcreator) qt6-base qt6-3d qt6-multimedia qt6-network qt6-tools qt6-svg qt6-wayland

# Install doxygen
sudo pacman -S doxygen

# Install postman
sudo yay -S postman-bin

# Instaall php
sudo pacman -S php php-fpm php-mysql phpmyadmin

# Install OBS
sudo pacman -S obs-studio

# Install unzip
sudo pacman -S unzip

# Install neofetch
sudo pacman -S neofetch

# Install java
sudo pacman -S jdk-openjdk

# Install libreoffice (still/fresh)
sudo pacman -S libreoffice-still

# Install Uncomplicated Firewall
sudo pacman -S ufw && sudo systemctl enable ufw && sudo systemctl start ufw

# Change bash font (Oh My BASH!) || !OR USE "Oh My Posh!"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install Bash Completion
sudo pacman -S bash-completion

# Install the next gen ls command 
sudo pacman -S lsd

# Setup git
git config --global user.email "zouariomar20@gmail.com"
git config --global user.username "Zouari Omar"
git config --global user.name "Zouari Omar"

# Install Docker (!need pass and gnup(gpg))
sudo pacman -S docker

# Install oracle sql
yay -S oracle-instantclient-basic oracle-instantclient-sqlplus

# Install the docker-credential-pass helper
sudo pacman -S docker-credential-pass || yay -S docker-credential-pass

# Install the pass package (password manager: !need gnupg)
sudo pacman -S pass

# Tool for encrypting files
sudo pacman -S gnupg

# Install SFML (Simple and Fast Multimedia Library - for C++)
sudo pacman -S sfml

# Install build-essential equivalent in Arch Linux, base-devel, and pkg-config
sudo pacman -S base-devel pkg-config

# Install openCV lib (for C++)
sudo pacman -S opencv opencv-samples
pkg-config --modversion opencv4                     # Check the version of OpenCV to see if its correcly installed
firefox https://github.com/donaldssh/Install-OpenCV # For more details

# Install hdf5 and vtk (for opencv)
sudo pacman -S hdf5 vtk

# Install gdb (debuging tool)
sudo pacman -S gdb

# Install "pkg-config" for .pc files
sudo pacman -S pkg-config

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh
curl https://raw.githubusercontent.com/ollama/ollama/refs/heads/main/docs/linux.md  # Unistall ollama
curl https://raw.githubusercontent.com/jmont-dev/ollama-hpp/refs/heads/master/singleheader/ollama.hpp # Install ollama.hpp

# Install NVIDIA Drivers (for GPU)
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Install Cuda (for GPU)
sudo pacman -S cuda

# Install nvtop (real-time GPU usage graph)
sudo pacman -S nvtop

# Install less
sudo pacman -S less

# Basic installation for oracle-xe on archlinux
firefox https://gist.github.com/davidmaignan/d0d941cbf761678457b865e6de041af0

# Install coreutils (Error: /bin/df: unrecognized option '--direct')
sudo pacman -S coreutils

# Install net-tools
sudo pacman -S net-tools

# Install rpmextract
sudo pacman -S rpmextract

# Install Maven (for Java)
sudo pacman -S maven

# Install OpenShot
sudo pacman -S openshot

# Install graphviz (for doxygen)
sudo pacman -S graphviz

# Install texlive (for latex documantion, doxygen-latex) 
sudo pacman -S texlive

# Install valgrind (debuging tool)
sudo pacman -S valgrind

# Install tor (CLI/GUI)
sudo pacman -S torbrowser-launcher tor torsocks

# Install neovim (IDE)
# See also https://www.lazyvim.org/installation
sudo pacman -S neovim

# Install nvm (Node Version Manager)
sudo pacman -S nvm

# Install lazygit
sudo pacman -S lazygit

# Install fd (fd-find)
sudo pacman -S fd

# Install dlib (C++ toolkit containing machine learning algorithms)
git clone https://github.com/davisking/dlib.git
cd dlib
mkdir build
cd build
cmake ..
cmake --build .
sudo cmake --install .

# Install xclip
sudo pacman -S xclip

