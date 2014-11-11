(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)

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

;; remap keys
(defun evil-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location."
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

(evil-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(evil-move-key evil-motion-state-map evil-normal-state-map " ")

(define-key evil-normal-state-map "\C-b" 'universal-argument)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)

(define-key minibuffer-local-map "\C-p" nil)
(define-key minibuffer-local-map "\C-n" nil)

;; evil leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer)
(evil-leader/set-key "h" 'dired-jump)
(evil-leader/set-key "v" 'split-window-right)
(evil-leader/set-key "e" 'pp-eval-last-sexp)
(evil-leader/set-key "," 'other-window)
(evil-leader/set-key "b" 'helm-buffers-list)
(evil-leader/set-key "x" 'helm-M-x)

;; easier window resizing
(define-key evil-normal-state-map "+" 'evil-window-increase-width)
(define-key evil-normal-state-map "-" 'evil-window-decrease-width)
(define-key evil-normal-state-map (kbd "C-+") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "C--") 'evil-window-decrease-height)

;; return always indents
(evil-global-set-key 'insert (kbd "<RET>") 'evil-ret-and-indent)

;; magit keybindings
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'magit-mode 'normal)
(evil-set-initial-state 'magit-status-mode 'normal)
(evil-set-initial-state 'magit-diff-mode 'normal)
(evil-set-initial-state 'magit-log-mode 'normal)

(evil-define-key 'normal magit-mode-map
  "j" 'magit-goto-next-section
  "k" 'magit-goto-previous-section)
(evil-define-key 'normal magit-log-mode-map
  "j" 'magit-goto-next-section
  "k" 'magit-goto-previous-section)
(evil-define-key 'normal magit-diff-mode-map
  "j" 'magit-goto-next-section
  "k" 'magit-goto-previous-section)

;; dired keybindings
(require 'dired-x)

(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)))

(evil-define-key 'normal dired-mode-map
  "h" 'my-dired-up-directory
  "l" 'dired-find-alternate-file
  "o" 'dired-sort-toggle-or-edit
  "v" 'dired-toggle-marks
  "m" 'dired-mark
  "u" 'dired-unmark
  "U" 'dired-unmark-all-marks
  "c" 'dired-create-directory
  "n" 'evil-search-next
  "N" 'evil-search-previous
  "q" 'kill-this-buffer)

