(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

; muh minimalism
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(use-package modus-themes)
(load-theme 'modus-vivendi)

(use-package helm
  :init
  (setq completion-styles '(flex))
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-b" . helm-mini)
  (:map helm-map
	("C-i" . helm-execute-persistent-action)
	("C-j" . helm-select-action)))
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-M-x-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t))

(use-package elfeed
  :init
     (setq elfeed-feeds
     '("https://archlinux.org/feeds/news"
     "https://www.reddit.com/r/archlinux.rss"
     "https://www.reddit.com/r/linux.rss"
     "https://www.reddit.com/r/emacs.rss"
     "https://planet.emacslife.com/atom.xml"
     "https://hnrss.org/frontpage"
     "https://lukesmith.xyz/index.xml"
     "https://www.reddit.com/r/cricket.rss"
     "https://www.innertemplelibrary.com/feed/"
     "https://www.innertemplelibrary.com/category/trusts/feed/"
     "https://www.reddit.com/r/ukpolitics.rss"
     "https://stallman.org/rss/rss.xml"
     "https://www.thetimes.co.uk/tto/news/rss"
     "http://feeds.bbci.co.uk/news/politics/rss.xml"
     "http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/front_page/rss.xml"
     "https://www.ft.com/world/uk?format=rss"
     "https://www.reddit.com/r/chess.rss"
     "https://www.reddit.com/r/classicalmusic.rss"))
     (setq elfeed-db-directory "~/dots/emacs/elfeed")
  :bind (("C-c r" . 'elfeed)))


(use-package magit
  :bind ("C-c m" . magit))

(use-package emms
  :config
  (emms-default-players)
  (emms-all)
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

(global-auto-revert-mode t)
(global-visual-line-mode t)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'org-mode-hook 'abbrev-mode)
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "KILL")))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") '(find-file "$HOME/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'eww)
(global-set-key (kbd "C-c l") 'org-clock-in-last)
(global-set-key (kbd "C-c t") 'eshell)

(setq org-agenda-files (list "~/life_org/todo.org" "~/life_org/gtd.org" "~/life_org/habits_gtd.org"))

(setq abbrev-file-name "~/dots/emacs/abbreviations")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3ab376acffab6b4e79ae2b6e0a1cce3fa21dbac0027f0ff0dfef02b5c838dba9" "3199be8536de4a8300eaf9ce6d864a35aa802088c0925e944e2b74a574c68fd0" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(emms magit use-package-hydra ivy use-package modus-themes))
 '(safe-local-variable-values '((git-commit-major-mode . git-commit-elisp-text-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

