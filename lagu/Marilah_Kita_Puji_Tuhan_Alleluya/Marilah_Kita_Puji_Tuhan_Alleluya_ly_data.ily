\version "2.25.26"
% -*- master: Marilah_Kita_Puji_Tuhan_Alleluya.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #(* 20 (/ 6.65 7))
SolmisasiStaffSize = #(* 20 (/ 6.65 7))
TwoVoicesPerStaff = ##f
AlwaysShortInstrumentName = ##t
UnfoldBarNumbers = ##f
UnfoldRepeatsForSVG = ##t

\defineBarLine "|-S" #'(#t #f #t)
\defineBarLine "|" #'(#t #f "!")
\defineBarLine "||-A" #'(#t #f #t)

Global = {
  \omit Score.TimeSignature
  \once\omit Score.BarNumber
  \override Score.BarNumber.extra-offset = #'(-1 . 0)
  %\override Staff.KeySignature.font-size = #-1
  #(if (not is-svg?) #{ \disallowPageBreak #})
  \disallowLineBreak
  \numericTimeSignature
  \omit Score.MetronomeMark \tempo 4=140
  \time 3/4
  \key c \major
  \boxedAlphabetMark #LEFT "Pembuka"
  \after 2.*6 { \bar "|-S" \break } s2.*12 \bar "||" \break |%12
  \boxedAlphabetMark #LEFT "Bait 1"
  \after 2.*7 { \bar "|-S" \pageBreak } s2.*16 \bar "||" \break |%28
  \boxedAlphabetMark #LEFT "Bait 2"
  \after 2.*6 { \bar "|-S" \break }
  \after 2.*11 { \bar "|-S" \break } s2.*15 s4 \bar "!" \pageBreak
  \boxedAlphabetMark #LEFT "Refrain 1"
  s2 |%44
  \after 2.*6 { \bar "|-S" \break }
  \after 2.*10 { \bar "|-S" \break } s2.*15 \bar "||" \pageBreak |%44
  \key ees \major  |%59
  \boxedAlphabetMark #LEFT "Selingan"
  \after 2.*7 { \bar "|-S" \break }
  \after 2.*14 { \bar "|-S" \break }
  s2.*18 \bar "||"
  \key c \major  |%77
  s2.*3 s4 \bar "!" \pageBreak
  \boxedAlphabetMark #LEFT  "Refrain 2"
  s2 |%81
  \after 2.*6 { \bar "|-S" \break }
  \after 2.*12 { \bar "|-S" \break }
  s2.*15 \bar "||" |%96
  \boxedAlphabetMark #LEFT "Penutup"
  \after 2.*3 { \bar "|-S" \break }
  s2.*8  |%104
  \tempo 4=98
  \once\override TextSpanner.bound-details.left.text = \markup \bold "molto rit."
  s2.\startTextSpan  |%105
  s2 s4\stopTextSpan \bar "|." |%106
}

