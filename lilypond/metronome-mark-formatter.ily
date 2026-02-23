\version "2.25.26"
%%
%  Metronome markup formatter, with more options than the Lilypond
%  default formatter, and changes in sizing (see below).
%  Properties read:
%  - tempoEquationText:    text to be put between note and tempo value(s)
%                          Default: "="
%  - tempoBetweenText:     text to be put between the tempo values. Used
%                          only in ranges of tempo values.
%                          Default: "-"
%  - tempoHideParenthesis: boolean. If true, the parenthesis are hide.
%                          Default: false.
%  - tempoNumberColor:     color. If set, the tempo value will be formatted
%                          to this color.
%                          Default: not set.
%  The size of the text ("Allegro" etc) is a bit larger than Lilypond default.
%  Similarly, the size of the note is smaller than Lilypond default.
%
%  To use this snippet, just \include this file. To revert default
%  Lilypond formatter inside the score:
%  \set Score.metronomeMarkFormatter = #format-metronome-markup
%
%  tested: Version "2.21.2"
%
%  This snippet is based on a snippet by Arnold Theresius. The original
%  snippet create a formatter called  "format-metronome-markup-approx",
%  and the default value to tempoEquationText in that snippet is "≈".
%  I changed back this default to Lilypond default, and added the
%  tempoBetweenText property.
%
%  Original header of the Theresius snippet:
%% http://lsr.di.unimi.it/LSR/Item?id=869

%by: ArnoldTheresius

%tested: Version "2.21.2"


% lilypond 2.14.x:
% Almost copied from .../scm/translation-functions.scm:
% --> added »-approx« to the function names of
%     »format-metronome-markup« and »metronome-markup«
% --> replaced "=" with "≈" (approx. instead of equal)

#(define-public (format-metronome-markup-custom event context)
   (let ((eq-sym-def (ly:context-property context 'tempoEquationText))
         ; added option
         (bet-sym-def (ly:context-property context 'tempoBetweenText))             ; added option
         (hide-paren (eq? #t (ly:context-property context 'tempoHideParenthesis))) ; added option
         (num-color (ly:context-property context 'tempoNumberColor #f))            ; added option
         (hide-note (ly:context-property context 'tempoHideNote #f))
         (text (ly:event-property event 'text))
         (dur (ly:event-property event 'tempo-unit))
         (count (ly:event-property event 'metronome-count)))

     (metronome-markup-custom text dur count hide-note eq-sym-def bet-sym-def hide-paren num-color)))

#(define-public (metronome-markup-custom text dur count hide-note eq-sym-def bet-sym-def hide-paren col)
   (let* ((note-mark (if (and (not hide-note) (ly:duration? dur))
                         (make-teeny-markup
                          ; note smaller than Lilypond default
                          (make-note-by-number-markup
                           (ly:duration-log dur)
                           (ly:duration-dot-count dur)
                           1))
                         #f))
          (count-markup (cond ((number? count)
                               (if (> count 0)
                                   (number->string count)
                                   #f))
                              ((pair? count)
                               (make-concat-markup
                                (list
                                 (number->string (car count))
                                 (ly:wide-char->utf-8 #x2009)      ; x2009: "thin space"
                                 (if (string? bet-sym-def)
                                     bet-sym-def
                                     (ly:wide-char->utf-8 #x2013)) ; x2013: "en dash"
                                 (ly:wide-char->utf-8 #x2009)      ; x2009: "thin space"
                                 (number->string (cdr count)))))
                              (else #f)))
          (note-markup (if (and (not hide-note) count-markup)
                           (make-concat-markup
                            (list
                             (make-general-align-markup Y DOWN note-mark)
                             " "
                             (if (string? eq-sym-def)
                                 eq-sym-def
                                 (ly:wide-char->utf-8 #x3d))
                             " "
                             (if (eq? col #f)
                                 count-markup
                                 (make-with-color-markup col count-markup))))
                           #f))
          (text-markup (if (not (null? text))
                           (make-large-markup (make-bold-markup text)) ; text larger than Lilypond default
                           #f)))
     (if text-markup
         (if (and note-markup (not hide-note))
             (make-line-markup (list text-markup
                                     (if hide-paren
                                         note-markup
                                         (make-concat-markup
                                          (list "("
                                                note-markup
                                                ")")))))
             (make-line-markup (list text-markup)))
         (if note-markup
             (make-line-markup (list note-markup))
             (make-null-markup)))))

% Avoid errors of not defined properties
#(define (define-translator-property symbol type? description)
   (if (not (and (symbol? symbol)
                 (procedure? type?)
                 (string? description)))
       (ly:error "error in call of define-translator-property"))
   (if (not (equal? (object-property symbol 'translation-doc) #f))
       (ly:error (G "symbol ~S redefined") symbol))

   (set-object-property! symbol 'translation-type? type?)
   (set-object-property! symbol 'translation-doc description)
   symbol)

#(for-each
  (lambda (x)
    (apply define-translator-property x))
  `((tempoHideParenthesis
     ,boolean?
     "Hide the parenthesis around the metronome markup with text")
    (tempoEquationText
     ,string?
     "initially ''='' in the metronome markup")
    (tempoBetweenText
     ,string?
     "initially ''-'' in the metronome markup")
    (tempoNumberColor
     ,list?
     "alternate color, in which the tempo value should be displayed")))
