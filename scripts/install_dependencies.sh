#!/bin/bash
apt-get update

# Package to install (you can add more packages if needed)
PACKAGE="apache2"

# Function to check if a package is installed
is_package_installed() {
    dpkg -l | grep -qw "$1"
}

# Check if the package is installed
if is_package_installed "$PACKAGE"; then
    echo "$PACKAGE is already installed."
else
    echo "$PACKAGE is not installed. Installing now..."
    
    # Update package list and install the package
    sudo apt-get update
    sudo apt-get install -y "$PACKAGE"
    
    # Verify if the installation was successful
    if is_package_installed "$PACKAGE"; then
        echo "$PACKAGE was installed successfully."
    else
        echo "Failed to install $PACKAGE."
    fi
fi

