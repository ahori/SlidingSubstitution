TARGET = hori
SRC    = $(TARGET).tex
TEX    = platex
PDFLATEX = pdflatex
ANSWER = answer

all : $(TARGET).pdf $(ANSWER).pdf

$(TARGET).pdf : $(TARGET).dvi
	dvipdfm -p a4 $(TARGET).dvi
#	dvipdfm -p a4 -l -d 5 $(TARGET).dvi

$(ANSWER).pdf : $(ANSWER).tex
	$(PDFLATEX) $(ANSWER)

$(TARGET).dvi : $(SRC)
	$(TEX) $(KANJI) $(TARGET)
	bibtex $(KANJI) $(TARGET)
	$(TEX) $(KANJI) $(TARGET)
	$(TEX) $(KANJI) $(TARGET)


clean:
	rm -f *.bbl *.blg *.aux *.log *~ *.dvi Figs/*.bb
