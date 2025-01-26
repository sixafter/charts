#!/bin/bash
# Copyright (c) 2024 Six After, Inc.
#
# This source code is licensed under the Apache 2.0 License found in the
# LICENSE file in the root directory of this source tree.

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${__dir}"/os-type.sh

# Windows
if is_windows; then
    echo "[ERROR] Windows is not currently supported." >&2
    exit 1
fi

# Determine if Brew is installed
if ! [ -x "$(command -v brew)" ]; then
    echo "Please install Homebrew from https://brew.sh before running this script."
    exit 1
fi

# Chart Testing: https://github.com/helm/chart-testing
brew update
brew install chart-testing kube-score helm
brew upgrade
