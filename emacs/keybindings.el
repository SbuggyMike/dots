; this is a list of keybindings

; music
(global-set-key (kbd "C-c SPC") 'emms-pause)
(global-set-key (kbd "C-c n") 'emms-next)
(global-set-key (kbd "C-c N") 'emms-cue-next)
(global-set-key (kbd "C-c p") 'emms-previous)
(global-set-key (kbd "C-c P") 'emms-cue-previous)
(global-set-key (kbd "C-c d") 'emms-add-directory)
(global-set-key (kbd "C-c f") 'emms-add-file)
(global-set-key (kbd "C-c b") 'emms-bookmarks-add)
(global-set-key (kbd "C-c B") 'emms-bookmarks-next)
(global-set-key (kbd "C-c s") 'emms-stop)

; email
(global-set-key (kbd "C-c g") 'gnus)

; toggle evil mode
(global-set-key (kbd "C-c e") 'evil-mode)

; term
(global-set-key (kbd "C-c t") 'term)

; eww
(global-set-key (kbd "C-c w") 'eww)

; rename-buffer
(global-set-key (kbd "C-c rb") 'rename-buffer)

; load-file
(global-set-key (kbd "C-c lf") 'load-file)

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


