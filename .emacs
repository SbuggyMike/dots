(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 

; vim mode - I only really want this for editing text, but by god I need it
(require 'evil)
(evil-mode t)

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

; org mode customisation
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(setq org-log-done 'time) ; timestamps for todo items

; text mode customisation
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
								      
; make org evaluate 
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(slime evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
