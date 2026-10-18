#!/bin/bash
set -e

# Get the absolute path of the directory where this script lives
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"

# Configuration: Relative to the project root
TOP_MODULE="full_adder_structural"
RTL_FILE="$PROJECT_ROOT/rtl/full_adder_structural.sv"

echo "===> Running Yosys for module: $TOP_MODULE..."

# Run Yosys using absolute file paths so it doesn't matter where you run the script from
yosys -p "
  read_verilog -sv $RTL_FILE;
  hierarchy -top $TOP_MODULE;
  proc;
  techmap;
  show -format svg -prefix $PROJECT_ROOT/${TOP_MODULE}_schematic;
"

echo "===> Success! Schematic generated at: $PROJECT_ROOT/${TOP_MODULE}_schematic.svg"