# Preliminary Makefile for WACCC

SRC	   := src
OUT	   := out
SCRIPTS    := scripts

REFCOMPILE := refCompile
PYTHON     := python3
RM	   := rm -rf

all: WACC

WACC:
	$(RM) out
	mkdir out
	$(REFCOMPILE) $(SRC)/main.wacc -a > $(OUT)/WACCC.S
	$(PYTHON) $(SCRIPTS)/strip.py $(OUT)/WACCC.S
	rm $(OUT)/WACCC.S
	mv $(OUT)/WACCC.S.tmp $(OUT)/WACCC.S
	arm-linux-gnueabi-gcc -o scripts/WACCC -mcpu=arm1176jzf-s -mtune=arm1176jzf-s $(OUT)/WACCC.S

clean:
	$(RM) out
	rm $(SCRIPTS)/WACCC
.PHONY: all clean
