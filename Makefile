TEX_DIR := tex
SRC_DIR := src
DATA_RAW := data/raw
DATA_PROC := data/processed
FIG_DIR := $(TEX_DIR)/figures

export TEXINPUTS := $(abspath $(TEX_DIR)/packages)//:$(abspath $(TEX_DIR)/style)//:

.PHONY: all clean setup

all: $(TEX_DIR)/main.pdf

# here just basic python scripts will run for idk data
# so for example
# $(DATA_PROC)/... : $(DATA_RAW)/... $(SRC_DIR)/...py
# 	mkdir -p $(DATA_PROC)
# 	uv run python ...

# likewise for plots
#
# 

FIGURES := #insert here plots lol




$(TEX_DIR)/main.pdf: $(TEX_DIR)/main.tex $(TEX_DIR)/references.bib $(TEX_DIR)/chapters/*.tex $(FIGURES)
	cd $(TEX_DIR) && latexmk -pdf -interaction=nonstopmode main.tex

setup:
	uv sync

clean:
	cd $(TEX_DIR) && latexmk -c

moreclean:
	cd $(TEX_DIR) && latexmk -C
	rm -rf $(FIG_DIR)/*.pdf
	rm -rf $(DATA_PROC)/*
