\version "2.25.26"
\include "../../solmisasi-lily/lib/solmisasi.ily"
\withExtensions #'(
                    "key-signature-summary"
                    "time-signature-summary"
                    "simultaneous-divisi"
                    )
\include "Pujilah_Tuhan_Sang_Pencipta_ly_main,ly"
%\include "tie-attributes.ily"

\paper {
  indent = 0
  page-breaking = #ly:one-line-breaking
  print-page-number = ##f
  tagline = ##f
}

\score {
  \pujituhanScore
  \layout {
    \context {
      \Score
      \consists Metronome_mark_engraver
    }
    \context {
      \Voice
      \consists \Tie_grob_engraver
    }
    \context {
      \SolmisasiVoice
      \consists \Tie_grob_engraver
    }
  }
}

\score {
  \pujituhanMidiScore
  \midi {
    \context {
      \Score
      midiChannelMapping = #'staff
    }
    \tempo 4 = 86
  }
}