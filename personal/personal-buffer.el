;; auto revert buffers
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)

;; highlight symbol mode
(require 'highlight-symbol)
(highlight-symbol-nav-mode)
(global-set-key (kbd "<C-f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f3>") 'highlight-symbol-next)
(global-set-key (kbd "<S-f3>") 'highlight-symbol-prev)
(global-set-key (kbd "<M-f3>") 'highlight-symbol-query-replace)
