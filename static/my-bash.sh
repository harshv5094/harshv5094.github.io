#!/usr/bin/env bash

# NOTE: Base Variable
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
dependency_list=("fzf" "eza")

# NOTE: dependency checker
for package in "${dependency_list[@]}"; do
  if ! command -v "$package" &>/dev/null; then
    echo -e "$package is not installed, please install it\n"
    exit 1
  fi
done

# NOTE: Banner
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
cat <<'EOF'
  __  __         ____            _     
 |  \/  |       |  _ \          | |    
 | \  / |_   _  | |_) | __ _ ___| |__  
 | |\/| | | | | |  _ < / _` / __| '_ \ 
 | |  | | |_| | | |_) | (_| \__ \ | | |
 |_|  |_|\__, | |____/ \__,_|___/_| |_|
          __/ |                        
         |___/                         
EOF

echo -e "** Welcome to my bash shell setup **\n"

echo -e "** Setting up my bashrc config **"
[[ -f $HOME/.bashrc ]] && mv "$HOME/.bashrc"{,.bak}
curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.bashrc --output "$HOME/.bashrc"

echo -e "** Setting up my inputrc config **"
[[ -f $HOME/inputrc ]] && mv "$HOME/inputrc"{,.bak}
curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/inputrc --output "$HOME/inputrc"

starship_config() {
  while true; do
    #shellcheck disable=SC2162
    read -p "Do you want my starship config(Y/N): " choice

    case $choice in
    y | Y)
      echo -e "** Setting up my starship.toml config **"
      [[ -f $XDG_CONFIG_HOME/starship.toml ]] && mv "$XDG_CONFIG_HOME/starship.toml"{,.bak}
      curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.config/starship.toml --output "$XDG_CONFIG_HOME/starship.toml"
      return
      ;;
    n | N)
      echo -e "** Skipping downloading starship.toml **"
      return
      ;;
    *)
      echo -e "** Please select Y or N **"
      ;;
    esac
  done
}

git_config() {
  while true; do
    #shellcheck disable=SC2162
    read -p "Do you want my starship config(Y/N): " choice

    case $choice in
    Y | y)
      echo -e "** Setting up my starship.toml config **"
      [[ -f $HOME/.gitconfig ]] && mv "$HOME/.gitconfig"{,.bak}
      curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.gitconfig --output "$HOME/.gitconfig"
      return
      ;;
    N | n)
      echo -e "** Skipping downloading starship.toml **"
      return
      ;;
    *)
      echo -e "** Please select Y or N **"
      ;;
    esac
  done
}

git_config
starship_config
