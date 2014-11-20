(defun my-text-mode ()
  (progn
    (flyspell-mode t)
    (visual-line-mode t)))

(add-hook 'markdown-mode-hook 'my-text-mode)

