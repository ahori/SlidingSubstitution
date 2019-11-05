TARGET = hori
SRC    = $(TARGET).tex
TEX    = platex
PDFTEX = pdflatex

all : $(TARGET).pdf

$(TARGET).pdf : $(TARGET).dvi
	dvipdfm -p a4 $(TARGET).dvi
#	dvipdfm -p a4 -l -d 5 $(TARGET).dvi

$(TARGET).dvi : $(SRC) Makefile
	$(TEX) $(TARGET)
	bibtex $(TARGET)
	$(TEX) $(TARGET)
	$(TEX) $(TARGET)

clean:
	rm -f *.bbl *.blg *.aux *.log *~ *.dvi Figs/*.bb
