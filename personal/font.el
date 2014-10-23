(cond ((member "Monaco" (font-family-list))
       (if (or (eq system-type 'darwin)
               (string-equal (getenv "DESKTOP_SESSION") "gnome"))
         (set-face-attribute 'default nil :font "Monaco 14")
         (set-face-attribute 'default nil :font "Monaco 12")))
      ((member "Monaco for Powerline" (font-family-list))
        (set-face-attribute 'default nil :font "Monaco for Powerline 14")))

