;; auto revert buffers
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)

;; highlight symbol mode
(require 'highlight-symbol)
(highlight-symbol-nav-mode)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
