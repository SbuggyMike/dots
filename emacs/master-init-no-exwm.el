; use packages 
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 

;; use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; packages
;;; better auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package chess
  :ensure t)

;;; emms music player
(use-package emms
  :ensure t)
(require 'emms-setup)
(emms-all)
(emms-default-players)
(require 'emms-cue)
(add-to-list 'emms-info-functions 'emms-info-cueinfo)
;;;; persistent history available on all computers
(require 'emms-history)
(setq emms-history-file "~/Nextcloud/computer/config/linux/emacs/music-history")
(emms-history-load)

(use-package ereader
  :ensure t)

(use-package evil
  :init (setq evil-want-keybinding nil)
  :ensure t)

(use-package evil-collection
  :ensure t)

(use-package magit
  :ensure t)

(use-package org-bullets
  :ensure t)
(add-hook 'org-mode-hook 'org-bullets-mode)

(use-package org
  :ensure t)

(use-package org-journal
  :ensure t)

(use-package pdf-tools
  :ensure t)
(pdf-tools-install)

(use-package smudge
  :ensure t)
(setq smudge-transport 'connect)
(setq smudge-oauth2-client-id "de04b8a2cb4e4410833d1464b8b37199")
(setq smudge-oauth2-client-secret "2a044066e1984898a169b261c9526cc5")

(use-package try
  :ensure t)

(use-package w3m
  :ensure t)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(add-to-list 'load-path "~/.emacs.d/emacs-w3m/")
(setq w3m-init-file "~/Nextcloud/computer/config/linux/emacs/.emacs-w3m")
(require 'w3m-load)

; use ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
  
; keybindings
;; this is a list of keybindings

;; music
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
;;; open the playlist menu
(global-set-key (kbd "s-m e") 'emms)


;;; smudge
(global-set-key (kbd "s-p SPC") 'smudge-controller-toggle-play)
(global-set-key (kbd "s-p r") 'smudge-controller-toggle-repeat)
(global-set-key (kbd "s-p s") 'smudge-controller-toggle-shuffle)
(global-set-key (kbd "s-p p") 'smudge-controller-previous-track)
(global-set-key (kbd "s-p n") 'smudge-controller-next-track)
(global-set-key (kbd "s-p ?") 'smudge-track-search)
(global-set-key (kbd "s-p u") 'smudge-controller-volume-up)
(global-set-key (kbd "s-p d") 'smudge-controller-volume-down)
(global-set-key (kbd "s-p m") 'smudge-my-playlists)
(global-set-key (kbd "s-p f") 'smudge-featured-playlists)
(global-set-key (kbd "s-p i") 'smudge-user-playlists)

;; email
(global-set-key (kbd "C-c g") 'gnus)

;; evil
(evil-mode)
(global-set-key (kbd "C-c e") 'evil-mode)

;; imenu
(global-set-key (kbd "C-c i") 'imenu)


;; term
(global-set-key (kbd "C-c t") 'eshell)

;; eww
;;; make a function so that the shortcut goes straight to google
(defun w3m-google ()
  (interactive)
  (w3m-browse-url "google.com" 1))

(global-set-key (kbd "C-c w") 'w3m-google)

;; buffer operations
;;; rename-buffer
(global-set-key (kbd "C-c cr") 'rename-buffer)

;;; count-words
(global-set-key (kbd "C-c cw") 'count-words)

;; window management
;;; when a new window is open, don't display the same buffer
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

;; windmove (note that the defaults conflict with org mode)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; load-file
(global-set-key (kbd "C-c lf") 'load-file)

;; org mode shortcuts (for longer shortcuts, use prefix C-c o)
;;; make footnoting easier
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c a") 'org-footnote-new)))

;;; org-agenda
(global-set-key (kbd "C-c oa") 'org-agenda)

;;; go back to last clock
(global-set-key (kbd "C-c ol") 'org-clock-in-last)

;;; org capture
(global-set-key (kbd "C-c oc") 'org-capture)

;;; insert title at beginning of buffer
(defun org-insert-title ()
  "Move point to beginning of buffer and insert title."
  (interactive)
  (beginning-of-buffer)
  (insert "#+TITLE:"))

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c ot") 'org-insert-title)))

;;; insert quote marks
(defun org-insert-quote ()
  "Insert lines for quotations"
  (interactive)
  (evil-ret)
  (insert "#+BEGIN_QUOTE")
  (evil-ret)
  (evil-ret)
  (insert "#+END_QUOTE"))

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c oq") 'org-insert-quote)))

;;; latex citations
;;;; autocite
(defun org-insert-latex-autocite ()
  "Insert template for latex autocite citations in an org document"
  (interactive)
  (insert "@@latex:\\autocite[]{}@@")
  (evil-backward-char)
  (evil-backward-char)
  (evil-backward-char))

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c la") 'org-insert-latex-autocite)))

;;;; textcite
(defun org-insert-latex-textcite ()
  "Insert template for latex textcite citations in an org document"
  (interactive)
  (insert "@@latex:\\textcite[]{}@@")
  (evil-backward-char)
  (evil-backward-char)
  (evil-backward-char))

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c lt") 'org-insert-latex-textcite)))

; set up calendar
(setq calendar-latitude 51.6)
(setq calendar-longitude 0.175)
(setq calendar-location-name "London, UK")


; aesthetics
;; minimalism
(menu-bar-mode 1)
(toggle-scroll-bar 0)
(tool-bar-mode 0)

;: useable theme
(load-theme 'wombat t)

;; turn off that fucking noise
(setq visible-bell t)
(setq display-line-numbers 'relative)

; yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; org mode customisation
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(setq org-log-done 'time) ; timestamps for todo items

;; org mode clocking time
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 30) ; to be asked where I've been if I disappear

;; org mode exporting pdfs via latex - this is so that footnotes work as expected
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-pdf-process '("latexmk -pdf %f"))

;; todo items
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "WAITING(w)" "ASSIGNED(a)" "DONE(d)" "COMPLETED(c)" "KILLED(k)")))
(setq org-use-fast-todo-selection "auto")

;; org capture
(setq org-default-notes-file "~/Nextcloud/life_org/todo.org")

; text mode customisation
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

; set gnus to sync
(setq gnus-startup-file "~/Nextcloud/computer/config/linux/gnus/.newsrc")
(setq gnus-init-file "~/Nextcloud/computer/config/linux/gnus/.gnus")

; diary
(setq diary-file "~/Nextcloud/life_org/diary")

; syncing
;; make buffers reload when they're changed on another computer
(global-auto-revert-mode t)

;; update to the abbreviations list in Nextcloud
(setq abbrev-file-name "~/Nextcloud/computer/config/linux/emacs/abbreviations")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Nextcloud/life_org/paid_work.org" "~/Nextcloud/life_org/annual.org" "~/Nextcloud/life_org/cleaning.org" "~/Nextcloud/life_org/social.org" "~/Nextcloud/life_org/reading.org" "~/Nextcloud/life_org/exercise.org" "~/Nextcloud/life_org/todo.org" "~/Nextcloud/life_org/events.org"))
 '(package-selected-packages
   '(chess auto-complete w3m try use-package smudge pomodoro pdf-tools org-journal magit ereader emms)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
