\NeedsTeXFormat{pLaTeX2e}
\LoadClass[fontsize=10bp,
  number_of_lines=45,
  line_length=160truemm,
  jafontsize=10bp,
  fontsize=10pt,
  paper=a4paper
]{jlreq}
\ProvidesClass{jaee}
  [2025/09/02 v0.1 Annual Meeting of Japan Association for Earthquake Engineering]

\RequirePackage{newtxtext}
\RequirePackage{geometry}
\RequirePackage[singlespacing]{setspace}
\RequirePackage{overcite}
\RequirePackage[T1]{fontenc}
\RequirePackage[deluxe]{otf} % for \marunum
\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{tikz}
\RequirePackage{tabularray}
\RequirePackage{url}
\RequirePackage{caption}

%% caption setup
\captionsetup{
  labelsep=quad,
  skip=3pt,
  format=hang,
  justification=raggedright,
  font={sf,stretch=0.7}
}
\captionsetup[table]{position=top}

% ページ設定
\geometry{
  scale=1.0,
  layoutoffset=0pt,
  top=25truemm,
  bottom=35truemm,
  left=25truemm,
  right=25truemm,
  includefoot=false,
  includehead=false,
  headheight=0pt,
  headsep=0pt
}

\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\jlreqsetup{
}

\ModifyPageStyle{plain}{nombre=-\,\thepage\,-}
\pagestyle{plain}

% tblr settings
\SetTblrInner{rowsep=0pt,colsep=2pt,stretch=0.8}

% \url setting
\urlstyle{same}

% % キャプション間を少し詰める
% \setlength\abovecaptionskip{1pt}

%figure&table
\setlength\textfloatsep{1\zw}
\setlength\floatsep{1\zw}
\setlength\intextsep{1\zw}

% セクション(jlreq.cls の書き方)
\RenewBlockHeading{section}{1}{font={\normalsize\sffamily\gtfamily},lines=2,after_label_space=0.5\jlreq@zw,second_heading_text_indent={-1\jlreq@zw,1\jlreq@zw},subtitle_font={\normalsize}}
\RenewBlockHeading{subsection}{2}{font={\normalsize\sffamily\gtfamily},lines=1,before_lines=1,after_label_space=0.5\jlreq@zw,second_heading_text_indent={-1\jlreq@zw,1\jlreq@zw},subtitle_font={\small}}
\RenewBlockHeading{subsubsection}{3}{font={\normalsize\sffamily\gtfamily},lines=1,subtitle_break=false,after_label_space=0.5\jlreq@zw,second_heading_text_indent={-1\jlreq@zw,1\jlreq@zw},subtitle_font={\scriptsize}}
\renewcommand{\thesection}{\@arabic\c@section{}.}
\renewcommand{\thesubsection}{\@arabic\c@section .\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\@arabic\c@section .\@arabic\c@subsection
  .\@arabic\c@subsubsection}

%% 参考文献
\def\@biblabel#1{#1)}   %List

\renewenvironment{thebibliography}[1]{%
  \jlreq@oldfontcommand@enable
  \section*{\refname}%
  \vspace{-0.6\baselineskip}
  \@mkboth{\refname}{\refname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
      {\settowidth\labelwidth{\@biblabel{#1}}%
      \labelsep=1\jlreq@zw
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \itemindent=0pt
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty~`thebibliography'~environment}}%
  \endlist
  \jlreq@oldfontcommand@disable
}
\let\@openbib@code\@empty

%% citation
%% a little change from `overcite.sty'
\renewcommand\citeform[1]{#1)} % parenthesis after numbers ^{1)-5),8)}

% define \author
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\shozoku}[1]{\gdef\@shozoku{#1}}
%
% define \abstract
%
\renewcommand{\abstract}[1]{%
  \gdef\@abstract{#1}}
\newcommand{\@abstract}{\@latex@error{No \noexpand\abstract given}\@ehc}
%
% keywords
%
\def\keywords#1{\gdef\@keywords{#1}}

%
% set layout of the actual \@maketitle suitable for your need
%
\newlength{\abstractwidth}
\setlength{\abstractwidth}{140truemm}

\def\@maketitle{%
  \newpage\null
  \parindent=0pt
  \vspace{-23mm} % need fix
  \hspace{-10mm} % need fix
  \includegraphics{jaeelogo}
  \vspace{2\baselineskip}\par
  \begin{center}%

    % 日本語主題
    {\fontsize{14bp}{12pt}\usekanji{JY1}{gt}{m}{n} \@title}\vspace{2\baselineskip}\par
    %
    % {\fontsize{14bp}{12pt}\@author}\vspace{\baselineskip}\par
    {\Large\@author}\vspace{\baselineskip}\par
    {\@shozoku}
    %
    %
  \end{center}\vspace{2.5\baselineskip}\par
  %
  \begin{center}
    {\gtfamily 要\　約}\vspace{2mm}\par
    \parbox{\abstractwidth}{
      {\@abstract}\vspace{\baselineskip}\par
      % 
      \begin{tikzpicture}
        \node[xslant=0.30]{キーワード：\,\, {\@keywords}};
      \end{tikzpicture}
      \vspace{\baselineskip}
    }
  \end{center}
  \vspace{0.5\baselineskip}\par
  %%%
}

%%%%%
% \maketitle の再定義
%     abstract と Keywords を追加
%     プリアンブルで、\title, \author, \abstract, \keywords
%     を指定
%
\def\maketitle{\par
  \begingroup
  \@maketitle
  \endgroup
%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@keywords\@empty
  \global\let\@abstract\@empty
  \global\let\title\relax
  \global\let\keywords\relax
  \global\let\abstract\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%%%% some tips
\def\frac#1#2{{\begingroup\;#1\;\endgroup\@@over\;#2\;}}
\newcommand{\dspfrac}[2]{\displaystyle\frac{#1}{#2}}
\newcommand{\marusuuji}[1]{\raisebox{-1.2pt}{{\scalebox{1.2}{\textcircled{\tiny{#1}}}}}}
%% 
\newcommand{\marunum}[1]{% ref: https://ja.tak-cslab.org/archives/1412
\ifcase#1%
\UTF{24EA}\or\UTF{2460}\or\UTF{2461}\or\UTF{2462}\or\UTF{2463}\or\UTF{2464}%
\or\UTF{2465}\or\UTF{2466}\or\UTF{2467}\or\UTF{2468}\or\UTF{2469}\or\UTF{246A}%
\or\UTF{246B}\or\UTF{246C}\or\UTF{246D}\or\UTF{246E}\or\UTF{246F}\or\UTF{2470}%
\or\UTF{2471}\or\UTF{2472}\or\UTF{2473}\or\UTF{3251}\or\UTF{3252}\or\UTF{3253}%
\or\UTF{3254}\or\UTF{3255}\or\UTF{3256}\or\UTF{3257}\or\UTF{3258}\or\UTF{3259}%
\or\UTF{325A}\or\UTF{325B}\or\UTF{325C}\or\UTF{325D}\or\UTF{325E}\or\UTF{325F}%
\or\UTF{32B1}\or\UTF{32B2}\or\UTF{32B3}\or\UTF{32B4}\or\UTF{32B5}\or\UTF{32B6}%
\or\UTF{32B7}\or\UTF{32B8}\or\UTF{32B9}\or\UTF{32BA}\or\UTF{32BB}\or\UTF{32BC}%
\or\UTF{32BD}\or\UTF{32BE}\or\UTF{32BF}%
\fi%
}
