;; Disable startup screen.
(setq inhibit-startup-screen t)

;; Disable toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable scrolling.
(scroll-bar-mode -1)

;; Disable cursor blink.
(blink-cursor-mode -1)

;; Load Zenburn color theme.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; Set Monaco as default font.
(set-default-font "Monaco-13")

(provide 'ui)