\version "2.25.26"

\include "jazzchords.ily"
\include "pseudo-indents.ily"

\header {
  dedication = ##f
  title = "Judul Lagunya"
  subtitle = ##f
  footer-title = "Judul Lagunya"
  composer-pre-text = "Lagu dan syair oleh"
  composer = "GREGO JULIUS"
  arranger-pre-text = "Aransemen vokal dan musik oleh"
  arranger = "HENRI YULIANTO"
  poet-pre-text = ##f
  poet = ##f
  meter = ##f
  meter-post-text = ##f
  instrument-pre-text = ##f
  instrument = ##f
  instrument-id = "SATB"
  nada-dasar = "Do = C"
  sukat-dan-mm = "4/4 - MM = 74"
  copyright = \markup \raise #-0.5 {
    %\override #'(line-width . 30)
    \fill-line {
      \general-align #Y #-0.9 \line {
        \epsfile #Y #4.5 #sol:cc-eps
        \epsfile #Y #4.5 #sol:by-eps
      }
      \general-align #Y #-0.91 \override #'(baseline-skip . 2.5) \center-column {
        \bold \abs-fontsize #10 "&copyright; Grego Julius Music, 2025"
        "Lagu dan/atau aransemen ini dapat dibawakan dengan bebas"
        "tanpa memerlukan lisensi mekanik dari pemegang hak cipta,"
        \concat {
          "sepanjang tidak mengubah isi dokumen ini "
          "(CC-BY "
          \italic "Creative Commons &ndash; Attribution"
          ")."
        }
      }
      \general-align #Y #DOWN
      \override #'(quiet-zone-size . 0)
      \qr-code #9 "https://www.youtube.com/@GregoJuliusMusic"
    }
  }
}

#(set-global-staff-size (* (/ 10 11) 20))

\paper {
  left-margin = 20\mm
  right-margin = 20\mm
  top-margin = 13\mm
  bottom-margin = 15\mm

  indent = 9\mm
  short-indent = 10.5\mm

  footer-box-bkgrI  = "#5B9BD5"
  footer-box-bkgrII = "#92D050"
  footer-text-color = "#808080"

  print-page-number = ##t
  print-first-page-number = ##t

  system-system-spacing.padding = 3\mm
  top-markup-spacing.padding = 4\mm
  top-system-spacing.padding = 4\mm

  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.3)
    \column {
      %% Line 2
      \fill-line {
        \abs-fontsize #19 \bold \caps
        \fromproperty #'header:title
      }
      %% Line 3
      \abs-fontsize #10.5 \fill-line {
        \override #'(baseline-skip . 3.3)
        \column {
          \fill-line {
            \fromproperty #'header:subtitle
          }
          \fill-line {
            \line {
              \fromproperty #'header:instrument-pre-text
              \fromproperty #'header:instrument
            }
          }
        }
      }
      \vspace #0.5
      %% Line 4
      \abs-fontsize #10.5 \fill-line {
        \override #'(baseline-skip . 3.0)
        \left-column {
          \fromproperty #'header:nada-dasar
          \fromproperty #'header:sukat-dan-mm
        }
        \null
        \override #'(baseline-skip . 6.4)
        \right-column {
          \override #'(baseline-skip . 3.0)
          \right-column {
            \italic \fromproperty #'header:composer-pre-text
            \caps \fromproperty #'header:composer
          }
          \override #'(baseline-skip . 3.0)
          \right-column {
            \italic \fromproperty #'header:arranger-pre-text
            \caps \fromproperty #'header:arranger
          }
        }
      }
    }
  }

  oddHeaderMarkup = ##f
  evenHeaderMarkup = \oddHeaderMarkup

  oddFooterMarkup = \markup {
    \override #'(baseline-skip . 3.2)
    \column {
      \fill-line {
        %% Copyright header field only on first page in each bookpart.
        \if \on-first-page-of-part
        \abs-fontsize #9.5 \fromproperty #'header:copyright
      }
      \vspace #0.3
      \fill-line {
        \with-color #footer-box-bkgrI
        \filled-box #`(0 . ,(/ 85 1.5975445614299912)) #'(0 . 1.35) #0
        \null
        \with-color #footer-box-bkgrII
        \filled-box #`(0 . ,(/ 85 1.5975445614299912)) #'(0 . 1.35) #0
      }
      \with-color #footer-text-color
      \abs-fontsize #9 \fill-line {
        \line {
          \hspace #1.3
          \italic \fromproperty #'header:footer-title
        }
        \null
        \line {
          \if \should-print-page-number
          \concat {
            \fromproperty #'page:page-number-string
            "/"
            \page-ref #'lastPage "0" "?"
          }
          \hspace #1.3
        }
      }
    }
  }

  #(define gj-fonts
     `(
        ;; Standard font families
        (music      . "beethoven")
        (serif      . ,(if (eq? 'svg (ly:get-option 'backend))
                           "serif"
                           "Palatino Linotype"))
        (sans       . ,(if (eq? 'svg (ly:get-option 'backend))
                           "sans"
                           "Noto Sans"))
        (typewriter . ,(if (eq? 'svg (ly:get-option 'backend))
                           "monospace"
                           "LilyPond Monospace"))
        ;; Custom font families
        (solmisasi  . "Lilypond Serif")
        (lyrics     . "Palatino Linotype")
        ))
  property-defaults.fonts = #gj-fonts
}

SolmisasiLayout = \layout {
  \context {
    \Score
    \omit SystemStartBar
    \override SystemStartBracket.padding = #6
    \override SystemStartBracket.direction = #LEFT
    \override BarNumber.X-offset = #-4
    \override SectionLabel.font-size = #0.5
    \override TextSpanner.dash-fraction = #0.4
    \override TextSpanner.dash-period = #1.5

    rehearsalMarkBackgroundColor = "#DEEBF6"
  }
  \context {
    \SolmisasiGlobalStaff
    \override SolmisasiKeyChangeMark.font-size = #0.5
    %\override SolmisasiKeyChangeMark.background-color = "#def0ca"
  }
  \context {
    \SolmisasiStaff

    \override InstrumentName.font-size = #0
    \override InstrumentName.X-offset = #-4.8

    \override SolmisasiNoteHead.font-size = #0
    \override SolmisasiNoteHead.font-family = #'solmisasi
    \override SolmisasiRest.font-size = #0
    \override SolmisasiRest.font-family = #'solmisasi
  }
  \context {
    \Lyrics
    \override LyricText.font-size = #0.3
  }
  \context {
    \ChordNames
    \consists #Bass_changes_equal_root_engraver

    \override ChordName.fonts.sans = "Roboto"
    \override ChordName.font-family = #'sans
    \override ChordName.font-size = #-0.5

    chordNoteNamer = #JazzChordNames
    chordRootNamer = #JazzChordNames	% update the chord names
    chordNameExceptions = #JazzChords	% update the chord exceptions
    chordChanges = ##t
  }
}

SopranoMidiInstrument = "flute"
SopranoOneMidiInstrument = "flute"
SopranoTwoMidiInstrument = "flute"

AltoMidiInstrument = "clarinet"
AltoOneMidiInstrument = "clarinet"
AltoTwoMidiInstrument = "clarinet"

TenorMidiInstrument = "oboe"
TenorOneMidiInstrument = "oboe"
TenorTwoMidiInstrument = "oboe"

BassMidiInstrument = "bassoon"
BassOneMidiInstrument = "bassoon"
BassTwoMidiInstrument = "bassoon"

WomenMidiInstrument = "trumpet"
MenMidiInstrument = "trombone"

InstrumentCueMidiInstrument = "banjo"