\version "2.25.26"

\include "solmisasi.ily"
% \withExtensions #'("key-signature-summary"
%                     "time-signature-summary"
%                     "simultaneous-divisi"
%                     )

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include #(ly:format "Bersama_Kristus_ly_main~a.ly"
                     (if is-svg? "_svg" ""))

\paper {
  indent = 0
  page-breaking = #ly:one-line-breaking
  bookTitleMarkup = ##f
}

\layout {
  \oneLineLayoutForSVG
}

\include "a4-satb.ily"