\version "2.25.26"

%#(define USE_OLD_VERSION? #t)
\include "solmisasi.ily"
% \withExtensions #'("key-signature-summary"
%                     "time-signature-summary"
%                     "simultaneous-divisi"
%                     )

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Bunda_Maria_Doakan_Aku_ly_main.ly"

\header {
  judul = "Bunda Maria Doakan Aku"
  sub-judul = "Untuk PS Campur SATB"
  judul-header-I = "Bunda Maria Doakan Aku"
  judul-header-II = "Untuk PS Campur SATB"
  pencipta-lagu = \markup {
    Lagu dan Syair: \caps { Grego Julius }
  }
  penata-suara = \markup {
    Aransemen SATB: \caps { Chrisantyo Lucas }
  }
  pencipta-syair = \markup {
    1 = C,
    \hspace #0.5 4/4,
    \hspace #0.5 \raise #0.5 \smaller\smaller \note {4} #UP = 72
  }
  ekspresi-global = \markup {
    Aransemen Musik: \caps { Henri Yulianto }
  }
  hak-cipta = "&copyright; 2025 Grego Julius Music"
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
    %\override Beam.extra-offset = #'(0 . 0.2)
  }
}

\include "a4-satb.ily"