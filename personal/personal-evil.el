(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)

(require 'evil)

;; use on text-mode and prog-mode
(add-hook 'text-mode-hook 'turn-on-evil-mode)
(add-hook 'prog-mode-hook 'turn-on-evil-mode)
(add-hook 'comint-mode-hook 'turn-on-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

(require 'evil)

(evil-mode 1)
(setq evil-shift-width 2)


(provide 'personal-evil)
