(if (member "Monaco" (font-family-list))
  (if (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monaco 14")
    (set-face-attribute 'default nil :font "Monaco 12")))
