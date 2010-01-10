
############## PREAMBLE ##############FOLDUP
# makefile generated 
# numas makefile 
#
# Created: 2009.12.30
# Copyright: Steven E. Pav, 2009-2009
# Email: shabbychef@gmail.com
# $Id$
#UNFOLD

############### FLAGS ################FOLDUP

# these don't work at times
# in that case set these by hand?

LATEX       ?= $(shell which latex)
BIBTEX      ?= $(shell which bibtex)
MAKEINDEX   ?= $(shell which makeindex)

PERL    		?= $(shell which perl)
GHOSTVIEW   ?= $(shell which gv)
PDF_VIEWER  ?= $(shell which xpdf)

# helper stuff
PAGER   		?= $(shell which less)
ASPELL  		?= $(shell which aspell)
CTAGS   		?= $(shell which ctags)

TEXINPADD    = .:./styfiles
PRETEX       = TEXINPUTS=$(TEXINPADD):$$TEXINPUTS
PREBIB       = BSTINPUTS=$(TEXINPADD):$$BSTINPUTS \
               BIBINPUTS=$(TEXINPADD):$$BIBINPUTS 

PREIDX       = INDEXSTYLE=$(TEXINPADD):$$INDEXSTYLE

PROJECT      = numas
TEX_SOURCE   = $(PROJECT).tex
BIB_SOURCE   = $(PROJECT).bib
DVI_TARGET   = $(PROJECT).dvi
PS_TARGET    = $(PROJECT).ps 
PDF_TARGET   = $(PROJECT).pdf
BBLS         = $(PROJECT).bbl

