# File: Makefile

# Directories
SRC_DIR := src
TB_DIR := tb
BUILD_DIR := sim/build
WAVE_DIR := sim/waveforms
DESIGN_FILE := build/design.v

# Compiler
IVERILOG := iverilog
VVP := vvp

# Default testbench (change as needed)
DEFAULT_TB := adder4_tb

# Automatically generate design.v before compiling
$(DESIGN_FILE):
	@echo "Generating design.v..."
	python gen_design.py

# Rule to run a specific testbench
run: $(DESIGN_FILE)
	@mkdir -p $(BUILD_DIR) $(WAVE_DIR)
	@echo "Compiling $(DEFAULT_TB)..."
	$(IVERILOG) -o $(BUILD_DIR)/$(DEFAULT_TB)_sim \
		$(TB_DIR)/$(DEFAULT_TB).v $(DESIGN_FILE)
	@echo "Running simulation..."
	$(VVP) $(BUILD_DIR)/$(DEFAULT_TB)_sim

# Run a specific testbench, e.g., make tb TB=half_adder_tb
tb: $(DESIGN_FILE)
	@mkdir -p $(BUILD_DIR) $(WAVE_DIR)
	$(IVERILOG) -o $(BUILD_DIR)/$(TB)_sim \
		$(TB_DIR)/$(TB).v $(DESIGN_FILE)
	$(VVP) $(BUILD_DIR)/$(TB)_sim

# Clean build
clean:
	rm -rf $(BUILD_DIR) $(WAVE_DIR) $(DESIGN_FILE)

