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


; KEYBINDINGS
(keymap-global-set "C-c w" 'count-words)


; add all the hooks
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(setq org-list-allow-alphabetical t)
(setq org-default-notes-file "~/life_org/todo.org")
(keymap-global-set "C-c t" 'org-capture)
; autocorrect for programming
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setq abbrev-file-name "~/dots/emacs/abbreviations")

; PACKAGES

(use-package diminish
  :config (diminish 'abbrev-mode)
  (diminish 'flyspell-mode)
  (diminish 'visual-line-mode))

;; projectile for searching projects
(use-package projectile
  :defer t
  :diminish
  :config (projectile-mode 1)
  :bind-keymap ("C-c p" . projectile-command-map)
  )

;; ivy
(use-package ivy
  :defer t
  :diminish
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))
  
;; swiper
(use-package swiper
  :defer t
  :diminish
  :bind ("C-s" . swiper)
  ("C-r" . 'swiper-backward))

;; counsel
(use-package counsel
  :defer t
  :bind ("C-x f" . 'counsel-find-file)
  ("C-x b" . 'counsel-ibuffer)
  ("M-x" . 'counsel-M-x))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/telemachus/life_org/daily.org" "/home/telemachus/life_org/todo.org" "/home/telemachus/life_org/annual.org" "/home/telemachus/life_org/habits_gtd.org"))
 '(package-selected-packages '(diminish counsel swiper ivy projectile markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
