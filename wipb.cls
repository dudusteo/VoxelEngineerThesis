%%
%% This is file `wipb.cls`.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{wipb}[2009/07/31 v1.3 LaTeX document class (MZ)]

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{mbook}%
}
\ExecuteOptions{inzynierska,a4paper,12pt,twoside}
\ProcessOptions %\relax

\LoadClass[twoside,12pt]{mbook}
\usepackage[OT4,plmath]{polski}
\usepackage[polish]{babel}
\selectlanguage{polish}
\let\lll\undefined
\usepackage[cp1250]{inputenc}
\usepackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[colorlinks,plainpages=false,
 pdfpagelabels,
 naturalnames=true,
  dvips]{hyperref}
\RequirePackage[tableposition=top]{caption}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage[ruled, vlined]{algorithm2e}%algorytmy
\RequirePackage{tikz}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{t1enc}
\RequirePackage{times}
\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, left=3.5cm, right=2cm]{geometry}
\RequirePackage{setspace}
\RequirePackage{MnSymbol}
\usepackage{breakurl}
\usepackage{epigraph}
\usepackage{makecell}

\definecolor{Gray}{gray}{0.68}
\definecolor{LightGray}{gray}{0.93}
\definecolor{LightGreen}{RGB}{149,222,149}
\definecolor{LightRed}{RGB}{222,149,149}

\pagestyle{headings}
\parindent=1cm
\linespread{1.5}

%definicje odstepow
%\hoffset -1 in
%\textwidth 15.5 cm
%\voffset -1 in
%\textheight 23.5 cm
%\oddsidemargin = 3.5cm
%\evensidemargin = 3.5cm
%\topmargin = 1.5 cm
\footskip = 35pt

\hyphenpenalty=2000			% nie dziel wyraz�w zbyt cz�sto
\clubpenalty=10000			% kara za sierotki
\widowpenalty=10000			% nie pozostawiaj wd�w
\brokenpenalty=10000		% nie dziel wyraz�w mi�dzy stronami
\exhyphenpenalty=999999		% nie dziel s��w z my�lnikiem
\righthyphenmin=4			% dziel minimum 3 litery

\tolerance=4500
\pretolerance=250
\hfuzz=1.5pt
\hbadness=1450

\sloppy

% styl listnig�w
\lstset{
 basicstyle=\footnotesize\ttfamily,
 captionpos=b,
 numbers=none,
 frame=single,
 lineskip={-1.5pt},
 prebreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\rhookswarrow}},
 postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\rcurvearrowse\space}},
 breaklines=true,
 breakatwhitespace=true
}

% obrazki w wyzszej rozdzielczosci
\def\imagesdraft{d}
\def\imagesoriginal{o}
\edef\imagesversion{\imagesoriginal}

