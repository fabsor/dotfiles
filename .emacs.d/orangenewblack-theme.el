(deftheme orangenewblack
  "Created 2013-08-19.")

(custom-theme-set-variables
 'orangenewblack
 '(scroll-bar-mode nil)
 '(column-number-mode t)
 '(tool-bar-mode nil))

(custom-theme-set-faces
 'orangenewblack
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#A9B7C6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Droid Sans Mono"))))
 '(cursor ((t (:background "orange"))))
 '(error ((t (:foreground "forest green" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "red"))))
 '(font-lock-keyword-face ((t (:foreground "red"))))
 '(font-lock-variable-name-face ((t (:foreground "OrangeRed1"))))
 '(variable-pitch ((t (:background "dark red" :family "Sans Serif")))))

(provide-theme 'orangenewblack)
