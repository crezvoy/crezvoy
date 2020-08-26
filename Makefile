
all: cv-en.pdf cv-fr.pdf #cv-en.pdf cv-bioinfo-fr.pdf cv-bioinfo-en.pdf

cv-en.pdf: cv.tex mine.bib
	xelatex -jobname $(basename $@) "\def\doen{}\input{$<}"
	bibtex $(basename $@)1.aux
	xelatex -jobname $(basename $@) "\def\doen{}\input{$<}"

cv-fr.pdf: cv.tex mine.bib
	xelatex -jobname $(basename $@) "\input{$<}"
	bibtex $(basename $@)1.aux
	xelatex -jobname $(basename $@) "\input{$<}"

.PHONY: clean
clean:
	@-rm *.out *.aux *.blg *.log *.bbl

.PHONY: distclean
distclean: clean
	@-rm *.pdf
