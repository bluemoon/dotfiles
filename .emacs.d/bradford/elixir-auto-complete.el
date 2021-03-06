(require 'auto-complete)


(defun ac-elixir (prefix)
  (let (expansion all-expansions end-of-period)
    (with-temp-buffer
      ;; Remove period from end of line.
      (when (string-match "\\(.*\\)\\.$" prefix)
        (setq prefix (match-string 1 prefix))
        (setq end-of-period t))
      ;; Search candidate use `hoogle'.
      (call-process  "hoogle" nil t nil "" prefix)
      ;; Get match candidate.
      (goto-char (point-min))
      (while (re-search-forward
              "^\\(\\(module\\|keyword\\|Prelude\\|Data\\|Language\\.Haskell[^ ]*\\)\\( type\\| class\\)?\\)[ \\.]\\([^ \n]+\\)"
              nil t)
        (setq expansion (match-string 4))
        (setq all-expansions (cons expansion all-expansions)))
      ;; Search class.
      (goto-char (point-min))
      (while (re-search-forward
              "^Prelude class .*=> \\([^ \n]+\\)"
              nil t)
        (setq expansion (match-string 1))
        (setq all-expansions (cons expansion all-expansions)))
      ;; Search calss level.
      (goto-char (point-min))
      ;; Add period when option `end-of-period'
      ;; is `non-nil'.
      (when end-of-period
        (setq prefix (format "%s." prefix)))
      (while (re-search-forward
              (format "^%s[^ \n]+" prefix)
              nil t)
        (setq expansion (match-string 0))
        (setq all-expansions (cons expansion all-expansions))))
    all-expansions))

;; http://www.haskell.org/ghc/docs/latest/html/users_guide/pragmas.html
(defconst ac-haskell-ghc-pragmas
  (sort
   (list "LANGUAGE" "OPTIONS_GHC" "INCLUDE" "WARNING" "DEPRECATED" "INLINE" "NOINLINE"
         "LINE" "RULES" "SPECIALIZE" "UNPACK" "SOURCE")
   #'(lambda (a b) (> (length a) (length b))))
  "GHC pragmas.")

(defconst ac-haskell-defined-punctunation
  (sort
   (list "==" "/=" "<=" ">=" ">>=" ">>" "**" "^^")
   #'(lambda (a b) (> (length a) (length b))))
  "Defined punctunation in Haskell.")

(defconst ac-haskell-misc
  (sort
   (list "-fglasgow-exts")
   #'(lambda (a b) (> (length a) (length b))))
  "GHC pragmas.")

(defvar ac-source-haskell
  '((candidates . (lambda ()
                    (all-completions ac-target
                                     (append nil
                                             ac-haskell-defined-punctunation
                                             ac-haskell-ghc-pragmas
                                             (ac-haskell-hoogle ac-target)
                                             ac-haskell-misc)))))
  "Sources for Haskell keywords.")

(provide 'auto-complete-extension)

;;; auto-complete-extension.el ends here
