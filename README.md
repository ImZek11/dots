

## RECOMMENDED TO BE DONE ON A:
  Minimal Arch Installation
## how to install:
  **step 1:**
  
  **install git and yay**
  ```
  sudo pacman -Syu --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  ```
  **step 2:**

  **clone the repo**
  ```
  git clone https://ImZek11/dots11.git
  cd dots11
  ```
  **step 3:**

  **run the installer**
  ```
  chmod +x scripts/*
  cd scripts/install
  ./install.sh
  ```
 **step 4:**

 **Now you can safely reboot, as the installation prompts you when all the steps are completed by your choice!**
