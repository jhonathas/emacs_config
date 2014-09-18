(message "- editor configurations...")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set UTF-8 as default coding system.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Prevent "encoding magic comment" on ruby-mode.
(setq ruby-insert-encoding-magic-comment nil)

;; Highlight matched and mismatched parenthesis.
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Use 2 spaces to indent code instead of tabs.
(setq indent-tabs-mode nil)
(setq ruby-deep-indent-paren nil)
(setq-default tab-width 2)
(setq ruby-indent-level 2)
(setq js-indent-level 2)

;; Delete the selection with a keypress.
(delete-selection-mode t)

;; Change mac command key
;; (if (eq system-type 'darwin)
;; 		(progn
;; 			(setq mac-command-modifier 'meta)
;; 			(setq mac-option-modifier 'super)))

;; Open recents files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Enable delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; backup and auto save.
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Dired: reuse current buffer by pressing 'a'.
(put 'dired-find-alternate-file 'disabled nil)

;; Enable iBuffer
(iswitchb-mode)

;; Auto revert file
;; Auto reload file when changed on another editor
(global-auto-revert-mode 1)

;; Load Zenburn color theme.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; Disable startup screen.
(setq inhibit-startup-screen t)

;; Disable toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable scrolling.
(scroll-bar-mode -1)

;; Disable cursor blink.
(blink-cursor-mode -1)

;; Highlight the current line.
(global-hl-line-mode +1)

;; Show line numbers with an empty space after each number.
(global-linum-mode 1)
(setq linum-format "%d ")

;; Set Monaco as default font on mac
(if (eq system-type 'darwin) (set-default-font "Monaco-14"))

;; automatically insert the right matching bracket
(electric-pair-mode 1)

;; Enable IDO.
(require 'ido)
(ido-mode t)
;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
	(define-key ido-completion-map (kbd "C-n") 'ido-next-match)
	(define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)


;; ==================================================
;;               AUTO MODES
;; ==================================================

;; Ruby
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru\\'" . ruby-mode))

;; Web-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))

;; Emmet
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; ORG mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))


;; Start fullscreen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
