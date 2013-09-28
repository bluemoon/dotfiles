(add-to-list 'load-path "~/.emacs.d/vendor/emacs-elixir/")

;; Setup for elixir
(require 'elixir-mode)
;(require 'elixir-mix)
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))

(add-to-list 'elixir-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
               (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
               (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
               (ruby-end-mode +1)))

;(global-elixir-mix-mode) ;; enable elixir-mix
;(global-set-key (kbd "<f7>") 'elixir-mix-compile)
;(global-set-key (kbd "<f8>") 'elixir-mix-test)