SopranoMusic = {
  c''8\f b'8 g'4. e'8  |%1
  f'8( e'8) f'8( g'8) a'8( b'8)  |%2
  c''8 b'8 g'4. e'8  |%3
  f'8( e'8) f'8( g'8) a'8( b'8)  |%4
  c''8 b'8 g'4 g'4  |%5
  d''8 c''8 g'4 g'4  |%6
  e''8 d''8 g'4 g'4  |%7
  f''8 e''8 d''8 c''8 b'8 a'8  |%8
  g'4 c''2  |%9
  g'4 d''4 b'4  |%10
  c''2.( |%11
  c''2 ) r4  \break |%12
  c''8-\tweak self-alignment-X #0.5
  ^\dynamicText \markup {
    \put-adjacent #X #LEFT \dynamic mf \raise #-1.5 \larger\bold " cf "
  } b'8 g'4. e'8  |%13
  f'4 g'4 a'4  |%14
  g'8( c'8) c'2 ( |%15
  c'2 ) r4  |%16
  c''8 b'8 g'4. e'8  |%17
  f'4 g'4 a'4  |%18
  g'2.  |%19
  r4 f'4 g'4  |%20
  a'4. b'8 c''4  |%21
  b'4. c''8 d''4  |%22
  g'4 d''4 b'4  |%23
  c''2 e''4  |%24
  e''4. d''8 c''8 b'8  |%25
  a'4 b'4 c''4  |%26
  g'2.(  |%27
  g'2 ) r4  |%28
  r4 e'8 d'8 e'4  |%29
  a'4 g'4 f'4  |%30
  g'4 f'4 e'4  |%31
  a'8( g'8) f'4 g'4  |%32
  e'4 e'8 f'8 g'4  |%33
  a'4( b'4) c''4  |%34
  c''4 d''8 c''8 b'8( a'8)  |%35
  g'2.  |%36
  a'8( b'8 c''2)  |%37
  d''8( e''8 f''8 e''8 d''8 c''8)  |%38
  b'2( d''4  |%39
  c''2)
  e''4-\tweak self-alignment-X #0.5
  ^\dynamicText \markup {
    \put-adjacent #X #LEFT \transparent \dynamic ff \raise #-2 \larger\bold " cf"
  }  |%40
  e''4. d''8 c''8 b'8  |%41
  a'2 e''4  |%42
  e''4 d''4 c''4  |%43
  d''4 \breathe c''4\< d''4  |%44
  e''4\f\! g'4 e''4  |%45
  d''2 b'4  |%46
  c''4 e'4 c''4  |%47
  b'2 g'4  |%48
  a'4 b'4 c''4  |%49
  g'4 c''4 c''8 c''8  |%50
  c''4 b'4 c''4  |%51
  d''4 \breathe c''4 d''4  |%52
  e''4 g'4 e''4  |%53
  d''2 b'4  |%54
  c''4 e'4 c''4  |%55
  b'2 g'4  |%56
  a'4 b'4 c''4  |%57
  g'4( c''4) e''4  |%58
  e''2\>( d''4)
  \key ees \major  |%59
  c''2.\mp\>\! (  |%60
  c''2.)(  |%61
  c''2.)(  |%62
  c''2) \pp\! r4  |%63
  f'4\mp( aes'4 bes'4  |%64
  c''2 d''4  |%65
  d''2.  |%66
  c''2) c''4\mf  |%67
  c''4 bes'4 aes'4  |%68
  aes'4 g'4 f'4  |%69
  g'2.(  |%70
  g'2 ) c''8\<( d''8)  |%71
  ees''4\! d''4\> c''4~  |%72
  c''4\! r4 c''8\<( d''8)  |%73
  ees''4\! d''4\> c''4~  |%74
  c''4\! r4 c''8\f( d''8)  |%75
  ees''4 d''4 c''4  |%76
  ees''4 d''4 c''4
  \key c \major  |%77
  d''2.  |%78
  d''4 cis''4 d''4  |%79
  g''2.(  |%80
  g''4 ) \breathe c''4 d''4   |%81
  e''4 g'4 e''4  |%82
  d''2 b'4  |%83
  c''4 e'4 c''4  |%84
  b'2 g'4  |%85
  a'4 b'4 c''4  |%86
  g'4 c''4 c''8 c''8  |%87
  c''4 b'4 c''4  |%88
  d''4 \breathe c''4 d''4  |%89
  e''4 g'4 e''4  |%90
  d''2 b'4  |%91
  c''4 e'4 c''4  |%92
  b'2 g'4  |%93
  a'4 b'4 c''4  |%94
  g'4( c''4) e''4  |%95
  e''4 d''4.. r16   |%96
  c''8 b'8 g'4. e'8  |%97
  f'8( e'8) f'8( g'8) a'8( b'8)  |%98
  c''8 b'8 g'4. e'8  |%99
  f'8( e'8) f'8( g'8) a'8( b'8)  |%100
  c''8 b'8 g'4. e'8  |%101
  f'4( g'4) d''4  |%102
  c''2.(  |%103
  c''2. ) |%104
  \override Script.Y-offset = #2
  c''4-> c''4-> c''4->  |%105
  <c'' g''>2.  |%106
}

