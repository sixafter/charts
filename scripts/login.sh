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

# Ensure GITHUB_USER set:
if [ -z "$GITHUB_USER" ]; then
    echo "Please set GITHUB_USER environment variable."
    exit 1
fi

echo "Logging in to Helm OCI registry..."
gh auth token | helm registry login ghcr.io -u $GITHUB_USER --password-stdin
