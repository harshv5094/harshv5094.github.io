#!/usr/bin/env bash

# Checking Dependencies #
dependency_list=("bash" "curl")
for package in "${dependency_list[@]}"; do
  if ! command -v "$package" &>/dev/null; then
    printf "%b\n" "$package is not installed, please install it first"
    exit 1
  else
    printf "%b\n" "$package is installed"
  fi
done

# Downloading my bashrc file #
my_bashrc="$HOME/.bashrc"
if [[ -e $my_bashrc ]]; then
  printf "%b" "** Backing up $my_bashrc **"
  mv "$my_bashrc" "$my_bashrc.bak"
  printf "%b\n" "** Downloading my bashrc config in $my_bashrc **"
  if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.bashrc -o "$my_bashrc"; then
    printf "%b\n" "** Successfully downloaded my .bashrc in $my_bashrc **"
  else
    printf "%b\n" "** Failed to download .bashrc in $my_bashrc **"
  fi
else
  printf "%b\n" "** Downloading my bashrc config in $my_bashrc **"
  if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.bashrc -o "$my_bashrc"; then
    printf "%b\n" "** Successfully downloaded my .bashrc in $my_bashrc **"
  else
    printf "%b\n" "** Failed to download .bashrc in $my_bashrc **"
  fi
fi

# Downloading my inputrc file #
my_inputrc="$HOME/.inputrc"
if [[ -e $my_inputrc ]]; then
  printf "%b" "** Backing up $my_inputrc **"
  mv "$my_inputrc" "$my_inputrc.bak"
  printf "%b\n" "** Downloading my inputrc config in $my_inputrc **"
  if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.inputrc -o "$my_inputrc"; then
    printf "%b\n" "** Successfully downloaded my .inputrc in $my_inputrc **"
  else
    printf "%b\n" "** Failed to download .inputrc in $my_inputrc **"
  fi
else
  printf "%b\n" "** Downloading my inputrc config in $my_inputrc **"
  if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.inputrc -o "$my_inputrc"; then
    printf "%b\n" "** Successfully downloaded my .inputrc in $my_inputrc **"
  else
    printf "%b\n" "** Failed to download .inputrc in $my_inputrc **"
  fi
fi

# Downloading my starship prompt file (This one is optional) #
starship_config() {
  read -p "Do you want my starship config (Y/N):" choice

  case "$choice" in
  y | Y)

    if [[ ! -d $HOME/.config ]]; then
      printf "%b\n" "** Creating $HOME/.config **"
      if mkdir -p "$HOME/.config/"; then
        printf "%b\n" "** Successfully created $HOME/.config **"
      fi
    fi

    my_starship="$HOME/.config/starship.toml"
    if [[ -e "$my_starship" ]]; then
      printf "%b\n" "** Backing up $my_starship **"
      mv "$my_starship" "$my_starship.bak"
      printf "%b\n" "** Downloading my starship config $my_starship **"
      if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.config/starship.toml -o "$my_starship"; then
        printf "%b\n" "** Starship file is downloaded. You need to install starship manually **"
      else
        printf "%b\n" "** Failed to download starship file **"
      fi
    else
      printf "%b\n" "** Downloading my starship config $my_starship **"
      if curl https://raw.githubusercontent.com/harshv5094/dotfiles/refs/heads/main/.config/starship.toml -o "$my_starship"; then
        printf "%b\n" "** Starship file is downloaded. You need to install starship manually **"
      else
        printf "%b\n" "** Failed to download starship file **"
      fi
    fi
    return
    ;;
  n | N)
    printf "%b\n" "Skipping $HOME/.config/starship.toml ... "
    return
    ;;
  *)
    printf "%b\n" "Please answer in (Y/N): "
    starship_config
    ;;
  esac
}

starship_config
printf "%b\n" "Bash setup is finished"