AltoMusic = {
  r8 c'8\f d'8 e'8 c'4  |%1
  d'8 c'8 d'8( e'8) f'4  |%2
  r8 c'8 d'8 e'8 c'4  |%3
  d'8 c'8 d'8( e'8) f'4  |%4
  c'8( d'8) e'2  |%5
  d'8( e'8) f'2  |%6
  g'8( f'8) e'4 e'4  |%7
  a'8 g'8 f'8 e'8 d'8 c'8  |%8
  e'4.( f'8) e'4  |%9
  g'4 fis'4 f'4  |%10
  e'4 f'8 e'8 d'4  |%11
  e'2 r4  |%12
  e'8\mf d'8 e'4. c'8  |%13
  c'4 c'4 f'4  |%14
  e'8( d'8) c'4 c'8 b8  |%15
  a4 c'4 r4  |%16
  e'8 d'8 e'4. c'8  |%17
  c'4 c'4 c'4  |%18
  a4 a8 b8 c'4  |%19
  d'2.  |%20
  c'2.(  |%21
  d'2.)  |%22
  d'2.(  |%23
  e'2.)  |%24
  e'4 d'4 c'4  |%25
  c'4 d'4 e'4  |%26
  e'4( c'4) cis'4  |%27
  d'2 r4  |%28
  r4 c'8 b8 c'4  |%29
  f'4 e'4 d'4  |%30
  e'4 d'4 c'4  |%31
  f'8( e'8) d'4 b4  |%32
  c'4 c'8 d'8 e'4  |%33
  d'4( e'4) fis'4  |%34
  g'4 f'8( e'8) d'8( c'8)  |%35
  b4 bes2  |%36
  f'8( g'8 a'2)  |%37
  f'8( g'8 a'8 g'8 f'8 e'8)  |%38
  d'4( g'2)  |%39
  e'8 g'8 a'4 a'4  |%40
  a'8 g'8 fis'2  |%41
  a'8 g'8 fis'4 g'4  |%42
  fis'4 fis'4 fis'4  |%43
  f'4 r2  |%44
  e'8\f( f'8) g'2  |%45
  d'8 e'8 f'2  |%46
  c'8 d'8 e'4 a'4  |%47
  g'4 g'8 f'8 e'4  |%48
  c'2.  |%49
  g'4. f'8 e'4  |%50
  fis'4 fis'8 g'8 a'4  |%51
  g'4 \breathe e'4 f'4  |%52
  g'4 e'4 a'4  |%53
  g'2 d'4  |%54
  e'4 c'4 f'4  |%55
  e'4 e'8 d'8 c'4  |%56
  c'4 f'8 e'8 d'4  |%57
  e'4 e'8 f'8 g'4  |%58
  fis'4\>( f'2) \key ees \major  |%59
  \once \override TextSpanner.bound-details.left.text =
  \markup { \dynamic p "cresc. poco a poco" }
  \once \override TextSpanner.bound-details.left-broken.text = "(cresc.)"
  \once \override TextSpanner.bound-details.right.padding = #2.2
  f'8\startTextSpan \! g'8 aes'8( bes'8) aes'4  |%60
  f'8 g'8 aes'8( bes'8) aes'4  |%61
  e'8 f'8 g'8( aes'8) g'4  |%62
  e'8 f'8 g'8( aes'8) g'4  |%63
  f'8 g'8 aes'8( bes'8) aes'4  |%64
  f'8 g'8 aes'8( bes'8) aes'4  |%65
  e'8 f'8 g'8( aes'8) g'4  |%66
  e'8 f'8 g'8( aes'8) g'4  |%67
  f'8\stopTextSpan\mf g'8 aes'8( bes'8) aes'4  |%68
  f'8 g'8 aes'8( bes'8) aes'4  |%69
  e'8 f'8 g'8( aes'8) g'4  |%70
  e'8 f'8 g'8( aes'8) g'4  |%71
  f'8 g'8 aes'8( bes'8) aes'4  |%72
  f'8 g'8 aes'8( bes'8) aes'4  |%73
  f'8 g'8 aes'8( bes'8) aes'4  |%74
  f'8 g'8 aes'8\<( bes'8) aes'4  |%75
  f'8\f\! g'8 aes'8( bes'8) aes'4  |%76
  f'8 g'8 aes'8( bes'8) aes'8( g'8) \key c \major  |%77
  f'4 f'4 g'4  |%78
  fis'4 fis'8 g'8 a'4  |%79
  a'4 a'8 g'8 f'4  |%80
  g'4 r4 r4  |%81
  r4 e'8 f'8 g'8 a'8  |%82
  b'4 gis'2  |%83
  r4 c'8 d'8 e'8 f'8  |%84
  g'4 e'2  |%85
  r4 a'8 g'8 f'4  |%86
  g'4 g'8 f'8 e'4  |%87
  fis'4 fis'8 g'8 a'4  |%88
  g'4 \breathe e'4 f'4  |%89
  g'4 e'4 a'4  |%90
  g'2 d'4  |%91
  e'4 c'4 f'4  |%92
  e'4 e'8 d'8 c'4  |%93
  c'4 f'8 e'8 d'4  |%94
  e'4 e'8 f'8 g'4  |%95
  fis'4( f'4..) r16  |%96
  r8 c'8 d'8 e'8 c'4  |%97
  d'8 c'8 d'8( e'8) f'4  |%98
  r8 c'8 d'8 e'8 c'4  |%99
  d'8 c'8 d'8( e'8) f'4  |%100
  r8 c'8 d'8 e'8 c'4  |%101
  r8 c'8 d'8 e'8 f'4  |%102
  g'4 g'8 g'8 g'4  |%103
  fis'4 fis'8 fis'8 fis'4  |%104
  \override Script.Y-offset = #1.5
  g'4-> g'4-> f'4->  |%105
  e'2.  |%106
}