\def\katedra#1{\gdef\@katedra{#1}}
\def\typpracy#1{\gdef\@typpracy{#1}}
\def\temat#1{
\gdef\@temat{#1}
\title{#1}
}
\def\autor#1{\gdef\@autor{#1} \author{#1}}
\def\promotor#1{\gdef\@promotor{#1}}
\def\indeks#1{\gdef\@indeks{#1}}
\def\studia#1{\gdef\@studia{#1}}
\def\rokakademicki#1{\gdef\@rokakademicki{#1}}
\def\profil#1{\gdef\@profil{#1}}
\def\kierunekstudiow#1{\gdef\@kierunekstudiow{#1}}
\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\def\zakres#1{\gdef\@zakres{#1}}
\newcounter{@zak}

\newcommand{\mcolumns}[4]{
\multicolumn{#1}{#2}{\parbox{#3\textwidth}{#4}}
}

\newcommand{\mpbox}[1]{
\parbox{.3\textwidth}{\centering #1}
}

\newcolumntype{a}{>{\columncolor{Gray}}c}
\newcolumntype{!}{>{\global\let\currentrowstyle\relax}}
\newcolumntype{^}{>{\currentrowstyle}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
  #1\ignorespaces
}

\newcommand{\multilinecell}[2][c]{%
  \begin{tabular}[#1]{@{}c@{}}#2\end{tabular}}
\newcommand{\myvec}[1]{\ensuremath{\begin{bmatrix}#1\end{bmatrix}}}

\AtBeginDocument{%
  \renewcommand{\tablename}{Tabela}%
  \renewcommand{\listtablename}{Spis tabel}%
}

\newcommand{\biblioteka}[1]
{%\pagebreak
\cleardoublepage
\pagestyle{empty}
~\\ \vspace{2cm}
\begin{center}
{\Large    \textsc{O�wiadczenie}}
\end{center}
\vspace{2cm}
Ja, \@autor, \ifthenelse{\equal{nie}{#1}}{nie wyra�am zgody}{wyra�am zgod�} na udost�pnienie mojej pracy dyplomowej,  pt: ,,\@temat'' w Bibliotece Politechniki Bia�ostockiej.
\vspace{2cm}
\begin{flushright}
\mpbox{...................................\\
\today
{\scriptsize \\[-1em] czytelny podpis}}\hspace{1cm}~
\end{flushright}
}

\def\clearheadinfo{\gdef\@autor{Brak autora}%
                  \gdef\@temat{Brak Tytu�u}%
                  %\gdef\@institute{Brak Katedry}%
}

\renewenvironment{titlepage}{%
%%%%%%%%%strona tytulowa%%%%%%%%%%
    \cleardoublepage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{empty}%
  }%
  {\if@restonecol\twocolumn \else \newpage \fi}


\clearheadinfo
\renewcommand\maketitle{%
  \begin{titlepage}
    \linespread{1.0}
    \begin{center}
      {\huge\textsc{Politechnika Bia�ostocka}\par}
      \vspace{\stretch{.3}}
      {\Large\textsc{Wydzia� Informatyki}\par}
      \vspace{\stretch{1}}
      %{\large\textsc{Katedra \@katedra}\par}
      %\vspace{\stretch{1}}
      {\Large\textsc{Praca dyplomowa \@typpracy}\par}
      \vspace{\stretch{2.5}}
      {\LARGE\textsc{Temat: \@temat}\par}
      \begin{flushright}
          \vspace{\stretch{2.5}}
          {\Large\textsc{Wykonawca: \@autor} \par}
          \vskip 2em
          ....................................\\podpis~~~~~~~~~~~~
      \end{flushright}
      \begin{flushleft}
          \vspace{\stretch{1}}
          {\Large\textsc{Promotor: \@promotor} \par} 
			 \vskip 2em
          ....................................\\~~~~~~~~~~~~podpis
      \end{flushleft}
      \vspace{\stretch{1.5}}
      {\Large\textsc{Bia�ystok \number\year }\ r.\par}
   \end{center}
   \end{titlepage}
   \if@twoside
      {\pagestyle{empty}
      \cleardoublepage}
  \else
  \fi
  %\setcounter{page}\@ne

%%%%%%%metryczka%%%%%%%%%

%\thispagestyle{empty}
% \begin{tikzpicture}[remember picture,overlay]
%   \node at (current page.center) {\includegraphics[width=\pdfpagewidth,height=\pdfpageheight]{grafika/karta_dyplomowa.eps}};
% \end{tikzpicture}
%\clearpage
%\pagestyle{empty}


\pagestyle{empty}
\begin{center}
    {\large\bfseries Karta dyplomowa}\\%[1em]
\begin{tabular}{|p{.33\textwidth}|p{.33\textwidth}|p{.33\textwidth}|}
\hline
\multirow{2}{.3\textwidth}{\mpbox{Politechnika Bia�ostocka\\Wydzia� Informatyki}}&\multirow{3}{.3\textwidth}{\raisebox{-5.5em}{\mpbox{Studia \@studia\\\@profil}}}&\hspace{0mm}\mpbox{ Numer albumu studenta: \@indeks}\\[7mm]
\cline{3-3}
& &Rok akademicki \@rokakademicki\\
\cline{3-3}
\raisebox{-3em}{\mpbox{Katedra \@katedra}}&&\hspace{0mm}\mpbox{Kierunek studi�w: \@kierunekstudiow\\Specjalno��: \@specjalnosc}\\[14mm]
\hline
\multicolumn{3}{|c|}{\raisebox{-1em}{\textbf{\@autor}}}\\[1.75em]
\multicolumn{3}{|l|}{\parbox[c][3em][c]{.8\textwidth}{\textbf{TEMAT PRACY DYPLOMOWEJ: \newline Edytor modeli 3D opartych o woksele}}}\\[5mm]
\multicolumn{3}{|l|}{Zakres pracy:}\\[1mm]
\multicolumn{3}{|l|}{\hspace{1em}\parbox{.8\textwidth}{\@zakres}}\\[1em]
\multicolumn{3}{|l|}{\parbox[c][3em][c]{.8\textwidth}{\textbf{S�owa kluczowe (max 5):} Woksel, 3D, Edytor Modeli, C++}}\\[2em]
\multicolumn{3}{|c|}{\centering \parbox{.5\textwidth}{\centering .................................................\\\footnotesize Imi� i nazwisko promotora - podpis}\parbox{.5\textwidth}{\centering .............................................................\\\footnotesize Imi� i nazwisko kierownika katedry - podpis}}\\[1.5em]
\hline
\multicolumn{3}{|c|}{\hspace{2em}}\\
\multicolumn{1}{|c}{...........................................}&\multicolumn{1}{c}{...........................................}&\multicolumn{1}{c|}{...........................................}\\
\multicolumn{1}{|c}{\parbox{.3\textwidth}{\centering \scriptsize Data wydania tematu pracy dyplomowej - podpis promotora}}&\multicolumn{1}{c}{\parbox{.3\textwidth}{\centering \footnotesize Regulaminowy termin z�o�enia pracy dyplomowej}}&\multicolumn{1}{c|}{\parbox[c]{.3\textwidth}{\centering \footnotesize Data z�o�enia pracy dyplomowej - potwierdzenie dziekanatu}}\\[1em]
\hline
\multicolumn{3}{|c|}{}\\[1em]
\multicolumn{3}{|c|}{\parbox{.4\textwidth}{\centering ...........................................\\\footnotesize Ocena promotora}\parbox{.4\textwidth}{\centering ...........................................\\\footnotesize Podpis promotora}}\\[1em]
\hline
\multicolumn{3}{|c|}{}\\[1em]
\multicolumn{1}{|c}{\parbox{.3\textwidth}{\centering.......................................\\\footnotesize Imi� i nazwisko recenzenta}}&\multicolumn{1}{c}{\parbox{.3\textwidth}{\centering.......................................\\\footnotesize Ocena recenzenta}}&\mcolumns{1}{c|}{.3}{\centering.......................................\\\footnotesize Podpis recenzenta}\\[1em]
\hline
\end{tabular}
\end{center}
}

%% spolszczenia
\renewcommand{\listalgorithmcfname}{Spis algorytm�w}%
\renewcommand{\algorithmcfname}{Algorytm}%
\renewcommand{\algocf@typo}{}%
\renewcommand{\@algocf@procname}{Procedura}
\renewcommand{\@algocf@funcname}{Funkcja}
\renewcommand{\lstlistlistingname}{Spis listing�w}%Nag��wek spisu listing�w
\renewcommand{\lstlistingname}{Listing} %Nag��wek listingu

\endinput
