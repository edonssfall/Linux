# Razer Blade 15 (2020-Ubuntu)

- [Progs Installation](#installation)
  - [Bash File](#bash-file)
  - [Google](#google)
  - [VLC](#vlc)
  - [Telegram](#telegram)
  - [Synaptic Package Manager](#synaptic-package-manager)
  - [Oh My ZSH](#ohmyzsh)
- [Fixes](#fixes)
	- [Suspend Fix](#suspend-fix)
- [Progs for Coding](#progs-for-coding)
  - [PostgreSQL](#postgresql)
  - [Docker](#docker)
  - [Valentino Studio](#valentino-studio)
- [Adds](#adds)
  - [Multitouch](#multitouch)


# Progs Installation
## Bash File
```markdown
sh progs-installation.sh
```
### Google
1. Add the Google repository to your system's software sources.
```markdown
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```
2. Add the repository to the sources list
```markdown
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
```
3. Update the package lists by running.
```markdown
sudo apt update
```
4. Install Google Chrome.
```markdown
sudo apt install google-chrome-stable
```
### VLC
1. Update the package lists.
```markdown
sudo apt update
```
2. Install VLC.
```markdown
sudo apt install vlc
```
### Telegram
1. Update the package lists.
```markdown
sudo apt update
```
2. Install Telegram-Desktop
```markdown
sudo apt install telegram-desktop
```
### Synaptic Package Manager
1.Update the package lists.
```markdown
sudo apt update
```
2. Install Synaptic Package Manager
```markdown
sudo apt install synaptic
```
