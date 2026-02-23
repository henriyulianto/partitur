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
  copyright = ##f % \markup \raise #-0.5 {
  %     %\override #'(line-width . 30)
  %     \fill-line {
  %       \general-align #Y #-0.9 \line {
  %         \epsfile #Y #4.5 #sol:cc-eps
  %         \epsfile #Y #4.5 #sol:by-eps
  %       }
  %       \general-align #Y #-0.91 \override #'(baseline-skip . 2.5) \center-column {
  %         \bold \abs-fontsize #10 "&copyright; Grego Julius Music, 2025"
  %         "Lagu dan/atau aransemen ini dapat dibawakan dengan bebas"
  %         "tanpa memerlukan lisensi mekanik dari pemegang hak cipta,"
  %         \concat {
  %           "sepanjang tidak mengubah isi dokumen ini "
  %           "(CC-BY "
  %           \italic "Creative Commons &ndash; Attribution"
  %           ")."
  %         }
  %       }
  %       \general-align #Y #DOWN
  %       \override #'(quiet-zone-size . 0)
  %       \qr-code #9 "https://www.youtube.com/@GregoJuliusMusic"
  %     }
  %   }
}

#(set-global-staff-size (* (/ 21 22) 20))

\paper {
  left-margin = 15\mm
  right-margin = 15\mm
  top-margin = 15\mm
  bottom-margin = 15\mm

  indent = 9\mm
  short-indent = 10.5\mm

  footer-box-bkgrI  = "#FFFFFF" %"#5B9BD5"
  footer-box-bkgrII = "#FFFFFF" %"#92D050"
  footer-text-color = "#010101" %"#808080"

  print-page-number = ##t
  print-first-page-number = ##t

  system-system-spacing.padding = 3\mm
  top-markup-spacing.padding = 4\mm
  top-system-spacing.padding = 4\mm

  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      %% Line 2
      \fill-line {
        \abs-fontsize #22 \bold
        \fromproperty #'header:title
      }
      %% Line 3
      \fill-line {
        \override #'(baseline-skip . 3.0)
        \column {
          \fill-line {
            \abs-fontsize #14 \fromproperty #'header:subtitle
          }
          \fill-line {
            \abs-fontsize #11 \line {
              \fromproperty #'header:instrument-pre-text
              \fromproperty #'header:instrument
            }
          }
        }
      }
      \vspace #1
      %% Line 4
      \abs-fontsize #11 \fill-line {
        \override #'(baseline-skip . 2.8)
        \left-column {
          \fromproperty #'header:nada-dasar
          \fromproperty #'header:sukat-dan-mm
        }
        \null
        \override #'(baseline-skip . 6.0)
        \right-column {
          \override #'(baseline-skip . 2.8)
          \right-column {
            \fromproperty #'header:composer-pre-text
            \fromproperty #'header:composer
          }
          \override #'(baseline-skip . 2.8)
          \right-column {
            \fromproperty #'header:arranger-pre-text
            \fromproperty #'header:arranger
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

  #(define hy-fonts
     `(
        ;; Standard font families
        (music      . "beethoven")
        (serif      . ,(if (eq? 'svg (ly:get-option 'backend))
                           "serif"
                           "Noto Serif"))
        (sans       . ,(if (eq? 'svg (ly:get-option 'backend))
                           "sans"
                           "Lilypond Sans Serif"))
        (typewriter . ,(if (eq? 'svg (ly:get-option 'backend))
                           "monospace"
                           "LilyPond Monospace"))
        ;; Custom font families
        (solmisasi  . "Noto Sans")
        (lyrics     . "Noto Serif")
        ))
  property-defaults.fonts = #hy-fonts
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

    %rehearsalMarkBackgroundColor = "#DEEBF6"
    rehearsalMarkBackgroundColor = "#ffffff"
  }
  \context {
    \SolmisasiGlobalStaff
    \override SolmisasiKeyChangeMark.font-size = #0.5
    \override SolmisasiKeyChangeMark.background-color = "#ffffff"
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