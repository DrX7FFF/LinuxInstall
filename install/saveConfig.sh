#! /bin/bash

# Ubuntu 24.04
dconf dump / > saved_settings.dconf

# restore with
# dconf load -f / < saved_settings.dconf