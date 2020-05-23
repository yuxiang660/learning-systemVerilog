# Change the basename to verilog filename
BASENAME=hello

TARGET=$(BASENAME).sv
SCRIPT=$(BASENAME).do

all : $(TARGET) $(SCRIPT)
	vsim -do $(SCRIPT)

.PHONY: clean

clean:
	rm transcript
	rm -r work