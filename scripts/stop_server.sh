#!/bin/bash

# Check if the apache2 service is available (enabled or running)
if systemctl list-units --full -all | grep -q "apache2.service"; then
    # Stop the apache2 service
    echo "Stopping apache2 service..."
    sudo systemctl stop apache2
    
    # Verify if the service was stopped
    if systemctl is-active --quiet apache2; then
        echo "Failed to stop apache2 service."
    else
        echo "apache2 service stopped successfully."
    fi
else
    echo "Service apache2 is not available."
fi
