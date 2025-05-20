\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{technical_report}[2025/04/08 v0.1 NCSU NE PRA Group Technical Report class]

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}

%% Spacing options
\newcommand{\ncsu@defaultspacing}{\onehalfspacing}
\DeclareOption{singlespacing}{
     \renewcommand{\ncsu@defaultspacing}{\singlespacing}}
\DeclareOption{onehalfspacing}{
     \renewcommand{\ncsu@defaultspacing}{\onehalfspacing}}
\DeclareOption{doublespacing}{
     \renewcommand{\ncsu@defaultspacing}{\doublespacing}}

\newenvironment{lscape}{\begin{lscapenum}}{\end{lscapenum}}
\DeclareOption{hardcopy}{
    \renewenvironment{lscape}{\begin{lscapenotnum}}{\end{lscapenotnum}}
}
     
\DeclareOption*{\PackageWarning{technical_report}{Unknown option `\CurrentOption'. Ignoring}}
\ExecuteOptions{letterpaper,onehalfspacing}
\ProcessOptions
\LoadClass{book}

%% fonts
% ----------------------------------
% ----------------------------------
%% left-aligned
% \usepackage[document]{ragged2e}

\usepackage{xcolor}

\usepackage{verbatim,shellesc}
\ShellEscape{cp /usr/local/share/latexmk/LatexMk ./LatexMk}

%% paragraph spacing
\usepackage[skip=8pt]{parskip}
%% No paragraph indenting
\setlength\parindent{0pt}

%% for tables
\RequirePackage{siunitx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{ltablex} % <- longtable w/ tabularX
% \RequirePackage{ragged2e}
\RequirePackage{tabularx}
\RequirePackage{multirow} 
\RequirePackage{pdflscape}
\RequirePackage{makecell}
\usepackage{array}
%% hidden column
\newcolumntype{H}{>{\setbox0=\hbox\bgroup}c<{\egroup}@{}}

%% rotating needs to be before footnote
\usepackage{rotating}
\usepackage{tablefootnote}

\usepackage{algorithm}
\usepackage{siunitx}
\usepackage{algpseudocode}
\usepackage{lmodern}
\usepackage{amsmath, amsfonts, amssymb}
\usepackage{graphicx}
\usepackage{setspace}

\usepackage{pgfplots}
\usepackage{comment}
\pgfplotsset{compat=1.18}

\usepackage{wrapfig}
\usepackage{subcaption} % in preamble
\usepackage{caption}

%% for appendices
\usepackage[toc,page]{appendix}

%% for definitions
\usepackage{amsthm}
\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}

\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{titling}


%% glossaries
\RequirePackage[xindy,toc,acronym]{glossaries}
\setlength{\glsdescwidth}{1.2\textwidth}

\RequirePackage{hyphenat}
\RequirePackage{nolbreaks}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{datetime}
\newdateformat{monthyeardate}{\monthname[\THEMONTH], \THEYEAR}
\RequirePackage[nottoc]{tocbibind} % includes lof, lot, refs in toc

\RequirePackage{xparse}
\usepackage{xparse}
\DeclareDocumentCommand{\newdualentry}{ O{} O{} m m m m } {
  \newglossaryentry{gls-#3}{name={#5},text={#5\glsadd{#3}},
    description={#6},#1
  }
  \makeglossaries
  \newacronym[see={[Glossary:]{gls-#3}},#2]{#3}{#4}{#5\glsadd{gls-#3}}
}

%% for reviewing documents
% \usepackage{easyReview}

%%----------------------------------------------------------------------------%%
%%---------------------------- Formatting Options ----------------------------%%
%% -------------------------------------------------------------------------- %%

%% -------------------------------------------------------------------------- %%
%% Disposition format -- any titles, headings, section titles
\newcommand{\ncsu@dispositionformat}{}
\allsectionsfont{\ncsu@dispositionformat}
\providecommand{\dispositionformat}[1]{
    \renewcommand{\ncsu@dispositionformat}{#1}
    \allsectionsfont{\ncsu@dispositionformat}
}

%% Heading/Chapter/Section format
\newcommand{\ncsu@headingformat}{\ncsu@dispositionformat}
\providecommand{\headingformat}[1]{
    \renewcommand{\ncsu@headingformat}{\ncsu@dispositionformat #1}
}

%% Capital letter height
\newlength{\ncsu@capitalheight}
\settoheight{\ncsu@capitalheight}{D}

%% Line height
\newlength{\ncsu@lineheight}
\setlength{\ncsu@lineheight}{2.0ex}

%% Leading height: The leading changes thoughout the document, so this
%%  length must be updated
\newlength{\ncsu@leading}

%% We must add two double spaces plus one capital-height (for the page number)
%%  to footskip.  Footskip is measured from the top of the bottom margin.
%%  (See geometry package documentation, note that includefoot option is used.)
\ncsu@defaultspacing
% \newlength{\ncsu@footskip}
% \setlength{\ncsu@footskip}{\ncsu@capitalheight}
% \addtolength{\ncsu@footskip}{2\baselineskip}
% \addtolength{\ncsu@footskip}{0.5in}  % A little extra space to ensure there
%                                      %  are 2 full double spaced lines
% \RequirePackage[includefoot,
%                 tmargin=1in,
% 				bmargin=0.5in,
%                 rmargin=1in,
%                 lmargin=1.25in,
%                 footskip=\ncsu@footskip]{geometry}

% January 2023 Update - Just set all margins to 1in
\usepackage[margin=1in,showframe=false]{geometry}
% \usepackage[margin=0.5in, bottom=1in, top=1in]{geometry}

\dispositionformat{\bfseries}            % bold and serif
\headingformat{\Large\MakeUppercase}   % All letters uppercase
%\headingformat{\large}                % Not all uppercase
%\headingformat{\Large\scshape}        % Small Caps, used with serif fonts.

%% Typographers recommend using a normal inter-word space after
%% sentences. TeX's default is to add an wider space, but \frenchspacing
%% gives a normal spacing. Comment out the following line if you prefer wider spaces between sentences.
\frenchspacing

%% -------------------------------------------------------------------------- %%

%% \chapter*-to-first line space
%% This applies to preliminary headings, and ToC, LoF, LoT
\newlength{\ncsu@afterschapsep}
\setlength{\ncsu@afterschapsep}{3\ncsu@lineheight}

%% -------------------------------------------------------------------------- %%
%% Headers/footers - page number
% \pagestyle{plain}

%% -------------------------------------------------------------------------- %%
%% Vertical space around tables and figures, triple spacing
\setlength{\textfloatsep}{3\ncsu@lineheight}
\setlength{\intextsep}{3\ncsu@lineheight}

\usepackage[utf8]{inputenc}
% \RequirePackage{biblatex}

\usepackage[acronym]{glossaries}
\makeglossaries
\input{acronyms}
\input{definitions}

\usepackage{environ}

% Subtitle
\newcommand{\subtitle}[1]{%
  \posttitle{%
    \par\end{center}
    \begin{center}\large#1\end{center}
    \vskip0.5em}%
}

\usepackage{fancyhdr}
% Facesheet macro
% NCSU colors
% \definecolor{ncsured}{RGB}{204,0,0}
% \definecolor{ncsured}{RGB}{185,36,42}
\definecolor{ncsured}{RGB}{153,0,0}
\definecolor{ncsugray}{RGB}{230,230,230}

% Default logo/graphic paths (user can override in main document)
\providecommand{\ncsulogobw}{assets/logos/ncstate-brick-4x1-blk-rgb.eps}
\providecommand{\ncsulogored}{assets/logos/ncstate-brick-4x1-red-rgb.eps}

% Facesheet macro
\newcommand{\makefacesheet}{
  \thispagestyle{empty}
  % Full-page red background
  \begin{tikzpicture}[remember picture, overlay]
    \fill[ncsured] (current page.south west) rectangle (current page.north east);
    % Right-side vertical graphic (user provides)
    % \node[anchor=north east, xshift=0cm, yshift=0cm] at (current page.north east) {\includegraphics[height=\paperheight]{\ncsurightgraphic}};
    % Top left: NCSU logo (user provides)
    % \node[anchor=north west, yshift=-1.5cm] at (current page.north west) {\includegraphics[height=4.8em]{\ncsulogobw}};
  \end{tikzpicture}

  % \begin{flushright}
  %   {\sffamily\bfseries\Large\color{white}{\docid\par}}
  % \end{flushright}
  \begin{flushleft}
  \vspace*{4em}
  \includegraphics[height=3.5em]{\ncsulogobw}\par
  % Main content (left-aligned, white text, with whitespace)
  \vspace{8em}
  \parbox{1.0\textwidth}{
    % \RaggedRight
    {\sffamily\bfseries\fontsize{22}{24}\selectfont\color{white}\MakeUppercase{\docsubtitle\par}}
    \vspace{1em}
    \rule{\textwidth}{4pt}\par
    \vspace{4em}
    {\sffamily\bfseries\fontsize{18}{18}\selectfont\color{white}{\@title\par}}
  }
  \end{flushleft}
  \vfill
  {\sffamily\bfseries\Large\color{white}{\docid\par}}
  \vfill
  \begin{flushright}
  \sffamily\bfseries\fontsize{14}{14}\color{white}{\acrlong{pra} Group\\Department of Nuclear Engineering\par}
  \end{flushright}

  \null
  \clearpage
}

% \usepackage{fancyhdr}
\newcommand{\maketitlepage}{
     \thispagestyle{fancy}
     \fancyhf{} % sets both header and footer to nothing
     \renewcommand{\headrulewidth}{0pt}
     \lhead{\includegraphics[height=2.4em]{\ncsulogored}}
     \rhead{\docid \\ Revision \docrev}

     \setlength{\headheight}{28pt}
     \setlength{\headsep}{1.5in}
     \vspace*{6em}
      \begin{flushleft}
            % \vfill
        {\huge\bfseries{
            \@title\par
            }
        }
        \vspace{4em}
        {\Large\docsubtitle\par}
        % \vfill
        \vspace{2em}
        Manuscript Completed: \monthyeardate\today\par
        \vfill
        Prepared by:\\
        \theauthor\par
        \vfill
        \acrlong{pra} Group\\
        Department of Nuclear Engineering\\
        \acrlong{ncsu}\par
      \end{flushleft}
      \noindent\rule{\textwidth}{4pt}
      \ncsu@defaultspacing
      \setlength{\headsep}{0in}
      \pagestyle{plain}
}

%% -------------------------------------------------------------------------- %%
%% ------------ Dedication, biography, and acknowledgments ----------------- %%
%% -------------------------------------------------------------------------- %%
%%  Template
\newcommand{\ncsu@dedbioack}[1]{%
    \chapter{#1}%
}

%%  Dedication
\newcommand{\executivesummarytitle}{Executive Summary}
\newenvironment{executivesummary}
{\ncsu@dedbioack{\executivesummarytitle}}
{\clearpage}

\newcommand{\makeversioncontrolpage}{%
  \clearpage
  \thispagestyle{empty}%
  % \vspace*{\fill}
  \begin{center}
    {\large\normalfont\bfseries\MakeUppercase{Configuration Control}\par}
    \vspace{1em}
    {\parbox{0.50\linewidth}{
        \hrule \vspace{1em}
        \begin{flushleft}
          \ifdefined\docid
            \textbf{Document ID:} \docid\par
          \fi
          \ifdefined\docrev
            \textbf{Revision:} \docrev\par
          \fi
          \ifdefined\docsrc
              \ifdefined\docdoi
                \textbf{Source Repository:} \href{\docsrc}{\docdoi}\par
              \fi
          \fi
        \end{flushleft}
        \vspace{1em}
        \hrule \vspace{1em}
        \footnotesize{
            This \texttt{git} version-controlled document was typeset using \TeX{}.
            \ifdefined\docdoi
                A complete revision history, with sources, is available from the repository link.
            \fi
        }
    }}
  \end{center}
  \vspace*{\fill}
}

%%  Acknowledgments
\newcommand{\acknowledgmentstitle}{Acknowledgments}
\newenvironment{acknowledgments}
{\ncsu@dedbioack{\acknowledgmentstitle}}
{\clearpage}

%%  gai_declaration

\NewEnviron{aideclaration}{
  \clearpage 
  \vspace*{\fill}
  \begin{center}
    {\large\normalfont\bfseries\MakeUppercase{Declaration on the use of Artificial Intelligence}\par}
    \vspace{1em}
    \parbox{0.75\linewidth}{\small\BODY}
  \end{center}
  \vspace*{\fill}
}


\newcommand{\abstracttitle}{Abstract}
\newenvironment{abstract}
{\ncsu@dedbioack{\abstracttitle}}
{\clearpage}

\newcommand{\makecopyrightpage}{
    \begin{titlepage}
    \centering
      \quad
      \vspace{0.35\textheight}

      \copyright{} Copyright \ncsu@year{} by \@author \\[1em]
      All Rights Reserved

      \vfill
    \end{titlepage}
}

\renewcommand{\appendixname}{Annex}
\renewcommand{\appendixtocname}{Appendix}

%%% table of contents
\RequirePackage{tocloft}
\RequirePackage{listings}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} %<--------
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\newcommand{\reporttableofcontents}{%
    \singlespacing%
    \setlength{\cftbeforetoctitleskip}{-\baselineskip}
    \tableofcontents%
    \clearpage%
    \ncsu@defaultspacing%
}
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\ncsu@headingformat}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
% \renewcommand{\listfigurename}{Figures}
% \renewcommand{\listtablename}{Tables}

\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\ncsu@headingformat}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}

\renewcommand{\listfigurename}{List of Figures}
\settowidth{\cftfignumwidth}{Figure 00.000}
\renewcommand{\cftfigpresnum}{Figure }
\newcommand{\reportlistoffigures}{%
    \singlespacing%
    \setlength{\cftbeforeloftitleskip}{-\baselineskip}
    \label{tagforlistoffigures}
    \listoffigures%
    \clearpage%
    \ncsu@defaultspacing%
}
\renewcommand{\cftloftitlefont}{\hfill\ncsu@headingformat}
\renewcommand{\cftafterloftitle}{\hfill}

\renewcommand{\listtablename}{List of Tables}
\settowidth{\cfttabnumwidth}{Table 00.00}
\renewcommand{\cfttabpresnum}{Table }
\newcommand{\reportlistoftables}{%
    \singlespacing%
    \setlength{\cftbeforelottitleskip}{-\baselineskip}
    \label{tagforlistoftables}
    \listoftables%
    \clearpage%
    \ncsu@defaultspacing%
}
\renewcommand{\cftlottitlefont}{\hfill\ncsu@headingformat}
\renewcommand{\cftafterlottitle}{\hfill}


\newcommand{\reportlistofalgorithms}{%
    \singlespacing%
    \setlength{\cftbeforelottitleskip}{-\baselineskip}
    \label{tagforlistofalgorithms}
    \listofalgorithms%
    \addtocontents{loa}{\def\string\figurename{Algorithm}}
    \clearpage%
    \ncsu@defaultspacing%
}

\renewcommand{\cftlottitlefont}{\hfill\ncsu@headingformat}
\renewcommand{\cftafterlottitle}{\hfill}
%% headers
%Header styles
% \usepackage{fancyhdr}
% \setlength{\headheight}{15pt}
% \pagestyle{fancy}
% % \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
% % \renewcommand{\sectionmark}[1]{\markright{#1}{}}
% % \fancyhf{}
% % \fancyhead[LE,RO]{\thepage}
% % \fancyhead[RE]{\textbf{\textit{\nouppercase{\leftmark}}}}
% % \fancyhead[LO]{\textbf{\textit{\nouppercase{\rightmark}}}}
% % \fancypagestyle{plain}{ %
% % \fancyhf{} % remove everything
% % \renewcommand{\headrulewidth}{0pt} % remove lines as well
% % \renewcommand{\footrulewidth}{0pt}}


% \makeatletter
% \renewcommand{\maketitle}{\bgroup
% \begin{flushleft}
%   \LARGE\textbf{\@title}
% \end{flushleft}\egroup
% }
% \makeatother

% \pretitle{\begin{left}}
% \posttitle{\par\end{left}}
% \preauthor{\begin{center}\fontsize{14bp}{14bp}\selectfont}
% \postauthor{\par\end{center}\vspace{24bp}}
% \predate{}
% \date{}
% \postdate{}

\usepackage{titlesec}
% \titleclass{\part}{top}
% \titleformat{\part}[display]
%   {\normalfont\huge\bfseries}{\centering\partname\ \thepart}{80pt}{\Huge\centering}

% Chapter title formatting
\titleformat{\chapter}[display]
{\centering\Large\normalfont\bfseries}{}{0pt}{\ifnum\value{chapter}>0 \thechapter\hspace{2ex}\fi\MakeUppercase}

% Adjust vertical spacing before and after chapter titles
\titlespacing*{\chapter}{0pt}{-\baselineskip}{\baselineskip}


% \titleformat{\chapter}[display]
%   {\centering\Large\normalfont\bfseries}
%   {\ifnum\value{chapter}>0 \thechapter\hspace{2ex}\fi}
%   {0pt}
%   {\MakeUppercase}


\usepackage[skip=1ex]{caption}