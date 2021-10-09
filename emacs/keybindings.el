; this is a list of keybindings

; music
(global-set-key (kbd "s-m SPC") 'emms-pause)
(global-set-key (kbd "s-m n") 'emms-next)
(global-set-key (kbd "s-m N") 'emms-cue-next)
(global-set-key (kbd "s-m p") 'emms-previous)
(global-set-key (kbd "s-m P") 'emms-cue-previous)
(global-set-key (kbd "s-m d") 'emms-add-directory)
(global-set-key (kbd "s-m f") 'emms-add-file)
(global-set-key (kbd "s-m b") 'emms-bookmarks-add)
(global-set-key (kbd "s-m B") 'emms-bookmarks-next)
(global-set-key (kbd "s-m s") 'emms-stop)
(global-set-key (kbd "s-m u") 'emms-add-url)

; email
(global-set-key (kbd "C-c g") 'gnus)

; toggle evil mode
(global-set-key (kbd "C-c e") 'evil-mode)

; term
(global-set-key (kbd "C-c t") 'term)

; eww
(global-set-key (kbd "C-c w") 'eww)

;; buffer operations
; rename-buffer
(global-set-key (kbd "C-c cr") 'rename-buffer)

; count-words
(global-set-key (kbd "C-c cw") 'count-words)

; org-agenda
(global-set-key (kbd "C-c oa") 'org-agenda)


; when a new window is open, don't display the same buffer
(defun better-horizontal-split ()
  "Split frame horizontally and switch to previous buffer"
  (interactive)
  (split-window-horizontally)
  (next-window-any-frame)
  (previous-buffer))
(global-set-key (kbd "C-x 3") 'better-horizontal-split)
(defun better-vertical-split ()
  "Split frame vertically and switch to previous buffer"
  (interactive)
  (split-window-vertically)
  (next-window-any-frame)
  (previous-buffer))
(global-set-key (kbd "C-x 2") 'better-vertical-split)

; load-file
(global-set-key (kbd "C-c lf") 'load-file)

; org mode shortcuts
; make footnoting easier
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c a") 'org-footnote-new)))
