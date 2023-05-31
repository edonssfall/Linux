#!/bin/bash

sudo rsync -av grub/grub /etc/default/grub

sudo update-grub
