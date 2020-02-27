 % DIPLOMAFERI.CLS - VERSION 1.0
% Klemen Berkovič - April 22nd. 2009
%
\def\fileversion{V1.00}
\def\filedate{Marec 25, 2019}
\def\docdate {Monday 25. March 2019}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{feridiploma}[2019/03/20 Example LaTeX class]

\LoadClass[12pt]{book}

\RequirePackage[utf8]{inputenc} % omogoča uporabo slovenskih črk kodiranih v formatu UTF-8
\RequirePackage[slovene,english]{babel} % naloži, med drugim, slovenske delilne vzorce
\RequirePackage[a4paper, twoside=true]{geometry} % Za nastavljanje robov strani
\RequirePackage[pdftex]{graphicx}  % omogoča vlaganje slik različnih formatov
\RequirePackage{titlesec} % Nastavitve za stile naslovov
\RequirePackage{filecontents} % Nastavitve za fonte
\RequirePackage{fancyhdr} % poskrbi, na primer, za glave strani
\RequirePackage{amssymb} % dodatni simboli
\RequirePackage{amsmath} % eqref, npr.
\RequirePackage[hyphens]{url} 
\RequirePackage{comment} % Za komentarje
\RequirePackage{color} % Za barve
\RequirePackage{soul}
\RequirePackage{longtable} % Za tabele, ki se preslikajo na več strani
\RequirePackage[linesnumbered,boxed,resetcount,algochapter]{algorithm2e} % Pseudokod, ki bo imel ostevilcene vrstice ter bo imel vsebino zapisano v okvirju
\RequirePackage[pdftex, colorlinks=true, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black, pagebackref=false, pdfproducer={LaTeX}, pdfcreator={LaTeX}, hidelinks]{hyperref}
\RequirePackage{xmpincl}
\RequirePackage{datetime}
\RequirePackage[language=slovene, backend=bibtex]{biblatex} % Pretvori zapis literature v izbran jezik (slovenscina v tem primeru), ter uporablja program bibtex za generiranje zapisov
\RequirePackage{caption}
\RequirePackage{tocloft}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Podatki
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Naslov slo
\def\ttitle#1{\def\@ttitle{#1}}
\newcommand{\pttitle}{\@ttitle}
% Naslov en
\def\ttitleEn#1{\def\@ttitleEn{#1}}
\newcommand{\pttitleEn}{\@ttitleEn}
%
\def\tsubject#1{\def\@tsubject{#1}}
\newcommand{\ptsubject}{\@tsubject}
% Anglški naslov
\def\tsubjectEn#1{\def\@tsubjectEn{#1}}
\newcommand{\ptsubjectEn}{\@tsubjectEn}
% Autor
\def\tauthor#1{\def\@tauthor{#1}}
\newcommand{\ptauthor}{\@tauthor}
% Email autorja
\def\tauthormail#1{\def\@tauthormail{#1}}
\newcommand{\ptauthormail}{\@tauthormail}
% Mentor
\def\tmenthor#1{\def\@tmenthor{#1}}
\newcommand{\ptmenthor}{\@tmenthor}
% UDK
\def\tudk#1{\def\@tudk{#1}}
\newcommand{\ptudk}{\@tudk}
% Kljucne besede SLO
\def\tkeywords#1{\def\@tkeywords{#1}}
\newcommand{\ptkeywords}{\@tkeywords}
% Kljucne besede EN
\def\tkeywordsEn#1{\def\@tkeywordsEn{#1}}
\newcommand{\ptkeywordsEn}{\@tkeywordsEn}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Postavitev strani
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{
	top=30mm, bottom=30mm, 
	left=35mm, right=25mm, 
	textwidth=155mm,
	headsep=15mm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stili naslovo, glav strani, fontov naslovov
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand\large{\@setfontsize\large\@xiipt{14pt}}
%\renewcommand\Large{\@setfontsize\Large\@xivpt{18pt}}
%\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{26pt}}
\newcommand{\autfont}{\Large}
\newcommand{\titfont}{\Huge\bf}
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

\renewcommand{\baselinestretch}{1.5} % ustrezen razmik med vrsticami

\captionsetup[table]{skip=5pt} % ustrezen razmik med naslovom tabele in vsebino tabele
\captionsetup[figure]{skip=-5pt} % Ustrezen razmik med naslovom slike in samo sliko

\fancyhf{} % pocistimo trenutno oblikovanje glave in noge
%\fancyhead[LO]{\sc\footnotesize\rightmark}
%\fancyhead[RE]{\sc\footnotesize\pttitle}
\renewcommand{\headrulewidth}{0pt} % Odstranimo ctre v hlavi
\renewcommand{\footrulewidth}{0pt} % Odstranimo crte v nogi
\fancyfoot[LE,RO]{\thepage} % V nogo dodamo ostevilcenje na rob

\fancypagestyle{plain}{ %
  \fancyhf{} % pocistimo trenutno oblikovanje glave in noge
  \renewcommand{\headrulewidth}{0pt} % Odstranimo ctre v hlavi
  \renewcommand{\footrulewidth}{0pt} % Odstranimo crte v nogi
  \fancyfoot[LE,RO]{\thepage} % V nogo dodamo ostevilcenje na rob
}

