#!/usr/bin/env bash

# Function to execute wlogout with a delay
execute_wlogout() {
  wlogout --protocol layer-shell & disown
}

# Execute wlogout after a delay
execute_wlogout
