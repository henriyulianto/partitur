\version "2.25.26"

\include "solmisasi.ily"
% \withExtensions #'("key-signature-summary"
%                     "time-signature-summary"
%                     "simultaneous-divisi"
%                     )

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Puji_dan_Syukur_ly_main.ly"

\header {
  judul = "Puji dan Syukur"
  sub-judul = "Himne PNUKI (1984)"
  judul-header-I = "Puji dan Syukur"
  judul-header-II = "Untuk PS Campur SATB"
  pencipta-lagu = \markup {
    Lagu dan Syair: \caps { Binsar Sitompul }
  }
  penata-suara = \markup {
    Aransemen: \caps { Frans Haryadi }
  }
  pencipta-syair = \markup \bold { 1 = Es, 4/4 }
  ekspresi-global = \markup {
    \concat {
      \bold \italic "Andante moderato"
      ","
    }
    tegak bersungguh-sungguh.
  }
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
PianoMusic = ##f

\layout {
  \presentationPageLayoutForSVG
  \context {
    \Score
    \consists Metronome_mark_engraver
  }
  \context {
    \SolmisasiVoice
    \override Beam.extra-offset = #'(0 . 0.2)
  }
}

\include "a4-satb.ily"