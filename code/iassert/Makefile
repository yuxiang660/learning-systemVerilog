TARGET=iassert.sv
SCRIPT=compile.do

all : $(TARGET) $(SCRIPT)
	vsim -do $(SCRIPT)

.PHONY: clean

clean:
	rm -f transcript
	rm -rf work