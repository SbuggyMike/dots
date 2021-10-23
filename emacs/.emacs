(load-file "~/.emacs.d/init.el")

; 4chan reader
(load-file "~/.emacs.d/q4/q4.el")
	   
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 

; vim mode - I only really want this for editing text, but by god I need it
;(require 'evil)
;(evil-mode t)

; common lisp
(setq inferior-lisp-program "/usr/bin/sbcl")

; minimalism
(menu-bar-mode 0)
(toggle-scroll-bar 0)
(tool-bar-mode 0)

; useable theme
(load-theme 'wombat t)

; turn off that fucking noise
(setq visible-bell t)
(setq display-line-numbers 'relative)

;; org mode customisation
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(setq org-log-done 'time) ; timestamps for todo items

; org mode clocking time
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 20) ; to be asked where I've been if I disappear

; org mode exporting pdfs via latex
(setq org-latex-pdf-process '("latexmk -pdf %f"))
;      '("pdflatex -interaction nonstopmode -output-directory %o %f"
;       "biber %b"
;       "pdflatex -interaction nonstopmode -output-directory %o %f"
;       "biber %b"
;       "pdflatex -interaction nonstopmode -output-directory %o %f"))

; text mode customisation
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

; add emms
(require 'emms-setup)
(emms-all)
(emms-default-players)
(require 'emms-cue)
(add-to-list 'emms-info-functions 'emms-info-cueinfo)

; org-journal
(require 'org-journal)
(setq org-journal-dir "~/Nextcloud/life_org/journal")

; load my own keybindings
(load-file "~/keybindings.el")

; eww default download directory
(setq eww-download-directory "~/downloads/")

; pomodoro
(require 'pomodoro)
(pomodoro-add-to-mode-line)

; make org evaluate 
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(org-agenda-files
   '("~/Nextcloud/life_org/reading.org" "~/Nextcloud/life_org/exercise.org" "~/Nextcloud/life_org/todo.org"))
 '(package-selected-packages '(org-journal magit emms pdf-tools slime evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(pdf-tools-install)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
