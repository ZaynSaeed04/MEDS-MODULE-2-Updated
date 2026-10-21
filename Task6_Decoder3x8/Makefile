
# Run from any directory using:
#   make MOD=any_module_name
#
# Required directory structure:
#   project/
#   ├── Makefile
#   ├── rtl/
#   │   └── <MOD>.sv
#   └── tb/
#       └── tb_<MOD>.sv
#
# Requirements: Verilator, GTKWave (for view), GNU Make
# The testbench top module must be named tb_<MOD>.

MOD ?= decoder_3x8

MKFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
ROOT_DIR   := $(patsubst %/,%,$(MKFILE_DIR))

RTL_DIR    := $(ROOT_DIR)/rtl
TB_DIR     := $(ROOT_DIR)/tb
OBJ_DIR    := $(ROOT_DIR)/obj_dir

TOP_MODULE := tb_$(MOD)
RTL_FILE   := $(RTL_DIR)/$(MOD).sv
TB_FILE    := $(TB_DIR)/$(TOP_MODULE).sv
SOURCES    := $(RTL_FILE) $(TB_FILE)
VCD_FILE   := $(ROOT_DIR)/$(TOP_MODULE).vcd

VERILATOR  := verilator
VFLAGS     := --binary -j 0 --trace -Wall --timing -Wno-fatal
OBJ_EXE    := $(OBJ_DIR)/V$(TOP_MODULE)

.PHONY: all run compile view clean check-mod _require-mod

all: _require-mod clean run

_require-mod:
	@if [ -z "$(MOD)" ]; then \
	    echo "ERROR: Please specify MOD."; \
	    echo "Usage: make MOD=<module_name>"; \
	    exit 1; \
	fi

check-mod: _require-mod
	@if [ ! -f "$(RTL_FILE)" ]; then \
	    echo "ERROR: RTL file not found: $(RTL_FILE)"; exit 1; \
	fi
	@if [ ! -f "$(TB_FILE)" ]; then \
	    echo "ERROR: Testbench file not found: $(TB_FILE)"; exit 1; \
	fi
	@echo "RTL : $(RTL_FILE)"
	@echo "TB  : $(TB_FILE)"
	@echo "TOP : $(TOP_MODULE)"

compile: check-mod
	@echo "Compiling $(TOP_MODULE)..."
	cd "$(ROOT_DIR)" && $(VERILATOR) $(VFLAGS) \
	    --top-module $(TOP_MODULE) \
	    --Mdir $(OBJ_DIR) \
	    $(SOURCES)

run: compile
	@echo "Running simulation..."
	cd "$(ROOT_DIR)" && $(OBJ_EXE)

view: _require-mod
	@if [ ! -f "$(VCD_FILE)" ]; then \
	    echo "ERROR: $(VCD_FILE) not found. Run 'make MOD=$(MOD) run' first."; \
	    exit 1; \
	fi
	gtkwave "$(VCD_FILE)" &

clean:
	@echo "Cleaning build files and VCDs..."
	rm -rf "$(OBJ_DIR)" "$(ROOT_DIR)"/*.vcd
