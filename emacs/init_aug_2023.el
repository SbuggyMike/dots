(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

; muh minimalism
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(use-package diminish
  :config 
    (diminish 'flyspell-mode)
    (diminish 'abbrev-mode)
    (diminish 'visual-line-mode))

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
             '(("t" "Todo"  entry
               (file "~/life_org/todo.org")
               "* TODO %?" :empty-lines 1)
	     ("b" "Adverbs" entry
              (file+headline "~/life_org/german.org" "Adverbs")
              "* Adverb :drill:\n%^{German}\n** Back\n%^{English}\n")
             ("j" "Adjectives" entry
              (file+headline "~/life_org/german.org" "Adjectives")
              "* Adjective :drill:\n%^{German}\n** Back\n%^{English}\n")
             ("v" "Verbs" entry
              (file+headline "~/life_org/german.org" "Verbs")
              "* Verb :drill:\n%^{German}\n** Back\n%^{English}\n")
             ("n" "Nouns" entry
              (file+headline "~/life_org/german.org" "Nouns")
              "* Noun :drill:\n%^{German}\n** Back\n%^{English}\n")))

(use-package org-drill
  :ensure t
  :bind ("C-c d" . 'org-drill))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/life_org/annual.org" "/home/telemachus/life_org/habits_gtd.org"))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(package-selected-packages
   '(org-drill org-capture org-roam zenburn-theme which-key try projectile pdf-tools magit ivy-rich helpful diminish counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
