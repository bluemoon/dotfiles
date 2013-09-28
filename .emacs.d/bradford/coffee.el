(require 'coffee-mode)
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2)
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  (define-key coffee-mode-map [(meta R)] 'coffee-compile-region))

(add-hook 'coffee-mode-hook
          '(lambda()
             (coffee-custom)))

(require 'flymake-easy)
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(provide 'init-coffeescript)
