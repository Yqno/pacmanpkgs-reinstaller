#!/bin/bash

# Paketliste erstellen
pacman -Qqen > pacman_packages.txt
pacman -Qqem > aur_packages.txt

# Alle Pakete und ihre Konfigurationen entfernen
sudo pacman -Rns $(cat pacman_packages.txt)
yay -Rns $(cat aur_packages.txt)

# Paketliste bereinigen
sudo pacman -Scc
yay -Scc

# System aktualisieren
sudo pacman -Syu

# Neue Installation der Pakete
sudo pacman -S $(cat pacman_packages.txt)
yay -S $(cat aur_packages.txt)
