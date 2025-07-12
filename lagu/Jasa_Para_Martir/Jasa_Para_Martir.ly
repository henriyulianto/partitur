\version "2.25.26"

%#(define USE_OLD_VERSION? #t)
\include "solmisasi.ily"
%\withExtensions #'("simultaneous-divisi")

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include "Jasa_Para_Martir_ly_data.ily"

\header {
  judul = "Jasa Para Martir"
  sub-judul = ##f
  judul-header-I = "Jasa Para Martir"
  judul-header-II = ##f
  pencipta-lagu = \markup \caps { Oktavianus Debritta Pangayom W. }
  penata-suara = \markup {
    Aransemen: \caps { Henri Yulianto }
  }
  pencipta-syair = \markup {
    1 = F,
    \hspace #0.5 4/4, 3/4
    \hspace #0.5 \raise #0.5 \smaller\smaller \note {4} #UP = "86 &ndash; 90"
  }
  ekspresi-global = ##f
  hak-cipta = "&copyright; 2025 oleh Oktavianus Debritta Pangayom W."
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