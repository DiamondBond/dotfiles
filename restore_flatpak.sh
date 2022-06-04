#!/bin/bash

for x in $(cat flatpak.txt); do flatpak install $x; done
