(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

