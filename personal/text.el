(defun my-visual-line-enable ()
  (visual-line-mode t))

(add-hook 'markdown-mode-hook 'my-visual-line-enable)

