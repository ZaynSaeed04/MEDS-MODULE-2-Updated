#!/bin/bash
set -e

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
TOP_MODULE="${1:?Usage: ./synth.sh <top_module>}"

RTL_FILE="$(find "$PROJECT_ROOT/rtl" -type f -name '*.sv' -exec grep -lE "^[[:space:]]*module[[:space:]]+$TOP_MODULE([[:space:]#(;]|$)" {} + | head -n 1)"

if [ -z "$RTL_FILE" ]; then
    echo "ERROR: RTL module '$TOP_MODULE' not found."
    exit 1
fi

echo "===> Starting Yosys for $TOP_MODULE..."

yosys -p "
  read_verilog -sv $RTL_FILE;
  hierarchy -top $TOP_MODULE;
  proc;
  techmap;
  show -format svg -prefix $PROJECT_ROOT/${TOP_MODULE}_schematic;
"

echo "===> Done! Schematic: $PROJECT_ROOT/${TOP_MODULE}_schematic.svg"
