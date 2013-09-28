(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)


(global-set-key (kbd "s-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "s-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "s-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "s-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "s-o") 'other-window) ; was facemenu-keymap
(global-set-key (kbd "s-O") 'rotate-windows)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-`") 'other-frame)

(global-set-key [f1] 'magit-status)

(global-set-key (kbd "s-S-z") 'redo)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "s-e") 'search-tags)
