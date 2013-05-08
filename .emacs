(add-to-list 'load-path "~/.emacs.d")

;; Package management.
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'php-mode)
(require 'node-mode)
(require 'drupal-mode)
(require 'flymake)
(require 'flymake-cursor)
(require 'markdown-mode)
(require 'symfony-mode)

(load "node-mode")
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
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.js" . node-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.test$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; Use spaces by default.
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq css-indent-offset 2)

;; Show line and column number.
(setq line-number-mode t)
(setq column-number-mode t)

;; Nice refresh feature.
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))

(global-set-key [f5] 'refresh-file)
(global-set-key (kbd "C-x C-g") 'helm-locate)

;; Add PHP syntax checking.
(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'php-mode-hook (lambda() (flymake-mode 1)))
(add-hook 'drupal-mode-hook (lambda() (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/fabsor/.emacs.d/ac-dict")
(ac-config-default)

;(add-hook 'php-mode-hook
;(lambda ()
; (require 'php-completion)
; (php-completion-mode t)
; (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))


(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(when (load "flymake" t)
  (defun flymake-jslint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		              'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "jslint" (list "--terse" "--indent=2" "--nomen=true" local-file))))

  (setq flymake-err-line-patterns
	(cons '("^\\(.*\\)(\\([[:digit:]]+\\)):\\(.*\\)$"
		1 2 nil 3)
	            flymake-err-line-patterns))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init))

  (require 'flymake-cursor)
)

(add-hook 'js2-mode-hook
	    (lambda ()
      (flymake-mode 1)
      (define-key js2-mode-map "\C-c\C-n" 'flymake-goto-next-error)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(less-css-compile-at-save t)
 '(less-css-lessc-options (quote ("-rp ../components/bootstrap/less/")))
 '(scroll-bar-mode nil)
 '(shell-switcher-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#A9B7C6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Droid Sans Mono"))))
 '(cursor ((t (:background "orange"))))
 '(error ((t (:foreground "forest green" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "red"))))
 '(font-lock-keyword-face ((t (:foreground "red"))))
 '(font-lock-variable-name-face ((t (:foreground "OrangeRed1"))))
 '(variable-pitch ((t (:background "dark red" :family "Sans Serif")))))
