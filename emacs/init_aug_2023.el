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
  :bind
  (("C-c c" . 'counsel-org-capture))
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
