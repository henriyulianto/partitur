\version "2.25.26"

\include "solmisasi.ily"
\withExtensions #'("key-signature-summary"
                    "time-signature-summary"
                    "simultaneous-divisi"
                    )

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Tuhan_Maharahim_ly_main.ly"

\header {
  judul = "Tuhan Maharahim"
  sub-judul = "Untuk PS Campur SATB"
  judul-header-I = "Tuhan Maharahimr"
  judul-header-II = "Untuk PS Campur SATB"
  pencipta-lagu = \markup {
    \override #'(baseline-skip . 2.5)
    \right-column {
      \line \larger {
        Lagu: \caps { Julia Ward Howe }
      }
      \line \smaller {
        Judul Asli: \italic "Battle Hymn of the Republic"
      }
    }
  }
  pencipta-syair = \markup {
    \override #'(baseline-skip . 2.5)
    \left-column {
      \line {
        Syair (saduran):
      }
      \line \caps { A. Hari Kustono, Pr. }
    }
  }
  penata-suara = \markup { Aransemen: \caps { Henri Yulianto }}
  ekspresi-global = \markup { \bold { 1 = Bes, 4/4 } Dengan penuh semangat. }
  hak-cipta = "Hak cipta dipegang oleh masing-masing pencipta yang namanya tertera pada dokumen ini."
  instrumen = \markup\null
  dedication = ##f
}

\paper {
  page-breaking =
  #(if is-svg?
       ly:one-page-breaking
       ly:optimal-breaking)

  paper-width =
  #(if is-svg?
       (* 240 mm)
       (* 210 mm))
}

%% Override VARIABLES
CetakWatermark = #(not is-svg?)

\layout {
  \presentationPageLayoutForSVG
  \context {
    \Score
    \consists Metronome_mark_engraver
  }
}

\include "a4-satb.ily"