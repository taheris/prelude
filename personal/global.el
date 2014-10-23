;; auto revert buffers
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)

;; fast window switching
(global-set-key (kbd "s-h") 'evil-window-left)
(global-set-key (kbd "s-j") 'evil-window-down)
(global-set-key (kbd "s-k") 'evil-window-up)
(global-set-key (kbd "s-l") 'evil-window-right)

;; smartparens mode
(setq sp-autoescape-string-quote nil)

;; tab size
(setq tab-width 4)
(setq default-tab-width 4)
