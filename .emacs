(add-to-list 'load-path "~/.emacs.d")

(require 'drupal-mode)
(load "drupal-mode")

(autoload 'geben "geben" "Xdebug FTW" t)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'conf-windows-mode "conf-windows-mode" "Mode for info files." t)

(add-to-list 'auto-mode-alist '("\\.php$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.test$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.profile$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))
(add-to-list 'auto-mode-alist '("\\.make" . conf-windows-mode))

(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq line-number-mode t)
(setq column-number-mode t)