#!/bin/bash

# Set paths
downloads_dir=~/Downloads
ides_dir=~/Templates/IDE

# Ensure the Templates directory exists
mkdir -p "$ides_dir"

# Function to extract and set up a desktop shortcut
extract_and_setup() {
    archive=$1
    archive_name=$(basename "$archive")
    extract_dir="$ides_dir/${archive_name%.*.*}"
    
    # Extract the archive
    echo "Extracting $archive..."
    tar -xzf "$archive" -C "$ides_dir/"
    
    # Create a desktop shortcut
    echo -e "[Desktop Entry]\nName=${archive_name%.*.*}\nComment=Extracted Template\nExec=$extract_dir\nType=Application" > /usr/share/applications/"${archive_name%.*.*}.desktop"
    
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
for file in "$downloads_dir"/*; do
    if [ -f "$file" ]; then
        case "$file" in
            *.tar.gz) extract_and_setup "$file" ;;
            *.rpm) install_rpm "$file" ;;
            *.deb) install_deb "$file" ;;
            *) echo "Unsupported file: $file" ;;
        esac
        rm $file
    fi
done

# Display a list of installed archives or software
echo "Installed Archives or Software:"
ls -1 "$ides_dir" /usr/share/applications/*.desktop

