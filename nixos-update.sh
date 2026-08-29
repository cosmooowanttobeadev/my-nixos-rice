#!/bin/bash

echo "starting update"
cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos
