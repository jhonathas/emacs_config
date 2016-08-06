(message "- packages configurations...")

;; Melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Marmalade
(require 'package)
(add-to-list 'package-archives
'("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;



;; LOCAL PACKAGES

;; Integration emacs with Dash
(add-to-list 'load-path "~/.emacs.d/plugins/dash/")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cf" 'dash-at-point)
(global-set-key "\C-ck" 'dash-at-point-with-docset)


;; INSTALLED PACKAGES

;; Yasnippet - A template system for Emacs
(unless (package-installed-p 'yasnippet) (package-refresh-contents)
        (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (directory-files "~/.emacs.d/snippets" t))
(setq yas-prompt-functions
      '(yas-dropdown-prompt
        yas-ido-prompt
        yas-x-prompt
        yas-completing-prompt
        yas-no-prompt))

;; Syntax highlighting for Slim
(unless (package-installed-p 'slim-mode) (package-refresh-contents)
  (package-install 'slim-mode))

;; yaml-mode
(unless (package-installed-p 'yaml-mode)  (package-refresh-contents)
	(package-install 'yaml-mode))

;;flycheck for on the fly syntax checking
(unless (package-installed-p 'flycheck) (package-refresh-contents)
  (package-install 'flycheck))
(add-hook 'after-init-hook 'global-flycheck-mode)

;; multiple-cursors
(unless (package-installed-p 'multiple-cursors) (package-refresh-contents)
  (package-install 'multiple-cursors))

;; Projectile is a project interaction library for Emacs
(unless (package-installed-p 'projectile) (package-refresh-contents)
  (package-install 'projectile))
(projectile-global-mode)

;; Fuzzy matching for Emacs ... a la Sublime Text.
(unless (package-installed-p 'flx-ido) (package-refresh-contents)
  (package-install 'flx-ido))
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; Expand-region - extension to increase selected region by semantic units
;; (unless (package-installed-p 'expand-region)
;;   (package-install 'expand-region))
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)


;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


;; INSTALL MODES

(unless (package-installed-p 'elixir-mode) (package-refresh-contents)
  (package-install 'elixir-mode))

(unless (package-installed-p 'css-mode) (package-install 'css-mode)) (package-refresh-contents)
(unless (package-installed-p 'ruby-mode) (package-install 'ruby-mode)) (package-refresh-contents)
(add-hook 'html-mode-hook 'emmet-mode)
(unless (package-installed-p 'css-mode) (package-install 'css-mode)) (package-refresh-contents)
(unless (package-installed-p 'ruby-mode) (package-install 'ruby-mode)) (package-refresh-contents)