TenorMusic = {
  r4 c'8-\tweak X-offset #-1.5 -\tweak Y-offset #-1.5 \f( b8 g4)  |%1
  a4 a4 g4  |%2
  r4 c'8( b8 g4)  |%3
  a4 a4 g4  |%4
  r4 c'8 b8 c'4  |%5
  a4 d'8 c'8 d'4  |%6
  b4 e'8 d'8 e'4  |%7
  c'4 a8 g8 f4  |%8
  g4 a8 b8 c'4  |%9
  g4 a4 a4  |%10
  g4 a8 g8 f4  |%11
  g2 r4  |%12
  g4-\tweak Y-offset #-1 \mf g2  |%13
  a4 a2  |%14
  g4 g4 g4  |%15
  a4 g4 f4  |%16
  g4 g2  |%17
  a4 a4 a8( g8)  |%18
  f4 g4 a4  |%19
  b2.  |%20
  a2.(  |%21
  b2.)  |%22
  b2.(  |%23
  c'2.)  |%24
  a4 g4 fis4  |%25
  fis4 g4 a4  |%26
  c'4( a4) bes4  |%27
  b2 r4  |%28
  c'8-\tweak self-alignment-X #0.5
  ^\dynamicText \markup {
    \put-adjacent #X #LEFT \transparent \dynamic mf \raise #-1.5 \larger\bold " cf"
  } b8 g4. e8  |%29
  f4 g4 a4  |%30
  g8( c8) c2 (  |%31
  c2 ) r4  |%32
  c'8 b8 g4. e8  |%33
  f4 g4 a4  |%34
  g2.  |%35
  r4 f4 g4  |%36
  a4. b8 c'4  |%37
  b4. c'8 d'4  |%38
  g4 d'4 b4  |%39
  c'2 e'4  |%40
  e'4. d'8 c'8 b8  |%41
  a2 a8( b8)  |%42
  c'4 b4 a4  |%43
  b4 r2  |%44
  g4\f e'2  |%45
  g8 g8 d'2  |%46
  a8 b8 c'4 d'4  |%47
  e'2.  |%48
  f'4. e'8 d'4  |%49
  e'2.  |%50
  d'4. a8 c'4  |%51
  b8 a8 g4 f4  |%52
  e8 f8 g4 c'4  |%53
  b4 b4 g4  |%54
  c'4 b4 a4  |%55
  g2 g8 g8  |%56
  a4 f'4 a8 a8  |%57
  g4 e'4 c'8 c'8  |%58
  c'4\> b2 \key ees \major  |%59
  \once \override TextSpanner.bound-details.left.text =
  \markup { \dynamic p "cresc. poco a poco" }
  \once \override TextSpanner.bound-details.left-broken.text = "(cresc.)"
  \once \override TextSpanner.bound-details.right.padding = #2.2
  aes8\startTextSpan\! bes8 c'8( d'8) ees'4  |%60
  aes8 bes8 c'8( d'8) ees'4  |%61
  c'8 d'8 e'8( f'8) e'4  |%62
  c'8 d'8 e'8( f'8) e'4  |%63
  aes8 bes8 c'8( d'8) ees'4  |%64
  aes8 bes8 c'8( d'8) ees'4  |%65
  c'8 d'8 e'8( f'8) e'4  |%66
  c'8 d'8 e'8( f'8) e'4 |%67
  aes8\stopTextSpan\mf bes8 c'8( d'8) ees'4  |%68
  aes8 bes8 c'8( d'8) ees'4  |%69
  c'8 d'8 e'8( f'8) e'4  |%70
  c'8 d'8 e'8( f'8) e'4  |%71
  aes8 bes8 c'8( d'8) ees'4  |%72
  aes8 bes8 c'8( d'8) ees'4  |%73
  aes8 bes8 c'8( d'8) ees'4  |%74
  aes8 bes8 c'8\<( d'8) ees'4  |%75
  aes8\f\! bes8 c'8( d'8) ees'4  |%76
  aes8 bes8 c'8( d'8) ees'8( d'8) \key c \major  |%77
  c'4 c'4 c'4  |%78
  c'4 a8 b8 c'4  |%79
  c'4 c'8 b8 a4  |%80
  b4 r4 r4  |%81
  r4 g8 a8 b8 c'8  |%82
  d'8( e'8) d'2  |%83
  r4 e8 f8 g8 a8  |%84
  b8( c'8) b2  |%85
  f'4. e'8 d'4  |%49
  e'2.  |%50
  d'4. a8 c'4  |%51
  b8 a8 g4 f4  |%52
  r4 e8 f8 g8 a8  |%90
  b4 c'4 d'4  |%91
  c'4 b4 a4  |%92
  g2 g8 g8  |%93
  a4 f'4 a8 a8  |%94
  g4 e'4 c'8 c'8  |%95
  c'4 b4.. r16  |%96
  r4 c'8( b8 g4)  |%97
  a4 a4 g4  |%98
  r4 c'8( b8 g4)  |%99
  a4 a4 g4  |%100
  r4 c'8( b8 g4)  |%101
  a4( g4) d'4  |%102
  ees'4 ees'8 ees'8 ees'4  |%103
  d'4 d'8 d'8 d'4  |%104
  \override Script.Y-offset = #2
  f'4-> ees'4-> d'4->  |%105
  <c' d'>2.  |%106
}

