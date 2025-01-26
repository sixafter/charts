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

# Determine if ct is installed
if ! [ -x "$(command -v ct)" ]; then
    echo "Pleae run the 'deps' make target to install chart-testing."
    exit 1
fi

ct lint --config ct.yaml
