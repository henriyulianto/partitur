\version "2.25.26"

\include "solmisasi.ily"
\withExtensions #'("key-signature-summary"
                    "time-signature-summary"
                    "simultaneous-divisi"
                    )

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Puji_dan_Syukur_ly_main.ly"

\paper {
  indent = 0
  page-breaking = #ly:one-line-breaking
  bookTitleMarkup = ##f
}

\layout {
  \oneLineLayoutForSVG
  \context {
    \Score
    \consists Metronome_mark_engraver
  }
}

\include "a4-satb.ily"