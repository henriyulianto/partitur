\version "2.25.26"
% -*- master: Tuhan_Maharahim.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #20
TwoVoicesPerStaff = ##f
CetakWatermark = ##f
AlwaysShortInstrumentName = ##t

Global = {
  <<
    \disallowLineBreak
    \disallowPageBreak
    \omit Score.TimeSignature
    \numericTimeSignature
    \omit KeySignature
    \key bes \major
    \once \override Score.MetronomeMark.X-offset = #1.5
    \tempo \markup {
      \concat {
        \rhythm { 8.[ 16] } " = " \rhythm { \tuplet 3/2 { 4 8 } }
        "  "
      }
    } 4 = 100
  >>
  %\set Score.currentBarNumber = #0
  %\partial 4 s4
  %\tag #'midi { \partial 16 s16 }
  %\set Score.currentBarNumber = #1

  %\undo \omit Score.TimeSignature
  %   \once \hide Score.TimeSignature
  %   %\time 4/4
  %   %\partial 4
  %   s4
  %   s1
  %   s1
  %   s1*7
  %   s2. \bar "|."
}

SopranoMusic = {
  % \set Staff.instrumentName = #"S/T"
  %   \set Staff.shortInstrumentName = #"S/T"
  \numericTimeSignature
  \key bes \major
  \set Score.currentBarNumber = 0
  \time 1/4
  r8^\markup "(Bisa diganti duet T+B, atau ST+AB)"
  \set stemRightBeamCount = #2
  r16 f''16 |
  \time 4/4
  f''8.  f''16  f''8.  ees''16  d''8.
  f''16  bes''8.  c'''16 | % 3
  d'''8.  d'''16  d'''8.  c'''16
  bes''4 \break
  bes''8.  a''16 | % 4
  g''8.  g''16  g''8.  a''16  bes''8.
  a''16  bes''8.  g''16 | % 5
  f''8.  g''16  f''8.  d''16  f''4
  \break
  r8
  \set stemRightBeamCount = #2
  r16 f''16 | % 6
  f''8.  f''16  f''8.  ees''16  d''8.
  f''16  bes''8.  c'''16 | % 7
  d'''8.  d'''16  d'''8.  c'''16
  bes''4 \break
  \pseudoIndents \markuplist {
    \with-dimension #X #'(0 . 2.9)
    \center-align "S"
    \with-dimension #X #'(0 . 2.9)
    \center-align "A"
    \with-dimension #X #'(0 . 2.9)
    \center-align "T"
    \with-dimension #X #'(0 . 2.9)
    \center-align "B"
  } 0 35
  bes''4 | % 8
  c'''4  c'''4  bes''4  a''4 | % 9
  %\omit Tie
  bes''2. r4 \bar "||" \break
  f''4..  ees''16  d''8.  f''16  bes''8.
  c'''16 | % 11
  d'''2  bes''2 | % 12
  g''4..  a''16  bes''8.  a''16  bes''8.
  g''16 | % 13
  f''2  d''2 | % 14
  \break
  f''4..  ees''16  d''8.  f''16  bes''8.
  c'''16 | % 15
  d'''2  bes''4  bes''4 | % 16
  c'''4  c'''4  bes''4  a''4 | % 17
  bes''2. \bar "|."
}