\newcommand{\BibTeX}{{\sc Bib}\TeX}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kazala
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % Dodane pike pri kazalu vsebine za chapter
\renewcommand{\listalgorithmcfname}{Algoritmi} % Poimenovanje naslova kazala za algoritme
\setcounter{tocdepth}{1} % Globina kazala

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algoritmi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\SetAlCapSty{} % Pocistimo stil naslovol za algoritme
\SetAlgorithmName{Algoritem}{}{Algoritmi} % nastavimo labele algoritmov
\SetKwInput{Input}{Vhod} % Dodana nova kljucna beseda, ki definira vhod v algoritem
\SetKwInput{Output}{Izhod} % Dodana nova kljucna beseda, ki definira izhod iz algoritma
\SetAlFnt{\linespread{1}\normalsize} % Nstavimo razmik med vrsticami v okolju za pisanje algoritmov
\SetAlCapSkip{15pt} % Dodamo zamik naslovu algoritma

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% naslovi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter.\ #1}}{}} \renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{\thesection.\ #1}}} \renewcommand{\headrulewidth}{0.5pt} \renewcommand{\footrulewidth}{0pt}
\titleformat{\chapter}{\vspace{25mm}\LARGE\bfseries}{\thechapter}{2.5mm}{}
\titleformat{name=\chapter,numberless}{\LARGE\bfseries}{}{0mm}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% konstrukti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
\newtheorem{izrek}{Izrek}[chapter]
\newtheorem{trditev}{Trditev}[izrek]
\newenvironment{dokaz}{\emph{Dokaz.}\ }{\hspace{\fill}{$\Box$}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Naslovnica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\naslovnica}{
	\pagestyle{empty}
	\begin{center}
		{\Large\sc Univerza v Mariboru}\\
		{\Large\sc Fakulteta za elektrotehniko,\\računalništvo in informatiko}
		\vskip 15em
		{\autfont\ptauthor\vskip 1em}
		{\titfont\Huge\pttitle\vskip 1em}
		{\autfont\textsc{Magistrsko delo}}
		\vfill\null
		{\autfont\sc Maribor, \monthyeardate\today\par}
	\end{center}
	\cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Druga stran
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{drugastran}{
	\pagestyle{plain}
	\begin{center}
		\vspace*{15em}
		{\titfont\Huge\pttitle\par}
		{\vskip 3em\autfont\textsc{Magistrsko delo}\par}
		\vfill\null		
	\end{center}
}{
	\cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zahvala
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{zahvala}{
	\pagestyle{plain}
	\mbox{}{\vskip0.20\textheight}
	\mbox{}
	\hfill
	\begin{minipage}{0.55\textwidth}
}{
		\normalfont
	\end{minipage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Povzetek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{povzetek}{
	\pagestyle{plain}
	\chapter*{\pttitle}
	\bigskip
	\bigskip
	\bigskip
	
	\begin{tabbing}
		\noindent\textbf{Ključne besede:} \= \ptkeywords.
		\\\\
		\noindent\textbf{UDK:} \> \ptudk
	\end{tabbing}
	\bigskip
	\bigskip
	\bigskip
	
	\noindent\textbf{Povzetek:}
	\bigskip\\	
	\noindent\itshape
}{
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstract}{
	\pagestyle{plain}
	\selectlanguage{english}
	\chapter*{\pttitleEn}
	\bigskip
	\bigskip
	\bigskip
	
	\begin{tabbing}
		\noindent\textbf{Keywords:} \= \ptkeywordsEn.
		\\\\
		\noindent\textbf{UDK:} \> \ptudk
	\end{tabbing}
	\bigskip
	\bigskip
	\bigskip
	
	\noindent\textbf{Abstract:}
	\bigskip\\		
	\noindent\itshape
}{
	\selectlanguage{slovene}
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seznam kratic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{seznamkratic}{
	\pagestyle{plain}
	\chapter*{Seznam uporabljenih kratic}
	\noindent
	\begin{longtable}{p{.1\textwidth}|p{.4\textwidth}|p{.4\textwidth}} % Tabela ki se automatično deli na več strani
		{\bf kratica} & {\bf angleško} & {\bf slovensko} \\ \hline \endhead
}{
	\end{longtable}
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seznam simbolov
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{seznamsimbolov}{
	\pagestyle{plain}
	\chapter*{Seznam uporabljenih simbolov}
	\noindent
	\begin{longtable}{p{0.2\textwidth}|p{.6\textwidth}} % Tabela ki se automatično deli na več strani
		{\bf simbol} & {\bf pomen} \\ \hline \endhead
	}{
	\end{longtable}
	\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Literatura
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\literatura}{
	\cleardoublepage
	\addcontentsline{toc}{chapter}{Viri in literatura} % Dodajanje naslova za literaturo v kazalo vsebine
	\printbibliography[title=Viri in literatura] % Izpis literature v sam dokument
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ukaz za mesec in leto 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newdateformat{monthyeardate}{\monthname[\THEMONTH] \THEYEAR}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% \convertDate converts D:20080419103507+02'00' to 2008-04-19T10:35:07+02:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\def\convertDate{%
	\getYear
}

{\catcode`\D=12
	\gdef\getYear D:#1#2#3#4{\edef\xYear{#1#2#3#4}\getMonth}
}
\def\getMonth#1#2{\edef\xMonth{#1#2}\getDay}
\def\getDay#1#2{\edef\xDay{#1#2}\getHour}
\def\getHour#1#2{\edef\xHour{#1#2}\getMin}
\def\getMin#1#2{\edef\xMin{#1#2}\getSec}
\def\getSec#1#2{\edef\xSec{#1#2}\getTZh}
\def\getTZh +#1#2{\edef\xTZh{#1#2}\getTZm}
\def\getTZm '#1#2'{%
	\edef\xTZm{#1#2}%
	\edef\convDate{\xYear-\xMonth-\xDay T\xHour:\xMin:\xSec+\xTZh:\xTZm}%
}
