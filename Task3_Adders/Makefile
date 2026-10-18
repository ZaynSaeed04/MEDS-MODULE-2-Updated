# =====================================================================
# CONFIGURATION: Only change this one line!
# =====================================================================
# Usage:
#   make MOD=full_adder_structural
#   make MOD=half_adder_dual
#   make MOD=half_adder_dual run
#   make MOD=half_adder_dual view
#   make clean
#
# The Makefile will automatically:
#   - RTL file  : <this_dir>/rtl/<MOD>.sv
#   - TB file   : <this_dir>/tb/tb_<MOD>.sv
#   - Top module: tb_<MOD>
# =====================================================================

# ----- Change only this if you want a different RTL filename -----
MOD ?= half_adder_dual

# ----- Absolute paths so this works from anywhere -----
MKFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
ROOT_DIR   := $(patsubst %/,%,$(MKFILE_DIR))

RTL_DIR    := $(ROOT_DIR)/rtl
TB_DIR     := $(ROOT_DIR)/tb
OBJ_DIR    := $(ROOT_DIR)/obj_dir

# ----- Derived names (auto) -----
TOP_MODULE := tb_$(MOD)
RTL_FILE   := $(RTL_DIR)/$(MOD).sv
TB_FILE    := $(TB_DIR)/$(TOP_MODULE).sv
SOURCES    := $(RTL_FILE) $(TB_FILE)
VCD_FILE   := $(ROOT_DIR)/$(TOP_MODULE).vcd

# ----- Tools / flags -----
VERILATOR  := verilator
VFLAGS     := --binary -j 0 --trace -Wall --timing -Wno-fatal
OBJ_EXE    := $(OBJ_DIR)/V$(TOP_MODULE)

# =====================================================================
# TARGETS
# =====================================================================

.PHONY: all run compile view clean check-mod _require-mod

all: _require-mod clean run

# ---- Guard: MOD must be given ----
_require-mod:
	@if [ -z "$(MOD)" ]; then \
	    echo ""; \
	    echo "ERROR: Please specify the module name."; \
	    echo "Usage: make MOD=<module_name>        (compiles + runs)"; \
	    echo "       make MOD=<module_name> run"; \
	    echo "       make MOD=<module_name> view"; \
	    echo "       make clean"; \
	    echo ""; \
	    exit 1; \
	fi

# ---- Sanity check that both files exist ----
check-mod: _require-mod
	@if [ ! -f "$(RTL_FILE)" ]; then \
	    echo "ERROR: RTL file not found: $(RTL_FILE)"; exit 1; \
	fi
	@if [ ! -f "$(TB_FILE)" ]; then \
	    echo "ERROR: TB file not found: $(TB_FILE)"; exit 1; \
	fi
	@echo "===> RTL : $(RTL_FILE)"
	@echo "===> TB  : $(TB_FILE)"
	@echo "===> TOP : $(TOP_MODULE)"

# ---- Compile ----
compile: check-mod
	@echo "===> Compiling $(TOP_MODULE) with Verilator..."
	cd "$(ROOT_DIR)" && $(VERILATOR) $(VFLAGS) \
	    --top-module $(TOP_MODULE) \
	    --Mdir $(OBJ_DIR) \
	    $(SOURCES)

# ---- Run ----
run: compile
	@echo "===> Running simulation executable..."
	cd "$(ROOT_DIR)" && $(OBJ_EXE)

# ---- View waveforms ----
view: _require-mod
	@echo "===> Launching GTKWave for $(VCD_FILE)..."
	@if [ ! -f "$(VCD_FILE)" ]; then \
	    echo "WARNING: $(VCD_FILE) not found. Run 'make MOD=$(MOD) run' first."; \
	fi
	cd "$(ROOT_DIR)" && gtkwave "$(VCD_FILE)" &

# ---- Clean ----
clean:
	@echo "===> Cleaning build directory and VCDs..."
	rm -rf "$(OBJ_DIR)" "$(ROOT_DIR)"/*.vcd