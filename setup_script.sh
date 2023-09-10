#!/bin/bash

# Update repositories and install updates
sudo apt-get update
sudo apt-get upgrade -y

# Install required packages
sudo apt install curl zsh git -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to Zsh
echo "exec zsh" >> ~/.bashrc

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo add-apt-repository ppa:alessandro-strada/ppa  
sudo apt update && sudo apt install google-drive-ocamlfuse
google-drive-ocamlfuse
mkdir -v ~/myGoogleDrive
google-drive-ocamlfuse ~/myGoogleDrive


# Install dependencies for asusctl
cd Templates
sudo apt-get update && sudo apt-get install -y libgtk-3-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libglib2.0-dev cmake libclang-dev libudev-dev libayatana-appindicator3-1 git
git clone https://gitlab.com/asus-linux/asusctl.git
cd asusctl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
make
sudo make install
systemctl start asusd


# Install Howdy
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install howdy -y

# Modify asusd/anime.ron settings
cat <<EOF | sudo tee /etc/asusd/anime.ron
(
    model_override: None,
    system: [],
    boot: [
        ImageAnimation(
            file: "/usr/share/asusd/anime/custom/terminal-donut.gif",
            scale: 1.1,
            angle: 0.0,
            translation: (1.5, 1.5),
            time: Infinite,
            brightness: 1.0,
        ),
    ],
    wake: [
        ImageAnimation(
            file: "/usr/share/asusd/anime/custom/terminal-donut.gif",
            scale: 1.1,
            angle: 0.0,
            translation: (1.5, 1.5),
            time: Infinite,
            brightness: 1.0,
        ),
    ],
    sleep: [],
    shutdown: [],
    brightness: 1.0,
    display_enabled: false,
    display_brightness: Med,
    builtin_anims_enabled: false,
    builtin_anims: (
        boot: GlitchConstruction,
        awake: BinaryBannerScroll,
        sleep: BannerSwipe,
        shutdown: GlitchOut,
    ),
)
EOF

# Download the donut.gif file and move it
wget http://donut.gif -O /usr/share/asusd/anime/custom/terminal-donut.gif

# Install Docker
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo \"\$VERSION_CODENAME\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add the user to the docker group
sudo usermod -aG docker \${USER}
su - \${USER}

# Remove obsolete packages
sudo apt autoremove -y

# Install Powertop and calibrate
sudo apt install powertop -y
sudo powertop --calibrate