BassMusic = {
  c4-\tweak Y-offset #-1 \f c8 c8 d8 e8  |%1
  f4 d4 g,4  |%2
  c4 c8 c8 d8 e8  |%3
  f4 d4 g,4  |%4
  c4 c2  |%5
  d4 d2  |%6
  e4 e2  |%7
  f4 f2  |%8
  g4 g,4 g,4  |%9
  g4 g,4 g,4  |%10
  c4 c8 c8 c4  |%11
  c2 r4  |%12
  c4-\tweak Y-offset #-1 \mf c2  |%13
  c4 c2  |%14
  c4 c4 e4  |%15
  f4 e4 d4  |%16
  c4 c2  |%17
  f4 f2  |%18
  d2 d4  |%19
  g2.  |%20
  f2.(  |%21
  f2. ) |%22
  e2.(  |%23
  a2 g4)  |%24
  fis4 e4 d4  |%25
  d4 e4 fis4  |%26
  g2 g4  |%27
  g2 r4  |%28
  c'8 b8 g4. e8  |%29
  f4 g4 a4  |%30
  g8( c8) c2 (  |%31
  c2 ) r4  |%32
  c'8 b8 g4. e8  |%33
  f4 g4 a4  |%34
  g2.  |%35
  r4 d4 e4  |%36
  f4. f8 f4  |%37
  f4. f8 f4  |%38
  e4. e8 e4  |%39
  a2( g4)  |%40
  fis8 e8 d2  |%41
  fis8 e8 d4 c4  |%42
  d4 d4 d4  |%43
  g4 r4 g,4  |%44
  c4\f c4 c4  |%45
  b,4 b,2  |%46
  a,4 a,4 a4  |%47
  g4 g2  |%48
  f4 f2  |%49
  e4 e2  |%50
  d8 d8 e4 fis4  |%51
  g8 f8 e4 d4  |%52
  c8 d8 e4 f4  |%53
  g4 g4 e4  |%54
  a,4 c4 d4  |%55
  e4. g8 f8 e8  |%56
  f4. f8 e8 d8  |%57
  e4. e8 d8 c8  |%58
  d4\>( g2) \key ees \major  |%59
  \once \override TextSpanner.bound-details.left.text =
  \markup { \dynamic p "cresc. poco a poco" }
  \once \override TextSpanner.bound-details.left-broken.text = "(cresc.)"
  \once \override TextSpanner.bound-details.right.padding = #2.2
  c4\startTextSpan \! c8 c8 f4  |%60
  c4 c8 c8 f4  |%61
  g4 c8 c8 c4  |%62
  g4 c8 c8 c4  |%63
  c4 c8 c8 f4  |%64
  c4 c8 c8 f4  |%65
  g4 c8 c8 c4  |%66
  g4 c8 c8 c4  |%67
  c4\stopTextSpan\mf c8 c8 f4  |%68
  c4 c8 c8 f4  |%69
  g4 c8 c8 c4  |%70
  g4 c8 c8 c4  |%71
  c4 c8 c8 f4  |%72
  c4 c8 c8 f4  |%73
  c4 c8 c8 f4  |%74
  c4 c8\< c8 f4  |%75
  c4\f\! c8 c8 f4  |%76
  c4 c8 c8 f8( ees8) \key c \major  |%77
  d4 d4 d4  |%78
  d4 e8 e8 fis4  |%79
  g4 f8 e8 d4  |%80
  g,4 r4 r4  |%81
  r4 c8 d8 e8 f8  |%82
  g8( a8) b2  |%83
  r4 a,8 b,8 c8 d8  |%84
  e8( fis8) g2  |%85
  f4 f2  |%49
  e4 e2  |%50
  d8 d8 e4 fis4  |%51
  g8 f8 e4 d4  |%52
  r4 c8 d8 e8 f8  |%90
  g4 g4 gis4  |%91
  a4 g4 f4  |%92
  e4. g8 f8 e8  |%93
  f4. f8 e8 d8  |%94
  e4. e8 d8 c8  |%95
  d4( g4..) r16  |%96
  c4 c8 c8 d8 e8  |%97
  f4 d4 g,4  |%98
  c4 c8 c8 d8 e8  |%99
  f4 d4 g,4  |%100
  c4 c8 c8 d8 e8  |%101
  f4 f8 d8 g,4  |%102
  c4 c8 c8 c4  |%103
  c4 c8 c8 c4  |%104
  \override Script.Y-offset = #2
  c'4-> c'4-> g4->  |%105
  c2.  |%106
}

