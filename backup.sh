#!/bin/bash
pacman -Qe > pacman.txt
flatpak list --columns=application --app > flatpak.txt
