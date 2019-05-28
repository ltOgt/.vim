% =================================================================================
% <§§>
% =================================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{<§§>}[<§§>]

% Base this class on the article class
\LoadClass[12pt]{article}


% ================================================================================= PACKAGES
% Require as not to load multiple times
\RequirePackage{titlesec}
\RequirePackage[
	a4paper,
	lmargin={2cm},
	rmargin={2cm},
	tmargin={1cm},
	bmargin={1cm},
]{geometry}
\RequirePackage[T1]{fontenc}


% ================================================================================= STYLE
% Turn of indentation
\setlength\parindent{0pt}

% Customize section command
\titleformat{\section}
  {\Large\scshape\raggedright} % Large headers, small capitals, left alligned, bold
  {}{0em}                         % Parameter: used to define prefix
  {}                              % Parameter: used to insert code before the heading
[\titlerule]                      % Inserts a horizontal line after the heading

% No pagenumbering
\pagenumbering{gobble}

% ================================================================================= COMMANDS
\newcommand{<§§>}[<§§>]{<§§>}
