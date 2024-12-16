all: pdf

PDFS =	bedRModv1.8.pdf

pdf: $(PDFS:%=new/%)

%.pdf: new/%.pdf
	cp $^ $@

new/bedRModv1.8.pdf       diff/bedRModv1.8.pdf:       bedRModv1.8.tex       new/bedRModv1.8.ver

# Set LATEXMK to "scripts/rerun.sh new/$* $(PDFLATEX)" to use the previous
# controller script, e.g., if your installation does not have latexmk.
PDFLATEX = pdflatex
LATEXMK  = latexmk $(LATEXMK_ENGINE) $(LATEXMK_FLAGS)
LATEXMK_ENGINE = --pdf --pdflatex='$(PDFLATEX)'
LATEXMK_FLAGS  =

LATEXDIFF_ENGINE = --config LATEX=pdflatex

new/%.pdf: %.tex | new
	$(LATEXMK) --output-directory=new $<

new/bedRModv1.8.pdf: LATEXMK_ENGINE = --lualatex

new/%.ver: %.tex | new
	scripts/genversion.sh $^ > $@

new:
	mkdir new


diff diffs: $(PDFS:%=diff/%)

OLD = HEAD
NEW =

diff/%.pdf: %.tex
	BIBINPUTS=:.. TEXINPUTS=:..:../new latexdiff-vc $(LATEXDIFF_ENGINE) --pdf --dir diff --force --git --only-changes --graphics-markup=none --ignore-warnings --revision $(OLD) $(if $(NEW),--revision $(NEW)) $<

diff/bedRModv1.8.pdf: LATEXDIFF_ENGINE = --config LATEX=lualatex

show-styles:
	@sed -n '/\\usepackage/s/.*{\(.*\)}$$/\1/p' *.tex | sort | uniq -c

mostlyclean:
	-rm -f new/*.aux new/*.bbl new/*.blg new/*.fdb_latexmk new/*.fls new/*.log new/*.out new/*.toc new/*.ver
	-rm -f diff/**.aux diff/*.blg diff/*.idx diff/*.log diff/*.out diff/*.tex diff/*.toc

clean: mostlyclean
	-rm -f $(PDFS:%=new/%)$(if $(wildcard new),; rmdir new)
	-rm -f $(PDFS:%=diff/%)$(if $(wildcard diff),; rmdir diff)
	-rm -rf _site

.PHONY: all pdf diff diffs show-styles mostlyclean clean
