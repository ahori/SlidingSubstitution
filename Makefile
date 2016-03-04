TARGET = hori
SRC    = $(TARGET).tex
TEX    = platex
KANJI  =

all : $(TARGET).pdf

$(TARGET).pdf : $(TARGET).dvi
	dvipdfm -p a4 $(TARGET).dvi
#	dvipdfm -p a4 -l -d 5 $(TARGET).dvi

$(TARGET).dvi : $(SRC)
	$(TEX) $(KANJI) $(TARGET)
	bibtex $(KANJI) $(TARGET)
	$(TEX) $(KANJI) $(TARGET)
	$(TEX) $(KANJI) $(TARGET)


clean:
	rm -f *.bbl *.blg *.aux *.log *~ *.dvi Figs/*.bb
