; PACKAGES
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; diminish
(use-package diminish
  :config 
    (diminish 'flyspell-mode)
    (diminish 'abbrev-mode)
    (diminish 'visual-line-mode))

(use-package elfeed)

(setq elfeed-db-directory "~/repos/dots/emacs/elfeed")

(setq elfeed-feeds
     '("https://archlinux.org/feeds/news"
     "https://www.reddit.com/r/archlinux.rss"
     "https://www.reddit.com/r/linux.rss"
     "https://www.reddit.com/r/emacs.rss"
     "https://planet.emacslife.com/atom.xml"
     "https://hnrss.org/frontpage"
     "https://www.reddit.com/r/cricket.rss"
     "https://www.innertemplelibrary.com/feed/"
     "https://www.innertemplelibrary.com/category/trusts/feed/"
     ))

(global-set-key (kbd "C-c r" ) 'elfeed)
     

;; emms
(use-package emms
  :config (emms-default-players)
  :bind
   (("s-m SPC" . 'emms-pause)
    ("s-m n" . 'emms-next)
    ("s-m N" . 'emms-cue-next)
    ("s-m p" . 'emms-previous)
    ("s-m P" . 'emms-cue-previous)
    ("s-m d" . 'emms-add-directory)
    ("s-m f" . 'emms-add-file)
    ("s-m b" . 'emms-bookmarks-add)
    ("s-m B" . 'emms-bookmarks-next)
    ("s-m s" . 'emms-stop)
    ("s-m u" . 'emms-add-url)
    ("s-m x" . 'emms-add-playlist-file)
    ("s-m e" . 'emms)))
(emms-all)
(emms-default-players)

;; searching and shit
(use-package ivy
  :diminish
  :config (ivy-mode 1)
  :bind 
    (("C-s" . swiper-isearch)
    ("C-r" . swiper-isearch-backward)))

(use-package counsel)

(use-package ivy-rich
  :config (ivy-rich-mode 1))

;; better help
(use-package helpful
  :custom 
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
  :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))

;; magit
(use-package magit)

(use-package org-journal
  :init (setq org-journal-dir "~/private_writings/journal/"))

;; org
(use-package org)

;; pdf-reader
(use-package pdf-tools
  :config (pdf-tools-install))

(define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward-regexp)

;; projectile
(use-package projectile
  :diminish
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :diminish
  :config (counsel-projectile-mode))
  
;; try
(use-package try
  :commands try)

;; which key
(use-package which-key
  :diminish
  :config 
    (which-key-mode)
    (setq which-key-idle-delay 0.1))

(use-package writeroom-mode)

; NON-INIT.EL CONFIG
;; 1. Swap caps and ctrl - this is not what you typically do

; AESTHETICS
;; theme
(load-theme 'modus-operandi t)

;; make text more readable
;;; wrap lines
(global-visual-line-mode t)
;;; highlight current line hopefully in a way that makes it relative
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; make screen bigger
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

; BUFFER SHIT
;; reload buffers
(global-auto-revert-mode t)

;; I always want to kill this buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

; GLOBAL KEYBINDINGS
;; get the eshell up
(global-set-key (kbd "C-c t") 'eshell)

;; eww
(global-set-key (kbd "C-c e") 'eww)
(setq eww-search-prefix "https://duckduckgo.com/")
(setq browse-url-browser-function 'browse-url-firefox
      browse-url-new-window-flag  t
      browse-url-firefox-new-window-is-tab t)

;; imenu
(global-set-key (kbd "C-c i") 'imenu)

;; load-file
(global-set-key (kbd "C-c lf") 'load-file)

;; org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;; go back to last clock
(global-set-key (kbd "C-c ol") 'org-clock-in-last)

;; org capture
(global-set-key (kbd "C-c c") 'counsel-org-capture)
(setq org-default-notes-file "~/life_org/capture.org")

;; yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; disable line numbers for various modes
(dolist (mode '(eshell-mode-hook eww-mode-hook helpful-mode-hook info-mode-hook elfeed-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode -1))))

; MACROS
(load-file "~/repos/dots/emacs/macros.el")

; MODE-SPECIFIC SHIT
;; elisp
;;; stop newline fucking up old line
(add-hook 'elisp-mode-hook (local-set-key (kbd "C-m") 'electric-indent-just-newline))

;; text
;;; flyspell
(add-hook 'text-mode-hook 'flyspell-mode)
;;; use abbreviations
(add-hook 'text-mode-hook 'abbrev-mode)

;; org
;;; flyspell
(add-hook 'org-mode-hook 'flyspell-mode)

;;; use abbreviations
(add-hook 'org-mode-hook 'abbrev-mode)

;;; org mode clocking time
(setq org-log-done 'time)

;;; timestamps for todo items
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;; export as latex pdf
(setq org-latex-pdf-process '("latexmk -pdf %f"))

;; todo items
(setq org-todo-keywords
      '((sequence "TODO(t)" "STRT(s)" "WAIT(w)" "HOLD(h)" "|" "ASSIGN(a)" "DONE(d)" "KILL(k)")))
(setq org-use-fast-todo-selection "auto")

;; footnotes
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c f") #'org-footnote-new)))

; PERSONAL INFO
;; calendar
(setq calendar-latitude 51.6)
(setq calendar-longitude 0.175)
(setq calendar-location-name "London, UK")

;; name
(setq user-full-name "Stephen Hawes"
      user-mail-address "s.j.hawes@btinternet.com")

;; time
(setq display-time-world-list '(("Europe/London" "London") ("Asia/Shanghai" "China") ("America/New_York" "Eastern")))

; TEXT-EDITING
;; use a dictionary
(flyspell-mode t)
(setq ispell-dictionary "english")

;; update to the abbreviations list in dots repo dir
(setq abbrev-file-name "~/repos/dots/emacs/abbreviations")

;; delete selected text when you start typing
(delete-selection-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Nextcloud/life_org/paid_work.org" "~/Nextcloud/life_org/annual.org" "~/Nextcloud/life_org/cleaning.org" "~/Nextcloud/life_org/social.org" "~/Nextcloud/life_org/reading.org" "~/Nextcloud/life_org/exercise.org" "~/Nextcloud/life_org/todo.org" "~/Nextcloud/life_org/events.org" "~/Nextcloud/misc_law/fru/fru_todo.org"))
 '(package-selected-packages '(elfeed magit pdf-tools use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
