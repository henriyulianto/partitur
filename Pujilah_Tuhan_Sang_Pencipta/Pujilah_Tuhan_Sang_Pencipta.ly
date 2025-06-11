\version "2.25.26"
\include "../../solmisasi-lily/lib/solmisasi.ily"
\withExtensions #'(
                    "key-signature-summary"
                    "time-signature-summary"
                    "simultaneous-divisi"
                    )

%\include "defs.ily"
%\include "highlight-bars.ily"
\include "Pujilah_Tuhan_Sang_Pencipta_ly_main.ly"

#(set-global-staff-size 18) % Slightly smaller staff

#(if (not is-svg?)
     (set-global-staff-size 18))

svgPaperSettings = \paper {
  line-width = 2.5\cm
  paper-width = 2.7\cm
}

\paper {
  #(if is-svg?
       svgPaperSettings
       (set-paper-size "a4landscape"))
  indent = 0
  short-indent = 0
  page-breaking = #(if is-svg?
                       ly:one-page-breaking
                       ly:page-turn-breaking)
}

\header {
  titlestring = "Puji Tuhan Sang Pencipta"
  title = \markup { \fontsize #3 "Puji Tuhan Sang Pencipta" }
  subtitle = ##f
  composer = \markup \larger {
    \override #'(baseline-skip . 2.8)
    \right-column {
      "Syair dan Lagu oleh"
      \larger \caps "Henri Yulianto"
    }
  }
  poet = ##f
  arranger = ##f
  instrumentstring = "Piano"
  tagline = \markup \smaller {
    "© 2025 Henri Yulianto"
  }
}

\layout {
  \context {
    \Score
    \override BarNumber.stencil = #empty-stencil
    \consists Metronome_mark_engraver
  }
  \context {
    \SolmisasiVoice
    \override NoteHead.font-family = #'sans
    %\override NoteHead.font-size = #0.3
    \override Rest.font-family = #'sans
    %\override Rest.font-size = #0.3
  }
  \context {
    \Lyrics
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0
    \override LyricText.font-family = #'sans
    \override LyricText.font-series = #'normal
    \override LyricText.font-size = #1
    \override LyricHyphen.Y-offset = #0.2
    \override LyricHyphen.minimum-distance = #2.0
    \override LyricSpace.minimum-distance = #1.0
  }
}

%% -- SCORE

\score {
  \pujituhanScore
  \layout {
    \context {
      \Voice
      \override StringNumber.stencil = ##f
      % Apply larger note heads only for SVG output
      #(if is-svg?
           (ly:parser-include-string
            "\\override NoteHead.font-size = #2")
           )
    }
    % Apply simple highlighting only for SVG output
    #(if is-svg?
         (ly:parser-include-string
          "\\context {
               \\Staff
               \\consists #Simple_highlight_engraver
               \\consists Staff_highlight_engraver
               \\consists #Bar_timing_collector
             }
             \\context {
               \\SolmisasiStaff
               \\consists #Simple_highlight_engraver
               \\consists Staff_highlight_engraver
               \\consists #Bar_timing_collector
             }
             \\context {
               \\Score
               \\override StaffHighlight.after-line-breaking = #add-data-bar-to-highlight
             }")
         )
  }
}

