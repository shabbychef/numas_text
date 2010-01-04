
Open Source Numerical Course Notes
Copyright 2004-2010, Steven E. Pav,
Benevolent Dictator for Life
 shabbychef@gmail.com
 spav@math.ucsd.edu

This document is Copyright 2004-2010 Steven E. Pav.  Permission is granted to
copy, distribute and/or modify this document under the terms of the GNU Free
Documentation License, Version 1.2 or any later version published by the Free
Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no
Back-Cover Texts.  A copy of the license is included in the file, LICENSE.txt.

These notes started as course notes for UCSD Math 174, in the fall of 2003.
Math 174 is a 10 week course in `numerical methods' for upper level
undergraduate students in engineering and the sciences.  This course is a
condensed whirlwind tour of numerical methods; unlike the (20-30 week) course 
in `numerical analysis' offered at the same university, the intended emphasis
is on methods and applications, rather than theory and proof.

COAUTHORS:

I encourage prospective coauthors to expand, improve, amend and alter these
notes, under the terms of the FDL license. 

BUILDING:

The build process relies on the `empheq' style file, available from the mh
LaTeX bundle (http://www.ctan.org/tex-archive/macros/latex/contrib/mh); this
is package dev-tex/mh on Gentoo (not available as a package in Ubuntu?)

I rely heavily on makefiles to make my latex documents. In the main directory,
the command 
$ make
should make the file numas.dvi. Other relevant commands include:
$ make numas.ps
$ make numas.pdf


