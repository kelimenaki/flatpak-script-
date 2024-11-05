#!/bin/bash

# Define the Downloads directory
DOWNLOADS_DIR="$HOME/Downloads"

# Check if Downloads directory exists
if [ ! -d "$DOWNLOADS_DIR" ]; then
    echo "Downloads directory not found. Exiting."
    exit 1
fi

# Function to install .flatpakref files
install_flatpakref() {
    FLATPAKREF_FILES=("$DOWNLOADS_DIR"/*.flatpakref)

    if [ -e "${FLATPAKREF_FILES[0]}" ]; then
        echo "Installing .flatpakref files..."
        for file in "$DOWNLOADS_DIR"/*.flatpakref; do
            echo "Installing $file"
            flatpak install --from "$file" -y
        done
    else
        echo "No .flatpakref files found in $DOWNLOADS_DIR."
    fi
}

# Check if flatpak is installed
if ! command -v flatpak > /dev/null; then
    echo "Flatpak is not installed. Installing Flatpak..."
    sudo apt install flatpak -y
fi

# Run the installation function
install_flatpakref

echo "Installation process completed."

