DESIGN   := and4
SRC      := $(wildcard src/*.v)
TB       := tb/$(DESIGN)_tb.v
OUT      := sim/build/$(DESIGN)_sim
VCD      := sim/waveforms/$(DESIGN).vcd

run: $(OUT)
	@mkdir -p sim/waveforms
	vvp $(OUT)

$(OUT): $(SRC) $(TB)
	@mkdir -p sim/build
	iverilog -o $(OUT) $(SRC) $(TB)

clean:
	rm -rf sim/build sim/waveforms
