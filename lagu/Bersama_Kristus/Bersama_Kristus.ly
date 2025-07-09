\version "2.25.26"

%#(define USE_OLD_VERSION? #t)
\include "solmisasi.ily"
%\withExtensions #'("simultaneous-divisi")

\include "satb-solmisasi-init.ily"

%% MUSIC DATA
\include #(ly:format "Bersama_Kristus_ly_main~a.ly"
                     (if is-svg? "_svg" ""))

\header {
  judul = "Bersama Kristus"
  sub-judul = "Untuk PS Campur 2 Suara"
  judul-header-I = "Bersama Yesus"
  judul-header-II = "Untuk PS Campur 2 Suara"
  pencipta-lagu = \markup {
    Lagu, Syair, dan Aransemen:
  }
  penata-suara = \markup {
    \caps { Henri Yulianto }
  }
  pencipta-syair = \markup {
    1 = E,
    \hspace #0.5 4/4,
    \hspace #0.5 \raise #0.5 \smaller\smaller \note {4} #UP = 116
  }
  ekspresi-global = "(I: Perempuan; II: Laki-laki)"
  hak-cipta = "&copyright; 2011 Henri Yulianto | Lisensi Bebas Non-Komersial"
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