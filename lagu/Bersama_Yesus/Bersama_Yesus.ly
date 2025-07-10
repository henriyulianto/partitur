\version "2.25.26"

%#(define USE_OLD_VERSION? #t)
\include "solmisasi.ily"
%\withExtensions #'("simultaneous-divisi")

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include #(ly:format "Bersama_Yesus_ly_main~a.ly"
                     (if is-svg? "_svg" ""))

\header {
  judul = "Bersama Yesus"
  sub-judul = "Untuk PS Campur SATB"
  judul-header-I = "Bersama Yesus"
  judul-header-II = "Untuk PS Campur SATB"
  pencipta-lagu = \markup {
    Lagu dan Syair: \caps { Grego Julius }
  }
  penata-suara = \markup {
    Aransemen: \caps { Henri Yulianto }
  }
  pencipta-syair = \markup {
    1 = D,
    \hspace #0.5 4/4,
    \hspace #0.5 \raise #0.5 \smaller\smaller \note {4} #UP = 112
  }
  ekspresi-global = \markup {
    \italic { Dengan hati gembira }
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
}

\include "a4-satb.ily"