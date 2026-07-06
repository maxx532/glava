#!/usr/bin/env bash
set -e

echo "Installing dependencies..."

sudo apt update

sudo apt install -y \
    meson \
    ninja-build \
    gcc \
    g++ \
    libpulse-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libgl1-mesa-dev \
    libglfw3-dev \
    libobs-dev \
    libglew-dev

echo "Building..."

rm -rf build

meson setup build

ninja -C build

echo "Installing..."

sudo ninja -C build install

sudo ldconfig

echo
echo "Done."
echo
echo "Run:"
echo "glava --desktop --force-mod=bars"