#sub figures
QPS_FILES    := $(wildcard figs/*.qps)
EPS_FILES    := $(patsubst %.qps,%.eps,$(QPS_FILES)) 
SUB_FIGS     = $(EPS_FILES)

# tracked projects
PROJECTS     = $(PROJECT)
# add on dependencies (subchapters of numas)
TEX_EXTRAS   = interpolate.tex intro.tex matlab.tex sage.tex leastsquares/leastsquares.tex \
               linearsys.tex odes.tex quadrature.tex rootfind.tex splines.tex \
               derivatives.tex oldexams.tex fdl.tex fdm.tex fem.tex
# nonlocal dependencies
STY_FILES    = 

#### garbage so that you can automagically view the results; bell/whistle#FOLDUP
# X geometry
X_GEOM       = -geometry 1066x920+15+10
X_GEOM_WIDE  = -geometry 1230x920+15+10

# dvips
DVIPS_FLAGS  = -R -t letter
DVIEPS_FLAGS = -R -t letter -Pcmz -Pamz
DVIPDF_FLAGS = -R -t letter -Pcmz -Pamz

# xdvi
XDVI_FLAGS   = -safer -s 5 -expert -hush $(X_GEOM) -paper us -keep 

# ghostview landscape
GVIEW_FLAGS  = -safer -spartan -landscape -media letter -scalebase 2 -scale 2 \
-resize $(X_GEOM_WIDE)
# ghostview smaller landscape
GVIEW_FLAGS  = -safer -spartan -landscape -media letter -scalebase 2 -scale 1 \
-resize $(X_GEOM)
# ghostview portrait
GVIEW_FLAGS  = -safer -spartan -portrait -media letter -scalebase 2 -scale 2 \
-resize $(X_GEOM)

# pdfviewer
PDFSEE_FLAGS = -z width -q -bg black -fullscreen
PDFSEE_FLAGS = -z width -q

#kghostview 
KGV_FLAGS    = $(X_GEOM)
#UNFOLD

#aspell
ASPELL_FLAGS = 

#dot
DOT_FLAGS    = 
#UNFOLD

############## DEFAULT ###############FOLDUP

default : all
#UNFOLD

############## MARKERS ###############FOLDUP

.PHONY   : 
.SUFFIXES: .tex .bib .dvi .ps .pdf .eps
.PRECIOUS: %.dvi %.ps %.pdf %.jpg %.gif 
#UNFOLD

############ BUILD RULES #############FOLDUP

# compile and convert
%.dvi : %.tex $(STY_FILES)
		$(PRETEX) $(LATEX) $<
		if grep Citation $*.log > /dev/null; then $(PREBIB) $(BIBTEX) $*; $(PRETEX) $(LATEX) $*; fi
		if grep Rerun $*.log > /dev/null; then $(PRETEX) $(LATEX) $*; fi

%.dep.dot : %.tex %.dvi $(STY_FILES)
		echo digraph G \{ > $@;
		$(PRETEX) $(LATEX) $< | grep 'DEP:' | $(PERL) -pe 's/DEP://;s/\\hbox {}//g;' >> $@
		echo \} >> $@;

%.ps : %.dvi
		dvips $(DVIPS_FLAGS) -o $@ $< 

%.pdf : %.dvi
		dvips $(DVIPDF_FLAGS) -o $*.ps $< 
		ps2pdf $*.ps
		-rm -f $*.ps

# crappy ps from pdf.
%.craps : %.pdf
		a2ps -R --columns=1 -o $*.ps $<

# crappy ascii anyone?
%.txt : %.ps
		ps2ascii $< > $@

# tex extras
%.bbl : %.bib
		$(PREBIB) $(BIBTEX) $*

%.bbl : %.aux
		$(PREBIB) $(BIBTEX) $*

%.ind : %.idx
		$(PREIDX) $(MAKEINDEX) $*

# qt3 kseg ps files have unicode text.
# this is nogood for psfrag texthooks.
# change them here.

%.pps : %.qps
		@echo funky perl func to convert $< to hookable $@;
		@$(PERL) -n -e 'BEGIN { @FE=();$$HASF=0; } \
		if (m{^.*ENC-.*\[}) { \
			print;$$esc = 0;$$HASF ||= 1; \
			while (($$line = <>) && not $$esc) \
			{ print $$line;chomp($$line); \
				while ($$line =~ s{/([^\/\]]+)}{}) {push (@FE,$$1);} \
				$$esc = ($$line =~ m{\]\s*def\s*$$});} \
			%mymaps = qw( one 1 two 2 three 3 four 4 five 5 \
			  six 6 seven 7 eight 8 nine 9 zero 0 \
        period . equal = plus + );$$mymaps{space}=q[ ]; \
			while (($$k,$$v)=each(%mymaps)) { map {s/^$$k$$/$$v/;} @FE; } \
			print qq[/myT{gsave PCol SC ty MT 1 index dup length exch stringwidth pop 1 -1 roll -1 1 scale 180 rotate exch sub exch div exch 0 exch ashow grestore}D\n]; \
		} elsif ((m{(\d{1,3}\s+Y)?<([0-9A-F]+)>(-?\d+)\s+(-?\d+)\s+A?T\s*$$}) && $$HASF) \
		{ print qq[/Times-Roman findfont 18 scalefont setfont\n]; \
			$$cod = $$2;$$str = q[]; \
			while ($$cod) { $$ch = substr($$cod,0,4,q[]); \
										  $$str .= (hex($$ch))? $$FE[hex($$ch)]:q[ ]; } \
			print qq[$$1($$str)$$3 $$4 myT\n]; \
		} else { print $$_; }' < $< > $@;

# define a rule to find a bounding box

define findbb
@echo find real bounding box for $<;
@echo -n '   was: ';
@if grep Bounding $<; then\
$(PERL) -p -e 'BEGIN { $$spit = 0;\
$$bb = qx[gs -q -dNOPAUSE -dSAFER -dDELAYSAFER -dBATCH -sDEVICE=bbox -sOutputFile=/dev/null $< 2>&1 | awk "/\%\%Bounding/ {print}"];} \
$$spit ||= (/^%%Bounding/ and $$_ = qq[$$bb]);' $< > $@;\
else\
$(PERL) -p -e 'BEGIN { $$spit = 0;\
$$bb = qx[gs -q -dNOPAUSE -dSAFER -dDELAYSAFER -dBATCH -sDEVICE=bbox -sOutputFile=/dev/null $< 2>&1 | awk "/\%\%Bounding/ {print}"];} \
$$spit ||= ($$_ = qq[$$bb$$_]);' $< > $@;\
fi
@echo -n 'is now: ';
@head $@ | grep Bounding
endef

# make correct bounding box
%.eps : %.pps 
		$(findbb)

%.eps : %.ps 
		$(findbb)

# define a rule to convert color kseg figs to black and white
define convert_to_bw
@echo converting color $< to black and white $@;
@$(PERL) -p -e 'BEGIN { sub togrey { my $$avg = int(($$_[0] + $$_[1] + $$_[2])/3.0);\
return qq[$$avg $$avg $$avg]; } }\
s/^(\S+)\s(\S+)\s(\S+)(\sP1)$$/&togrey($$1,$$2,$$3) . $$4/e;\
s/^(\S+\s)(\S+)\s(\S+)\s(\S+)(\sBR)$$/$$1 . &togrey($$2,$$3,$$4) . $$5/e;\
s/^(\S+\s\S+\s)(\S+)\s(\S+)\s(\S+)(\s\S+\s\S+\sPE)$$/$$1 . &togrey($$2,$$3,$$4) . $$5/e;' $< > $@;
endef

# make a color fig generated by kseg into a black and white...
%.bw.ps : %.ps
		$(convert_to_bw)

%.bw.eps : %.eps
		$(convert_to_bw)

# image conversions
%.ps	: %.gif
		gif2ps $< > $@

%.pnm	: %.jpg
		jpegtopnm $< > $@

%.pnm	: %.jpeg
		jpegtopnm $< > $@

%.ps	: %.pnm
		pnmtops $< > $@

%.png : %.pnm
		pnmtopng $< > $@

# convert from xfig
%.eps : %.fig
		/bin/rm -f $@ 
		fig2dev -L ps $< > $@

# make a graph
%.ps : %.dot
		dot $(DOT_FLAGS) -Tps $< -o $@

# viewing targets
%.xsee : %.dvi
		xdvi $(XDVI_FLAGS) $*.dvi
		
%.psee : %.ps
		$(GHOSTVIEW) $(GVIEW_FLAGS) $*.ps

%.pdfsee : %.pdf
		$(PDF_VIEWER) $(PDFSEE_FLAGS) $*.pdf

# check a document
%.chk : %.dup %.spell

# check spelling
%.spell : %.tex
		$(ASPELL) $(ASPELL_FLAGS) --dont-tex-check-comments -t -l < $< | sort | uniq | $(PAGER)

# check duplicate words
%.dup : %.tex
		$(PERL) -an -F/\\s+/ -e 'BEGIN { $$last = q[]; $$line = 0; $$prevline = q[];}\
		$$line++;$$first = 1;\
		foreach $$word (@F) {\
		if ($$word eq $$last) {\
		if ($$first) { print qq[duplicate $$word, lines ],($$line-1),qq[-$$line:\n$$prevline$$_]; }\
		else { print qq[duplicate $$word, line $$line:\n$$_]; } }\
		$$last = $$word; $$first = 0; } \
		$$prevline = $$_;' < $< | $(PAGER)

tags : $(TEX_SOURCE) $(BIB_SOURCE) $(TEX_EXTRAS)
	-$(CTAGS) -f .tmp_tags --recurse --language-force=latex --fields=+i `find . -name '*.tex' | grep -ve '\.svn'`;
	-mv .tmp_tags tags;
#UNFOLD

############# CLEAN UP ###############FOLDUP

%.clean : 
		-rm -f $*.aux $*.log $*.dvi $*.bbl $*.blg $*.toc $*.ilg $*.ind
		-rm -f $*.out $*.idx $*.lot $*.lof $*.brf

%.realclean : %.clean
		-rm -f $*.ps $*.pdf
		-rm -f $*.dep.dot
#UNFOLD

############### RULES ################FOLDUP

# an easy target
all: $(SUB_FIGS) $(DVI_TARGET) $(BBLS) tags

dvis: $(patsubst %,%.dvi,$(PROJECTS))
pss: $(patsubst %,%.ps,$(PROJECTS))
pdfs: $(patsubst %,%.pdf,$(PROJECTS))

# targets
$(DVI_TARGET): $(TEX_SOURCE) $(TEX_EXTRAS) $(STY_FILES)
#$(PDF_TARGET): $(SUB_FIGS) $(PS_TARGET)

# see them 
presee: $(PROJECT).xsee
xsee: $(PROJECT).xsee
see: $(PROJECT).psee
pdfsee: $(PROJECT).pdfsee

# check it

spell: $(PROJECT).spell 

#kinda janky;
check_license : fdl.tex LICENSE.txt
	sha1sum .license.digest

# damn bibunits?
bibunits: bu1.bbl bu2.bbl bu3.bbl bu4.bbl

# clean up
clean: $(patsubst %,%.clean,$(PROJECTS))
realclean: $(patsubst %,%.realclean,$(PROJECTS))
#UNFOLD

#for vim modeline: (do not edit)
# vim:ts=2:sw=2:tw=79:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:tags=tags;:syntax=make:filetype=make:ai:si:cin:nu:fo=croqt:cino=p0t0c5(0:
