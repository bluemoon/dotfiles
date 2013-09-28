(setq ac-source-yasnippet nil)

;; (set-default 'ac-sources
;;              '(ac-source-abbrev
;;                ac-source-dictionary
;;                ac-source-yasnippet
;;                ac-source-words-in-buffer
;;                ac-source-words-in-same-mode-buffers
;;                ac-source-semantic))

;; (
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"))

;; (global-auto-complete-mode t)
;; (yas/global-mode t)


;; (setq ac-auto-start 2
;;       ac-delay 0.
;;       ac-quick-help-delay 0.
;;       ac-use-fuzzy t
;;       tab-always-indent 'complete ; use 'complete when auto-complete is disabled
;;       ac-dwim t)



(after auto-complete
  (setq ac-auto-show-menu .1)
  (setq ac-use-menu-map t)
  (setq ac-disable-inline t)
  (setq ac-candidate-menu-min 0)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict"))

;; (after auto-complete-config
;;   ;; (ac-config-default)
;;   (add-hook 'ein:notebook-multilang-mode-hook 'auto-complete-mode)
;;   (setq-default ac-sources (append '(ac-source-yasnippet ac-source-imenu) ac-sources))
;;   (when (file-exists-p (expand-file-name "~/.emacs.d/elisp/Pymacs"))
;;     (ac-ropemacs-initialize)
;;     (ac-ropemacs-setup)))

;; (after auto-complete-autoloads
;;   (require 'auto-complete-config))

;; (when (file-exists-p (expand-file-name "~/.emacs.d/elisp/Pymacs"))
;;   (setq ropemacs-enable-autoimport t)
;;   (add-to-list 'load-path "~/.emacs.d/elisp/Pymacs"))