%% LYRICS

SopranoLyrics = \lyricmode {
  Al -- le -- lu, al -- le -- lu -- ya!
  Al -- le -- lu, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu -- ya, al -- le -- lu -- ya! __
  Ma -- ri -- lah ki -- ta pu -- ji Tu -- han, __
  ber -- maz -- mur ba -- gi na -- ma -- Nya; __
  ma -- "dah-" kan syu -- kur pu -- ji -- an: "\"Al" -- le -- lu -- "ya!\""
  a -- tas ber -- kat dan ka -- ru -- nia -- Nya. __
  Nya -- nyi -- kan de -- ngan ri -- ang ri -- a su -- ka -- ci -- ta
  ber -- sa -- ma u -- mat -- \syairDiKiri Nya, al -- le -- lu -- ya; __
  aa __ aa __ aa __
  ma -- syhur -- kan na -- ma -- Nya de -- ngan gem -- bi -- ra.
  Syu -- kur dan pu -- ji -- an
  ka -- mi lam -- bung -- kan,
  pu -- ji na -- ma Tu -- han
  yang a -- gung mu -- li -- a.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya! __
  Ha __ al -- le -- lu -- ya al -- le -- lu -- ya __
  al -- le -- lu -- ya __ al -- le -- lu -- ya __
  al -- le -- lu -- ya al -- le -- lu -- ya
  al -- le -- lu -- ya! __
  Syu -- kur dan pu -- ji -- an
  ka -- mi lam -- bung -- kan,
  pu -- ji na -- ma Tu -- han
  yang "a-" gung mu -- li -- a.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya!
  Al -- le -- lu, al -- le -- lu -- ya!
  Al -- le -- lu, al -- le -- lu -- ya! __
  Al -- le -- lu, al -- le -- lu -- ya! __
  AL -- LE -- LU -- YA!
}

AltoLyrics = \lyricmode {
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu,
  al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu -- ya, al -- le -- lu -- ya!
  Ma -- ri -- lah ki -- ta pu -- ji Tu -- han, al -- le -- lu -- ya,
  ber -- maz -- mur ba -- gi na -- ma -- Nya, al -- le -- lu -- ya;
  ha __ ha __ a -- tas ber -- kat dan ka -- ru -- nia -- Nya.
  Nya -- nyi -- kan de -- ngan ri -- ang ri -- a su -- ka -- ci -- ta
  ber -- sa -- ma u -- mat -- \syairDiKiri  Nya, al -- le -- lu -- ya; __
  aa __ aa __ aa __ sang -- ka -- ka -- la,
  ma -- syhur -- kan na -- ma -- Nya de -- ngan gem -- bi -- ra.
  Syu -- kur pu -- ji -- an
  ka -- mi lam -- bung -- kan,
  al -- le -- lu -- ya __ al -- le -- lu -- ya al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya! __
  Al -- le -- lu -- ya
  \repeat unfold 19 {
    al -- le -- lu -- ya
  }
  al -- le -- lu -- ya!
  Syu -- kur dan pu -- ji -- an
  'kan ka -- mi lam -- bung -- kan,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya! __
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  AL -- LE -- LU -- YA!
}

