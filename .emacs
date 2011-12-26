(add-to-list 'load-path "~/.emacs.d")

(require 'drupal-mode)
(require 'flymake)
(require 'php-mode)
(require 'w3m-load)
(require 'geben)

(load "drupal-mode")

(autoload 'geben "geben" "Xdebug FTW" t)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'conf-windows-mode "conf-windows-mode" "Mode for info files." t)

;; Some nice mappings.
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

;; Nice refresh feature.
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))

(global-set-key [f5] 'refresh-file)

;; Add PHP syntax checking.
(add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
(add-hook 'drupal-mode-hook (lambda() (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/fabsor/.emacs.d/ac-dict")
(ac-config-default)

(add-hook 'php-mode-hook
(lambda ()             
 (require 'php-completion)
 (php-completion-mode t)
 (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))