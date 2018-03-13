#!/bin/bash

# set -o errexit
# set -o xtrace

echo "Installing WeDeploy Command-line"
curl https://cdn.wedeploy.com/cli/latest/wedeploy.sh -sL | sudo bash
