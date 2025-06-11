\version "2.25.26"

\header {
  tagline = ##f
}

%% -- MUSIC

RH =  {
  e'8  e'8  g'8  g'8
  e'8  e'8  g'8  g'8 | % 2
  f'4  e'4
  \tag #'notangka {
    \once \hide Tie
    d'4 ~ \dot d'4 | % 3
  }
  \tag #'notbalok {
    d'2
  }
  d'8  d'8  f'8  f'8  d'8
  d'8  f'8  f'8 | % 4
  e'4  f'4
  \tag #'notangka {
    \once \hide Tie g'4 ~ \dot g'4 | % 3
  }
  \tag #'notbalok {
    g'2
  }
  e'8  e'8  g'8  g'8  e'8
  e'8  g'8  g'8 | % 6
  f'4  g'4  a'4  b'8  a'8 | % 7
  g'8  g'8  g'8  f'8  e'4
  d'4 | % 8
  \tag #'notangka {
    \hide Tie
    c'4 ~ \dot c'4 ~ \dot c'4
  }
  \tag #'notbalok {
    c'2.
  }
  r4 \bar "|."
}

RH_Sol = \solmisasiMusic \keepWithTag #'notangka \RH

LH = {
  c'4  e'4  c'4  e'4 | % 2
  d'4  c'4  b2 | % 3
  b4  d'4  b4  d'4 | % 4
  c'4  d'4  e'2  | % 5
  c'4  e'4  c'4  e'4 | % 6
  d'4  e'4  f'2 | % 7
  e'8  e'8  e'8  d'8  c'4 b4
  g2. r4
}

syairI = \lyricmode {
  Bu -- rung -- bu -- rung be -- ter -- bang -- an di a -- wan,
  i -- kan -- i -- kan be -- re -- nang di la -- ut -- an.
  Se -- mu -- a -- nya makh -- luk cip -- ta -- an Tu -- han,
  pu -- ji Di -- a de -- ngan gem -- bi -- ra.
}

syairII = \lyricmode {
  Hu -- tan rim -- ba hi -- jau lu -- as mem -- ben -- tang,
  gu -- nung bu -- kit ber -- sa -- ut -- an men -- ju -- lang.
  Bu -- mi dan i -- si -- nya cip -- ta -- an Tu -- han,
  pu -- ji Di -- a de -- ngan gem -- bi -- ra.
}

pujituhanScore = {
  <<
    \new SolmisasiStaff
    <<
      \set Staff.midiChannel = #0
      \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
      \set Staff.midiMaximumVolume = #0.8  % Max volume
      \clef "treble"
      \time 4/4
      \tempo 4 = 90
      \new SolmisasiVoice = "melodi" \RH_Sol
    >>
    \new Lyrics \lyricsto "melodi" \syairI
    \new Lyrics \lyricsto "melodi" \syairII
    \new PianoStaff \keepWithTag #'notbalok
    <<
      \new Staff = "RH" <<
        \set Staff.midiChannel = #1
        \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
        \set Staff.midiMaximumVolume = #0.8  % Max volume
        \clef "treble"
        \time 4/4
        \set Staff.beamExceptions = #'()
        \set Staff.beatBase = #1/4
        \set Staff.beatStructure = 1,1,1,1
        \RH
      >>
      \new Staff = "LH" <<
        \set Staff.midiChannel = #2
        \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
        \set Staff.midiMaximumVolume = #0.8  % Max volume
        \clef "bass"
        \time 4/4
        \set Staff.beamExceptions = #'()
        \set Staff.beatBase = #1/4
        \set Staff.beatStructure = 1,1,1,1
        \LH
      >>
    >>
  >>
}

pujituhanMidiScore = {
  <<
    \new Staff \with {
      midiInstrument = "flute"
    } <<
      \set Staff.midiChannel = #0
      \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
      \set Staff.midiMaximumVolume = #0.8  % Max volume
      \clef "treble"
      \time 4/4
      \tempo 4 = 90
      \new Voice = "melodi" \RH_Sol
    >>
    %     \tag #'play \new Lyrics \lyricsto "melodi" \syairI
    %     \tag #'play \new Lyrics \lyricsto "melodi" \syairII
    \new PianoStaff \keepWithTag #'notbalok
    <<
      \new Staff = "RH" <<
        \set Staff.midiChannel = #1
        \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
        \set Staff.midiMaximumVolume = #0.8  % Max volume
        \clef "treble"
        \time 4/4
        \RH
      >>
      \new Staff = "LH" <<
        \set Staff.midiChannel = #2
        \set Staff.midiMinimumVolume = #0.5  % Increase from default 0.2
        \set Staff.midiMaximumVolume = #0.8  % Max volume
        \clef "bass"
        \time 4/4
        \LH
      >>
    >>
  >>
}