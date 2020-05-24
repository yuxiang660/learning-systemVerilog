TARGET=tb_top.sv
SCRIPT=compile.do

all : $(TARGET) $(SCRIPT)
	vsim -do $(SCRIPT)

.PHONY: clean

clean:
	rm -f transcript vsim.wlf
	rm -rf work