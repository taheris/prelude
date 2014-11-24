(defun my-go-mode-hook ()
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)

  ; Remove imports binding
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports))

(add-hook 'go-mode-hook 'my-go-mode-hook)
(exec-path-from-shell-copy-env "GOPATH")
