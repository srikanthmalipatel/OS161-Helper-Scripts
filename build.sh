#!/bin/bash
cd ~/src/os161/kern/compile/ASST2
sudo bmake depend
sudo bmake
sudo bmake install
