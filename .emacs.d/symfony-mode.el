;;; symfony-mode.el --- major mode for Symfony coding

;;;###autoload
(define-derived-mode symfony-mode php-mode "Symfony"
  "Major mode for Symfony coding.\n\n\\{symfony-mode-map}"
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq show-trailing-whitespace t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
  (run-mode-hooks 'symfony-mode-hook)
)
(provide 'symfony-mode)