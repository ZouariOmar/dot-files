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

# Install yarn
sudo pacman -Sy yarn

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

# Install nnn
sudo pacman -S nnn

# Install n³ plugins
# See https://github.com/jarun/nnn/tree/master/plugins
# Plugins are installed to `${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins`
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)" # The following command installs or updates (after backup) all plugins
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview' # Set environment variable NNN_PLUG to assign keybinds and invoke plugins directly using the plugin shortcut (;) followed by the assigned key character

# Install pio-cli and make executable globally (See https://docs.platformio.org/en/latest/core/index.html)
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py
echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
sudo ln -s ~/.platformio/penv/bin/platformio ~/.local/bin/platformio
sudo ln -s ~/.platformio/penv/bin/pio ~/.local/bin/pio
sudo ln -s ~/.platformio/penv/bin/piodebuggdb ~/.local/bin/piodebuggdb

# Install freerdp for remote connections
sudo pacman -Syu freerdp

# Install GLAD and GLFW for openGL
# See https://glad.dav1d.de for GLAD
sudo pacman -Sy glad glfw

# Install nlohmann-json for .json parsing
sudo pacman -Sy nlohmann-json

# Install gradle
sudo pacamn -Sy gradle

# Install dirb
yay -Sy dirb

# Install postgresql
sudo pacman -Sy postgresql
sudo -iu postgres initdb -D /var/lib/postgres/data # Run it if this is a fresh install

# Install Oodo (see https://www.odoo.com/documentation/17.0/fr/administration/on_premise/source.html)
# Install `odoo-venv` or `odoo18-nightly` (Quick oodo setup)
yay -Sy odoo

# Install wheel-building helpers (required)
sudo pacman -S python-wheel python-setuptools # python-pip (optional)

# Install pyenv (manage many python version)
sudo pacman -Sy pyenv

# Install 'pacman-contrib' (Automatically remove unused pkg's)
sudo pacman -S pacman-contrib # Usage: paccache -r

# Install nmap
sudo pacman -Sy nmap

# Install lftp
sudo pacman -Sy lftp

# Install openvpn
sudo pacman -Sy openvpn

# Install AnyDesk
yay -Sy anydesk-bin

# Install arm-none-eabi-gcc  compiler (for STM32 dev)
sudo pacman -S arm-none-eabi-gcc    # Compiler
sudo pacman -S arm-none-eabi-newlib # Headers

# Install Hydra (Pen Test Tool)
sudo pacman -Sy hydra

# Install wordlists (Download a great set of wordlists. In /usr/share/wordlists)
yay -Sy wordlists

# Install RPM tools
sudo pacman -Sy rpm-tools

# Install Deb Dpkg
sudo pacman -Sy dpkg

# Install tesseract-ocr
sudo pacman -Sy tesseract

# Install jupyter
sudo pacman -Sy jupyterlab # [Recommended]
yay -Sy python-jupytext    # [optional] Convert .py to .ipynb       (for bash/nvim)
yay -Sy jupyter-nbconvert  # [optional] Convert .ipynb to .html/.md (for bash/nvim)

# Install zip
sudo pacman -Sy zip

# Install sdkman (i use it to install GraalVM)
curl -s "https://get.sdkman.io" | bash

# Install android sdk
yay -Sy android-sdk-platform-tools
yay -Sy android-sdk-cmdline-tools-latest # For `sdkmanager`

# Install Android Studio (i use only for Visual Layout Editor)
yay -Sy android-studio