AltoMusic = {
  \numericTimeSignature
  \key bes \major
  r8 \set stemRightBeamCount = #2
  r16 d''16 | % 2
  d''8.  d''16  d''8.  c''16  bes'8.
  c''16  d''8.  ees''16 | % 3
  f''8.  f''16  f''8.  ees''16  d''4
  d''8.  d''16 | % 4
  ees''8.  ees''16  ees''8.  f''16  g''8.
  f''16  g''8.  ees''16 | % 5
  d''8.  ees''16  d''8.  bes'16  d''4 r8
  \set stemRightBeamCount = #2 r16
  d''16 | % 6
  d''8.  d''16  d''8.  c''16  bes'8.
  c''16  d''8.  ees''16 | % 7
  f''8.  f''16  f''8.  ees''16
  d''4 f''4 | % 8
  g''4  g''4  f''4  ees''4 | % 9
  %\omit Tie
  d''2. r4 \bar "||"
  d''4..  c''16  bes'8.  c''16  d''8.
  ees''16 | % 11
  f''2  d''2 | % 12
  ees''4..  f''16  g''8.  f''16  g''8.
  ees''16 | % 13
  d''2  bes'2 | % 14
  c''4..  c''16  bes'8.  c''16  d''8.
  d''16 | % 15
  e''4 (  fis''4 )  g''4  f''4 | % 16
  g''4  g''4  f''4  ees''4 | % 17
  d''2. \bar "|."
}

TenorMusic = {
  \numericTimeSignature
  \key bes \major
  s4
  s1*5
  s2.
  d''4 | % 8
  ees''4  ees''4  d''4  c''4 | % 9
  bes'2. r4 \bar "||"
  bes'4..  bes'16  f'8.  f'16  f'8.
  f'16 | % 11
  bes'2  f'2 | % 12
  bes'4..  c''16  bes'8.  a'16
  bes'8.  c''16 | % 13
  bes'2  f'2 | % 14
  f'4..  f'16  f'8.  f'16  f'8.
  f'16 | % 15
  g'4 (  a'4 )  bes'4  d''4 | % 16
  ees''4  ees''4  d''4  c''4 | % 17
  bes'2. \bar "|."
}

BassMusic = {
  \numericTimeSignature
  \key bes \major
  s4
  s1*5
  s2.
  d'4 | % 8
  ees'8. (  d'16 )  c'4  f'4  f'4
  | % 9
  bes2. r4 \bar "||"
  bes4..  bes16  f'8.  ees'16  d'8.
  c'16 | % 11
  bes2  d'2 | % 12
  ees'4..  ees'16  ees'8.  ees'16
  d'8.  c'16 | % 13
  bes2  bes2 | % 14
  a4..  a16  bes8.  bes16  bes8.
  bes16 | % 15
  a4 (  d'4 )  g'4  d'4 | % 16
  ees'8. (  d'16 )  c'4  f'4  f'4
  | % 17
  bes2. \bar "|."
}

RefLyrics = \lyricmode {
  Glo -- ry, glo -- ry, ha -- le -- lu -- ya!
  Ma -- ha -- ra -- him Tu -- han ki -- ta.
  Glo -- ry, glo -- ry, ha -- le -- lu -- ya!
  Pu -- ji -- lah na -- ma -- Nya! __
}

AltoLyricsOne = \lyricmode {
  \set stanza = "1. "
  Tu -- han Ma -- ha -- ra -- him,
  ka -- sih -- Mu ba -- gai sa -- mu -- dra.
  Sa -- lib tan -- da ke -- me -- nang -- an
  ka -- lah -- kan kua -- sa do -- sa.
  Da -- rah ser -- ta a -- ir
  meng -- a -- lir da -- ri lam -- bung -- Mu,
}

AltoLyricsTwo = \lyricmode {
  \set stanza = "2. "
  Ki -- ni u -- mat -- Mu ber -- se -- rah
  pa -- da -- Mu, ya Tu -- han
  da -- lam me -- war -- ta -- kan
  ke -- ra -- him -- an -- Mu yang a -- ba -- di.
  A -- gar ja -- ngan sam -- pai
  ja -- tuh di da -- lam go -- da -- an,
}

BassLyricsOne = \lyricmode {
  \syairDiKiri Ye -- sus an -- dal -- an -- ku. __
  \RefLyrics
}

BassLyricsTwo =  \lyricmode {
  \syairDiKiri bim -- bing lang -- kah ka -- mi. __
  %\RefLyrics
}

SopranoMidiInstrument = "flute"
AltoMidiInstrument = "oboe"
TenorMidiInstrument = "clarinet"
BassMidiInstrument = "bassoon"
