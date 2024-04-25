(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

; muh minimalism
(setq initial-scratch-message "Statement of values. \n\n
   1. Preparation is the key to success. \n
   2. Know what you know. \n
   3. Eliminate stupidity.")

;; Call the custom startup function
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(use-package diminish
  :config 
    (diminish 'flyspell-mode)
    (diminish 'abbrev-mode)
    (diminish 'visual-line-mode))

; easier movement
(windmove-default-keybindings)

(electric-pair-mode 1)

(load-file "~/.openaikey.el")

(use-package chatgpt
  :ensure t)

;; try
(use-package try
  :commands try)

;; which key
(use-package which-key
  :diminish
  :config 
    (which-key-mode)
    (setq which-key-idle-delay 0.5))

(use-package magit
  :bind ("C-c m" . magit))

(use-package evil
  :config
  (evil-mode t))

(global-auto-revert-mode t)
(global-visual-line-mode t)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'abbrev-mode)

(setq abbrev-file-name "~/dots/emacs/abbreviations")

;; delete selected text when you start typing
(delete-selection-mode)

;; yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; to make the references work
(setq org-latex-pdf-process '("latexmk -pdf %f"))
(setq org-list-allow-alphabetical t)

;; searching and shit
(use-package ivy
  :diminish
  :config (ivy-mode 1)
  :bind 
    (("C-s" . swiper-isearch)
    ("C-r" . swiper-isearch-backward)))

;; projectile
(use-package projectile
  :diminish
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package counsel
  :ensure t
  :bind
  (("C-c c" . 'counsel-org-capture))
  )

(setq org-capture-templates
      ; for todo tasks
             '(("t" "Todo"  entry
               (file "~/life_org/todo.org")
               "* TODO %?")
	       ; for daily dasks
	       ("d" "Daily"  entry
               (file "~/life_org/daily.org")
               "* TODO %?")))

(use-package org-journal
  :ensure t
  :init
  (setq org-journal-dir "~/journal/") ; Default directory for one of the journals
  :config
  ;; Define a function to switch between journals
  (defun switch-to-journal (journal-dir)
    (interactive "DSelect the journal directory: ")
    (setq org-journal-dir journal-dir)
    (org-journal-new-entry nil))
  :bind
  (("C-c j" . switch-to-journal))
)

(use-package ivy-rich
  :init (ivy-rich-mode 1))

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

;; pdf-reader
(use-package pdf-tools
  :config (pdf-tools-install))

(define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward-regexp)

; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode 0)))

;; get the eshell up
(global-set-key (kbd "C-c t") 'eshell)

;; imenu
(global-set-key (kbd "C-c i") 'imenu)

;; org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

; trying to get org graphs to work
(setq org-habit-graph-column 65)
(setq org-habit-show-habits-only-for-today nil)

(use-package org-roam
    :ensure t
    :custom
    (org-roam-directory "~/roam") 
    (org-roam-completion-everywhere t)
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n i" . org-roam-node-insert)
           :map org-mode-map
           ("C-M-i" . completion-at-point))

    :config
    (org-roam-setup)
    (org-roam-db-autosync-mode)) ; is this line necessary?

 (setq org-roam-capture-templates
       '(("c" "concept" plain
          "%?"
         :if-new (file+head "concept/${slug}.org"
                            "#+title: ${title}\n#+filetags:\n#+bibliography: ~/roam/bibliography.bib\n")
         :immediate-finish t
         :unnarrowed t)
        ("l" "literature" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n#+filetags:")
         :immediate-finish t
         :unnarrowed t)
        ("f" "fleeting" plain "%?" ; may replace this with some org-capture random notes
         :if-new
         (file+head "fleeting/${title}.org" "#+title: ${title}\n#+filetags:")
         :immediate-finish t
         :unnarrowed t)
	("p" "project" plain "%?" ; list of project todos
         :if-new
         (file+head "projects/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)))

;; set specific browser to open links
(setq browse-url-browser-function 'eww)
(setq browse-url-secondary-browser-function 'browse-url-firefox)

(global-set-key (kbd "C-c r") 'count-words-region)


;; eww
(global-set-key (kbd "C-c e") 'eww)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/bvs/timetable.org" "/home/telemachus/life_org/daily.org" "/home/telemachus/life_org/todo.org" "/home/telemachus/life_org/annual.org" "/home/telemachus/life_org/habits_gtd.org"))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(package-selected-packages
   '(evil ada-ref-man ack ada-mode chatgpt org-journal ace-window org-drill org-capture org-roam zenburn-theme which-key try projectile pdf-tools magit ivy-rich helpful diminish counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
