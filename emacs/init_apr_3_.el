;  PACKAGES

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package doom-themes
  :diminish
  :config (load-theme 'doom-dark+ t nil))

(use-package doom-modeline
  :diminish
  :config (doom-modeline-mode 1))

(use-package try
  :diminish)

(use-package diminish
  :config (diminish 'abbrev-mode)
  (diminish 'flyspell-mode)
  (diminish 'visual-line-mode))

(use-package marginalia
  :config (marginalia-mode 1))

;; projectile for searching projects
(use-package projectile
  :defer t
  :diminish
  :config (projectile-mode 1)
  :bind-keymap ("C-c p" . projectile-command-map)
  )

;; swiper
(use-package swiper
  :defer t
  :diminish
  :bind ("C-s" . swiper)
  ("C-r" . 'swiper-backward))
  
;; company
(use-package company
  :diminish
  :config (global-company-mode 1))

(use-package org-modern
  :diminish
  :config (add-hook 'org-mode-hook 'org-modern-mode))

;; emms
(use-package emms
  :config (emms-all)
  (setq emms-player-list '(emms-player-mpv))
  (setq emms-info-functions '(emms-info-native emms-info-metaflac))
  :bind ("C-c e" . emms-pause)
  ("C-c E" . emms))

(use-package pdf-tools
  :diminish)

; BASIC CONFIGURATION

; turn off tool bar
(tool-bar-mode -1)
; get rid of the fucking bell
(setq visible-bell 1)
; answer questions in a quicker way
(fset 'yes-or-no-p 'y-or-n-p)
; make lines by wrapping lines only where there is whitespace
(word-wrap-whitespace-mode)
; complete quotes and parantheses
(electric-pair-mode)
(electric-quote-mode)
;; make text delete when you start typing
(delete-selection-mode 1)
; icomplete
(icomplete-vertical-mode 1)
(setq completion-styles '(partial-completion))

; KEYBINDINGS
(keymap-global-set "C-c w" 'count-words)
(keymap-global-set "C-c a" 'org-agenda-list)

; HOOKS

;; add all the hooks
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(setq org-list-allow-alphabetical t)
(setq org-default-notes-file "~/life_org/todo.org")
(keymap-global-set "C-c t" 'org-capture)
;; autocorrect for programming
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; mode-specific
;;; emacs-lisp
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (keymap-set emacs-lisp-mode-map "C-c C-c" 'comment-or-uncomment-region)))
(with-eval-after-load 'icomplete
  (define-key icomplete-minibuffer-map [?\C-m] 'icomplete-force-complete-and-exit))

(setq abbrev-file-name "~/dots/emacs/abbreviations")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6a5584ee8de384f2d8b1a1c30ed5b8af1d00adcbdcd70ba1967898c265878acf" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" default))
 '(org-agenda-files
   '("/home/telemachus/life_org/daily.org" "/home/telemachus/life_org/todo.org" "/home/telemachus/life_org/annual.org" "/home/telemachus/life_org/habits_gtd.org"))
 '(package-selected-packages
   '(pdf-tools org-modern emms doom-modeline doom-themes marginalia try company diminish swiper projectile markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
