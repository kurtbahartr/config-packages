#!/usr/bin/env bash

# Lunar Shell installer for Archlinux.
#
# The original installer does way more than this and is aimed towards
# servers, whereas this installer is meant for client use and IS NOT
# PLANNED TO BE OFFICIAL ANY TIME SOON.
#
# Based on the original Ubuntu installer and maintained by
# Linda St-Denis.

echo "[/] Checking for updates.."
sudo pacman -Syyu --noconfirm
echo "[+] Updates check/install complete"

if ! command -v figlet &> /dev/null; then
    echo "[/] Installing figlet.. (Passing script to Pacman)"
    echo "======"
    sudo pacman -S --noconfirm figlet
    echo "======"
    echo "[+] figlet installed"
else
    echo "[+] figlet already installed"
fi

if ! command -v jq &> /dev/null; then
    echo "[/] Installing jq.. (Passing script to Pacman)"
    echo "======"
    sudo pacman -S --noconfirm jq
    echo "======"
    echo "[+] jq installed"
else
    echo "[+] jq already installed"
fi

if ! command -v starship &> /dev/null
then
    echo "[/] Installing starship.. (Passing script to Pacman)"
    echo "======"
    sudo pacman -S --noconfirm starship
    echo "======"
    echo "[+] Starship installed"
else
    echo "[^] Starship already installed"
fi

if ! command -v mpstat &> /dev/null
then
    echo "[/] Installing sysstat.. (Passing script to Pacman)"
    echo "======"
    sudo pacman -S --noconfirm sysstat
    echo "======"
    echo "[+] sysstat installed"
else
    echo "[^] sysstat already installed"
fi

if ! command -v zsh &> /dev/null
then
    echo "[/] Installing zsh.. (Passing script to Pacman)"
    echo "======"
    sudo pacman -S --noconfirm zsh
    echo "======"
    echo "[+] zsh installed"
else
    echo "[^] zsh already installed"
fi

echo "[/] Downloading files for LunarShell.."
sudo curl --silent https://shell.lunarlabs.cc/asset/starship.toml > /etc/starship.toml
sudo curl --silent https://shell.lunarlabs.cc/asset/sshmotd.sh > /etc/profile.d/sshmotd.sh
sudo curl --silent https://raw.githubusercontent.com/ohemilyy/SysScripts/master/LunarShell/asset/bashrc_el8 > /etc/bash.bashrc
sudo curl --silent https://raw.githubusercontent.com/ohemilyy/SysScripts/main/LunarShell/asset/zshrc > /etc/zsh/zshrc
sudo curl --silent https://shell.lunarlabs.cc/asset/banner > /etc/banner
echo "[+] Luna files downloaded and installed"
echo "[/] Applying Starship-specific configurations.."
echo "export STARSHIP_CONFIG=/etc/starship.toml" | sudo tee /etc/profile.d/pinkcloud-var.sh > /dev/null
echo 'eval "$(/usr/local/starship init bash)"' | sudo tee -a /etc/bash.bashrc > /dev/null
echo 'eval "$(/usr/local/starship init zsh)"' | sudo tee -a /etc/zsh/zshrc > /dev/null
echo "[+] Starship configurations applied"
echo "[/] Applying LunarShell-specific configurations.."
sudo chmod +x /etc/profile.d/sshmotd.sh
sudo chmod +x /etc/profile.d/pinkcloud-var.sh
sudo chmod +x /etc/banner
sudo chmod +x /etc/bash.bashrc
sudo chmod +x /etc/zsh/zshrc
sudo chmod +x /etc/starship.toml
sudo chmod +x /usr/local/bin/starship
echo "[✓] LunarShell under bash and zsh was successfully installed! Please reopen your shell to access the new interface."
chsh -s /usr/bin/zsh
echo "[✓] Your shell has been changed to zsh and this change will take effect after a logout."
echo "    You may still access your old shell for now until you log out, but a new session will replace it with zsh."
echo -e "    If you don't like this, you can always switch back with the following command:\n"
echo -e "      chsh -s $SHELL\n"
