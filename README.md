# Dots
[Tyler's](https://github.com/Tyler-Barham) personal dotfiles.

![image](https://github.com/user-attachments/assets/d951ac9c-7c3f-42f4-aeac-0347d07b6b25)


## About
This repo contains config files for my dev tools, such as terminal emulator, terminal multiplexer, shell environment, editor, and useful scripts.  
Each of these configs are self-contained so that they can be easily copied around; however, this repo utilizes nix's [Home Manager](https://github.com/nix-community/home-manager) for dotfile management.

## Quickstart
1. Clone this repo
   ```bash
   git clone git@github.com:Tyler-Barham/dots.git
   ln -sfn ./dots $HOME/.config/home-manager
   ```
   Optionally: `git submodule update --init --recursive`
3. Install Nix on your linux distro
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --no-daemon
   ```
4. Install Home Manager
   ```bash
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   nix-shell '<home-manager>' -A install
   ```
5. Start Home Manager to setup configs
   ```bash
   home-manager switch
   ```

## What next?
Install wezterm if you want to use the config in this repo, otherwise start any terminal emulator of your choice and run `tmux` to start the terminal multiplexer (with persistence) and get an interactive zsh shell.

## Leader keys
* tmux: `<alt>+w`
* nvim: `<space>`
* wezterm: `UNUSED`
