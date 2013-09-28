(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(add-to-list 'load-path "~/.emacs.d/vendor/grizzl")
(add-to-list 'load-path "~/.emacs.d/vendor/flx")


(require 'grizzl)
(require 'textmate)
(textmate-mode)

(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Hide home screen
(setq inhibit-startup-message t)

;; Line number
(global-linum-mode)

;; Marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; For tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Snippets
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; (setq ac-delay 0.150)
(define-key ac-completing-map (kbd "C-g") 'ac-stop)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(show-paren-mode t)

(setq confirm-kill-emacs 'y-or-n-p)

(global-smart-tab-mode t)
(global-rainbow-delimiters-mode t)
;;(setq mac-control-modifier 'meta)

(toggle-truncate-lines 1)
(setq redisplay-dont-pause t)

(global-auto-revert-mode t)

(require 'redo+)


(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ',mode
     '(progn ,@body)))



(autoload 'yaml-mode "yaml-mode" "Yaml Mode." t)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))


(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(global-hl-line-mode t)

(setq-default truncate-lines t)

(require 'powerline)
(powerline-default-theme)
(setq powerline-default-separator 'alternate)

(custom-set-faces
 '(mode-line ((t (:foreground "#F8F8F8" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#F8F8F8" :background "#666666" :box nil)))))


(require 'projectile)
(projectile-global-mode) 
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)


(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)



(require 'smex)
;; (setq smex-save-file "~/.emacs.d/smex-items")
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; whitespace-mode config
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))
;; (setq global-whitespace-mode 1)
