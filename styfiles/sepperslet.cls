%%
%% This is file `sepperslet.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sepperslet.dtx  (with options: `letter')
%% 
%% none.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{sepperslet}
              [2002/11/18 v0.0
   LaTeX document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\def\@checkoptions#1#2{%
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}%
  \@tempswafalse
  \@tfor\@this:=#2\do{%
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}%
    \ifin@ \@tempswatrue \@break@tfor \fi}%
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{letter}\fi
}
\@checkoptions{12pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{letter}
\ProcessOptions\relax
\LoadClass{letter}
\usepackage{graphicx}
\newcommand*{\Business}[1]{\def\busname{#1}}
\newcommand*{\fax}[1]{\def\faxnum{#1}}
\newcommand*{\email}[1]{\def\emailaddress{#1}}
\newcommand*{\telephonename}{Telephone:}
\newcommand*{\faxname}{Facsimile:\ }
\newcommand*{\emailname}{Email:}
%\newcommand*{\University}[1]{\def\univname{#1}}
%\newcommand*{\Department}[1]{\def\deptname{#1}}
%\newcommand*{\College}[1]{\def\collname{#1}}
\Business{Maison Shabbychef}
\fax{}
\email{}
\renewcommand*{\today}{\number\day\space\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi,
  \number\year}
\newcommand*{\setdate}[1]{\renewcommand*{\today}{#1}}
\long\def\@processname#1{%
  \@xprocn #1\\@@@%
  \ifx\decoration\@empty
  \else
    \@yprocn #1@@@%
  \fi}
\long\def\@xprocn #1\\#2@@@{\def\fromname{#1}\def\decoration{#2}}
\long\def\@yprocn #1\\#2@@@{\def\decoration{#2}}
\def\decoration{}
\renewcommand*{\name}[1]{\@processname{#1}}
\setlength{\longindentation}{0pt}
\setlength\oddsidemargin{5mm}
\addtolength\textwidth{12mm}
\addtolength\textheight{30mm}
\setlength\topmargin{\z@}
\newlength{\addressblockwidth}%
\setlength\addressblockwidth{48mm}%
\let\@texttop\relax
\newcommand{\centrepage}{%
  \def\@beforeletterskip{\vskip \z@ plus.00006fil\relax}}
\newcommand{\uncentrepage}{\let\@beforeletterskip\relax}
\uncentrepage
\def\ps@empty{%
      \setlength\headsep{\z@}%
      \let\@oddfoot\@empty\let\@oddhead\@empty
      \let\@evenfoot\@empty\let\@evenhead\@empty}
\def\ps@plain{%
      \setlength\headsep{\z@}%
      \let\@oddhead\@empty
      \def\@oddfoot{\normalfont\hfil\thepage\hfil}%
      \def\@evenfoot{\normalfont\hfil\thepage\hfil}}
\if@twoside
  \def\ps@headings{%
      \setlength\headsep{40\p@}%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}%
      \let\@evenhead\@oddhead}
\else
  \def\ps@headings{%
      \setlength\headsep{40\p@}%
      \let\@oddfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \hfil \@date
                    \hfil \pagename{} \thepage}}
\fi
\renewcommand*{\opening}[1]{%
  \thispagestyle{empty}%
  \vspace*{-15mm}%
  \vspace*{-\topmargin}%
  \vbox{\hbox to \textwidth{%
    \normalfont\rmfamily
    {\bfseries\Large\busname}}%\normalfont\rmfamily\scriptsize\scshape
    \hrule
    \vspace{2mm}%
    \hbox to \textwidth{\normalfont\rmfamily
      \parbox[t]{0.5\textwidth}{
    		\footnotesize\normalfont\rmfamily\scshape
				\bfseries
        \fromname\par 
				\mdseries
        \fromlocation\par
        \fromaddress\par
        \ifx\telephonenum\@empty
        \else \telephonename\space\telephonenum\par\fi
        \ifx\faxnum\@empty
        \else \faxname\space\faxnum\par\fi
        \ifx\emailaddress\@empty
        \else \makebox[0pt][l]{\emailname\space\ttfamily
          \emailaddress}\fi
				\mdseries\decoration}}}%
    \@beforeletterskip
  {\raggedright\small\normalfont\rmfamily\scshape\@date\par}%
  \vspace{2\parskip}%
{\raggedright \small\normalfont\rmfamily\scshape\toname\\\toaddress\par}%
\vspace{2\parskip}%
#1
  \par\nobreak}
\pagestyle{plain}
\pagenumbering{arabic}
\endinput
%%
%% End of file `sepperslet.cls'.
