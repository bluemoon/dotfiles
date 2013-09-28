(require 'etags)
(require 'grizzl-custom)
;; (car (etags-list-tags "~/Projects/10x_phasing/TAGS"))


(setq debug-on-error t)
(tags-completion-table)

;; (with-output-to-temp-buffer "*my output2*"
;;  (prin1 (with-current-buffer (find-tag-noselect "detail")))
;;  (prin1 (tags-completion-table)))

(defun find-file-upwards (file-to-find)
  "Recursively searches each parent directory starting from the default-directory.
looking for a file with name file-to-find.  Returns the path to it
or nil if not found."
  (cl-labels
      ((find-file-r (path)
                    (let* ((parent (file-name-directory path))
                           (possible-file (concat parent file-to-find)))
                      (cond
                       ((file-exists-p possible-file) possible-file) ; Found
                       ;; The parent of ~ is nil and the parent of / is itself.
                       ;; Thus the terminating condition for not finding the file
                       ;; accounts for both.
                       ((or (null parent) (equal parent (directory-file-name parent))) nil) ; Not found
                       (t (find-file-r (directory-file-name parent))))))) ; Continue
    (find-file-r default-directory)))

(defun search-tags ()
  (interactive)

  (let (tag-names)
    (mapatoms (lambda (x)
                (push (prin1-to-string x t) tag-names))
              tags-completion-table)
    (defvar *search-index* (grizzl-make-index tag-names))
    (find-tag (grizzl-custom-completing-read "Tag: " *search-index*))
    ))

