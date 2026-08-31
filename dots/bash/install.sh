#!/usr/bin/env bash
set -euo pipefail

readonly LIB_DIR="${LIB_DIR:-lib}"

if [[ -s "${LIB_DIR}/common" ]]; then
  # shellcheck disable=SC1091
  . "${LIB_DIR}/common"
else
  echo "[ERROR] Missing: ${LIB_DIR}/common" >&2
  exit 1
fi
