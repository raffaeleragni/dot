#!/bin/bash

tmpssh() {
    sudo systemctl start ssh
    sudo ufw disable

    read -p "PAUSING..."

    sudo systemctl stop ssh
    sudo ufw enable
}
