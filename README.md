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
   ln -sfn $PWD/dots $HOME/.config/home-manager

   # Manage yazi externally to nix for now
   ln -sfn ~/.config/home-manager/home-manager/modules/file-manager/yazi ~/.config/yazi
   ```
   Optionally: `git submodule update --init --recursive`
2. Install Nix on your linux distro
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --no-daemon
   ```
3. Install Home Manager
   ```bash
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   nix-shell '<home-manager>' -A install
   ```
4. Add your user / home directory / system to `homeConfigurations` in [flake.nix](./flake.nix)
5. Start Home Manager to setup configs
   ```bash
   # First run
   sudo mkdir /etc/nix/
   echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
   home-manager switch --flake $(realpath ~/.config/home-manager)#$USER@$HOSTNAME

   # Subsequent runs
   home-up
   ```
6. Update the git config within [.gitconfig-Personal](./home-manager/modules/vcs/.gitconfig-Personal)

## What next?
Wezterm is currently not installed through nix-packages due GPUs being managed outside of nix. Install wezterm if you want to use the config in this repo.  
Otherwise start any terminal emulator of your choice and run `tmux` to start the terminal multiplexer (with persistence) and get an interactive zsh shell.

## Leader keys
* tmux: `<alt>+w`
* nvim: `<space>`
* wezterm: `UNUSED`
