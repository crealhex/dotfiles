#!/bin/bash

pacman -S base-devel \
  mingw-w64-ucrt-x86_64-toolchain \
  mingw-w64-clang-x86_64-toolchain \
  --needed --noconfirm
