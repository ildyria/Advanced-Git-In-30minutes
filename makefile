LATEXMK = ./latexrun.py
LATEX = pdflatex
READ = evince
SOURCES := $(wildcard *.tex)
SVGS := $(wildcard img/**/*.svg)
TIKZ := $(wildcard tikz/*.tex)
PDFS := $(notdir $(SOURCES:.tex=.pdf))
PNGS := $(SVGS:.svg=.png)


NO_COLOR="\033[0m"
RED = "\033[38;5;009m"
GREEN = "\033[38;5;010m"
YELLOW = "\033[38;5;011m"
ORANGE = "\033[38;5;214m"
LIGHTPURPLE = "\033[38;5;177m"
PURPLE = "\033[38;5;135m"
CYAN = "\033[38;5;014m"
LIGHTGRAY = "\033[38;5;252m"
DARKGRAY = "\033[38;5;242m"
BRIGHTRED = "\033[91m"
BOLD = "\033[1m"

all: $(PDFS)

%.pdf: %.tex $(PNGS)
	@echo $(YELLOW)"Building "$@$(DARKGRAY)
	$(LATEXMK) $<
	@echo $(GREEN)"Done."$(DARKGRAY)

open:
	${READ} $(PDFS)


%.png: %.svg
	@echo $(ORANGE)"Generating "$@$(DARKGRAY)
	@inkscape -z -e $@ $< 2> /dev/null


clean:
	@echo $(RED)"Cleaning..."$(DARKGRAY)
	@rm latex.out 2> /dev/null || true
	@rm $(PNGS) 2> /dev/null || true
	@rm $(PDFS) 2> /dev/null || true

png: $(PDFS) $(PNGS)
