\version "2.25.7"
%% version Y/M/D = 2023/12/10
%% For lilypond 2.25 or higher
%% LSR = http://lsr.di.unimi.it/LSR/Item?u=1&id=767
%%
%% globalizeMusic.ly uses extractMusic.ly
%% Please, download extractMusic.ly at
%%    http://gillesth.free.fr/Lilypond/extractMusic/
\include "extractMusic.ily"

%%%%%%%%%%%%%%%%%%%%%%%%%%%% scheme functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#(define (copy-structure source dest)
   "Copy the structure of music source into dest music"
   (parameterize ((*current-moment* ZERO-MOMENT))
     (let loop ((evt (ly:music-deep-copy source)))
       (let ((name (name-of evt))) ; see extract-music.ly
         (if (or (eq? name 'EventChord)
                 (ly:music-property evt 'duration #f))
             (let ((from (*current-moment*))
                   (len (ly:music-length evt)))
               (*current-moment* (ly:moment-add from len))
               (extract-during dest from len))
             (let ((elt (ly:music-property evt 'element))
                   (elts (ly:music-property evt 'elements)))
               (cond
                ; source and dest must have strictly the same length.
                ; a \repeat fold in source is not unfolded when copy-structure is called.
                ((memq name '(UnfoldedRepeatedMusic PercentRepeatedMusic))
                 (let* ((len (ly:music-length elt))
                        (count (ly:music-property evt 'repeat-count 1))
                        (unfolded-len (mom-imul len count))) ; see extract-music.ly
                   ; returns a skip of the unfolded length of the \repeat
                   (loop (make-music 'SkipEvent 'duration (make-duration-of-length unfolded-len)))))
                ; a simultaneous music in source may result in a probably inespected simultaneous music in dest
                ((eq? name 'SimultaneousMusic)
                 (loop (skip-of-length evt))) ; returns a skip of the length of evt
                (else
                 (if (ly:music? elt) (ly:music-set-property! evt 'element (loop elt)))
                 (if (pair? elts) (ly:music-set-property! evt 'elements  (map loop elts)))
                 evt))))))))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#(define sections-event-list (if (defined? 'sections-event-list)
                                 sections-event-list  ; all event of 0 length can work !
                                 '(SectionEvent SectionLabelEvent FineEvent)))

#(define (delete-structure music)
   "Delete \\section, \\repeat volta and \\repeat segno events found in music, keeping only containing musics"
   (reduce-seq  ; reduce the number of nested sequential musics (see extract-music.ly)
                (music-filter defined-music? ; see extractMusic.ly
                              (music-map
                               (lambda(evt)
                                 (let ((name (name-of evt)))
                                   (cond
                                    ((memq name '(VoltaRepeatedMusic SegnoRepeatedMusic VoltaSpeccedMusic))
                                     (let ((elts (ly:music-property evt 'elements))
                                           (elt (ly:music-property evt 'element)))
                                       (if (null? elts)
                                           elt
                                           (make-sequential-music (cons elt elts)))))
                                    ((eq? name 'SequentialAlternativeMusic)
                                     (make-sequential-music (ly:music-property evt 'elements)))
                                    ((memq name sections-event-list) (make-music 'Music))
                                    (else evt))))
                               music))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%% lilypond functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

copyStructure =
#(define-music-function (source dest) (ly:music? ly:music?)
   "Apply copy-structure to source and dest"
   (copy-structure source dest))

deleteStructure =
#(define-music-function (music)(ly:music?)
   "Apply delete-structure to music"
   (delete-structure music))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \globalizeMusic %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Users can define in their file, a list called 'staff-family-list' to specify
%% what kind of Context are containing real music.
%% By default, only 'Staff 'DrumStaff are taken in account.
%% If you want for example to add 'MensuralStaff as music container, you can add
%% before \include "globalizeMusic.ly", the following :
%% #(define staff-family-list (list 'Staff 'DrumStaff 'MensuralStaff))

#(define staff-family-list
   (if (defined? 'staff-family-list)
       staff-family-list
       (list 'Staff 'DrumStaff)))

% A music called 'global MUST exist!
#(define (globalize-music music)
   "When a Staff or DrumStaff is found, combines the contained music in << \\global \\music >>, and
applies to it the copy-structure function with global as source."
   (let ((elts (ly:music-property music 'elements))
         (elt (ly:music-property music 'element))
         (staff? (and
                  (eq? (name-of music) 'ContextSpeccedMusic)
                  (memq (ly:music-property music 'context-type) staff-family-list))))
     ; (display (name-of music))(newline)
     (if staff?
         (ly:music-set-property! music 'element
                                 (make-simultaneous-music (list
                                                           (delete-structure (ly:music-deep-copy global)) ; keeps others informations (time signatures for ex)
                                                           (copy-structure global elt))))
         (begin
          (if (ly:music? elt)(ly:music-set-property! music 'element
                                                     (globalize-music elt)))
          (if (pair? elts)(ly:music-set-property! music 'elements
                                                  (map globalize-music elts)))))
     music))

%%%%%%%%%%%%%%%%%%%%%%%%

globalizeMusic =
#(define-music-function (music)(ly:music?)
   "Applies globalize-music to music. The whole structure ( \\section, \\repeat volta, \\repeat segno)
are to be set in a music called \\global 
music is typically a combinaison of all parts in the score.
music = << \\Staff \\partI
           \\Staff \\partII ... >>
\\score { \\globalizeMusic \\music }
Applying \\unfoldRepeats \\globalizeMusic \\music will work because \\globalizeMusic copies the
structure of \\global in \\partI \\partII etc..."
   (if (and (defined? 'global) (ly:music? global))
       (globalize-music music)
       music))