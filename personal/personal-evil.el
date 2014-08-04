(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
;; previous line stopped working so manual override
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(require 'evil)
(evil-mode 1)
(setq evil-shift-width 2)

;; use emacs keybindings in insert mode
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; use on text-mode and prog-mode
(add-hook 'text-mode-hook 'turn-on-evil-mode)
(add-hook 'prog-mode-hook 'turn-on-evil-mode)
(add-hook 'comint-mode-hook 'turn-on-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

;; set initial states
(evil-set-initial-state 'git-commit-mode 'insert)

;; remap keys
(defun evil-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location."
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

(evil-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(evil-move-key evil-motion-state-map evil-normal-state-map " ")

(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)

(define-key minibuffer-local-map "\C-p" nil)
(define-key minibuffer-local-map "\C-n" nil)

;; easier window resizing
(define-key evil-normal-state-map "+" 'evil-window-increase-width)
(define-key evil-normal-state-map "-" 'evil-window-decrease-width)
(define-key evil-normal-state-map (kbd "C-+") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "C--") 'evil-window-decrease-height)

;; return always indents
(evil-global-set-key 'insert (kbd "<RET>") 'evil-ret-and-indent)


(provide 'personal-evil)
