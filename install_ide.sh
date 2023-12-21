#!/bin/bash

# Determine the user's home directory
user_home=$(eval echo ~$SUDO_USER)

# Set paths
downloads_dir="$user_home/Downloads"
ides_dir="$user_home/Templates/IDE"

# Ensure the Templates directory exists
mkdir -p "$ides_dir"

# Function to extract and set up a desktop shortcut
extract_and_setup() {
    archive=$1
    archive_name=$(basename "$archive")
    
    # Extract the first word before hyphen
    name=$(echo "$archive_name" | awk -F'-' '{print $1}')
    
    # Extract the version (assuming it's the second part)
    version=$(echo "$archive_name" | grep -oP '\d+\.\d+\.\d+')
    
    extract_dir="$ides_dir/$name"

    # Remove existing directory and desktop entry
    if [ -d "$extract_dir" ]; then
        echo "Removing existing directory: $extract_dir"
        rm -r "$extract_dir"
    fi

    desktop_entry_file="/usr/share/applications/$name.desktop"
    if [ -f "$desktop_entry_file" ]; then
        echo "Removing existing desktop entry: $desktop_entry_file"
        sudo rm "$desktop_entry_file"
    fi

    # Extract the archive
    echo "Extracting $archive..."
    mkdir "$extract_dir"
    tar -xzf "$archive" -C "$extract_dir/" --strip-components=1

    # Create a desktop shortcut
    echo -e "[Desktop Entry]\nVersion=$version\nType=Application\n\nName=$name\nComment=IDE $name\n\nIcon=$extract_dir/bin/$name.png\nExec=$extract_dir/bin/$name.sh" | sudo tee "$desktop_entry_file" > /dev/null

    echo "$archive_name extracted and shortcut created."
}

# Function to install RPM files
install_rpm() {
    rpm_file=$1
    echo "Installing $rpm_file..."
    sudo dnf install -y "$rpm_file"
    echo "$rpm_file installed."
}

# Function to install DEB files
install_deb() {
    deb_file=$1
    echo "Installing $deb_file..."
    sudo dpkg -i "$deb_file"
    sudo apt install -f
    echo "$deb_file installed."
}

# Process files in the Downloads directory
find "$downloads_dir" \( -name "*.tar.gz" -o -name "*.rpm" -o -name "*.deb" \) -print0 | while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        case "$file" in
            *.tar.gz) extract_and_setup "$file" ;;
            *.rpm) install_rpm "$file" ;;
            *.deb) install_deb "$file" ;;
            *) echo "Unsupported file: $file" ;;
        esac
        rm "$file"
    fi
done
