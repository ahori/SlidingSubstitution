TARGET = hori
SRC    = $(TARGET).tex
TEX    = platex
PDFTEX = pdflatex
ANS    = answer

all : $(TARGET).pdf $(ANS).pdf

$(ANS).pdf : $(ANS).tex
	$(PDFTEX) $(ANS).tex

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
