\version "2.25.26"

%#(define USE_OLD_VERSION? #t)
\include "solmisasi.ily"
%\withExtensions #'("simultaneous-divisi")

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Marilah_Kita_Puji_Tuhan_Alleluya_ly_data.ily"

\header {
  judul = "Marilah Kita Puji Tuhan, Alleluya!"
  sub-judul = "Untuk PS Campur (SATB) - A Cappella"
  judul-header-I = "Marilah Kita Puji Tuhan, Alleluya!"
  judul-header-II = "SATB - A Cappella"
  pencipta-lagu = "Lagu, syair, dan aransemen:"
  penata-suara = \markup \line {
    \caps { Henri Yulianto }
    (Rev. 2025)
  }
  pencipta-syair = \markup {
    1 = C, 1 = Es
    \hspace #0.5 3/4
    \hspace #0.5 \italic Vivace
    \concat { ( \raise #0.5 \smaller\smaller \note {4} #UP }
    = 140)
  }
  ekspresi-global = \markup \italic { Dengan riang, namun tegas }
  hak-cipta = "&copyright; 2017 Henri Yulianto"
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
}

\include "a4-satb.ily"