TenorLyrics = \lyricmode {
  Al -- le -- lu -- ya! Al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu -- ya, al -- le -- lu,
  al -- le -- lu -- ya, al -- le -- lu -- ya, al -- le -- lu -- ya!
  Ma -- ri pu -- ji \syairDiKiri  Tu -- han, al -- le -- lu -- ya,
  al -- le -- lu -- ya, ba -- gi na -- ma -- Nya;
  ha __ ha __ a -- tas ber -- kat dan ka -- ru -- nia -- Nya.
  Nya -- nyi -- kan de -- ngan su -- ka -- ci -- ta __
  ber -- sa -- ma s'lu -- ruh u -- mat -- Nya, __
  ta -- buh -- lah gen -- de -- rang, ti -- up sang -- ka -- ka -- la,
  ma -- syhur -- kan na -- ma -- Nya de -- ngan gem -- bi -- ra.
  Syu -- kur pu -- ji -- an
  ka -- mi lam -- bung -- kan,
  al -- le -- lu -- ya __ al -- le -- lu, al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya!
  Al -- le -- lu -- ya
  \repeat unfold 19 {
    al -- le -- lu -- ya
  }
  al -- le -- lu -- ya!
  Syu -- kur dan pu -- ji -- an
  'kan ka -- mi lam -- bung -- kan,
  al -- le -- lu -- ya __ al -- le -- lu, al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya!
  Al -- le -- lu -- ya! Al -- le -- lu -- ya!
  Al -- le -- lu -- ya!
  Al -- le -- lu -- ya!
  al -- le -- lu, AL -- LE -- LU -- YA!
}

BassLyrics = \lyricmode {
  Ya! Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu!
  Al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu, al -- le -- lu -- ya, al -- le -- lu -- ya!
  Ma -- ri pu -- ji \syairDiKiri Tu -- han, al -- le -- lu -- ya,
  al -- le -- lu -- ya, ba -- gi -- Nya;
  ha __ ha __ a -- tas ber -- kat dan ka -- ru -- nia -- Nya.
  Nya -- nyi -- kan de -- ngan su -- ka -- ci -- ta __
  ber -- sa -- ma s'lu -- ruh u -- mat -- Nya, __
  ta -- buh -- lah gen -- de -- rang, ti -- up sang -- ka -- ka -- la, __
  ma -- syhur -- kan na -- ma -- Nya de -- ngan gem -- bi -- ra.
  Syu -- kur dan pu -- ji -- an
  ka -- mi lam -- bung -- kan,
  pu -- ji Tu -- han al -- le -- lu -- ya al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya! __
  Al -- le -- lu -- ya
  \repeat unfold 19 {
    al -- le -- lu -- ya
  }
  al -- le -- lu -- ya!
  Syu -- kur dan pu -- ji -- an
  'kan ka -- mi lam -- bung -- kan,
  pu -- ji Tu -- han al -- le -- lu -- ya al -- le -- lu -- ya.
  S'lu -- ruh i -- si du -- nia
  su -- jud me -- nyem -- bah,
  al -- le -- lu -- ya al -- le -- lu -- ya al -- le -- lu -- ya! __
  Ya! Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya!
  Al -- le -- lu -- ya, al -- le -- lu -- ya,
  al -- le -- lu -- ya, al -- le -- lu -- ya!
  AL -- LE -- LU -- YA!
}

%% MIDI
SopranoMidiInstrument = #"flute"
AltoMidiInstrument    = #"clarinet"
TenorMidiInstrument   = #"oboe"
BassMidiInstrument    = #"bassoon"
WomenMidiInstrument   = #"trumpet"
MenMidiInstrument     = #"trombone"
IntroMidiInstrument   = #"banjo"
PianoMidiInstrument   = #"church organ"

\paper {
  IndentSolmisasi = 8.75
  ShortIndentSolmisasi = 8.75
}