;;; node-mode.el --- major mode for Node coding

;;;###autoload
(define-derived-mode node-mode js-mode "Node"
  "Major mode for NodeJS coding.\n\n\\{node-mode-map}"
  (setq c-basic-offset 2)
  (setq standard-indent 2)
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (setq fill-column 78)
  (setq show-trailing-whitespace t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (run-mode-hooks 'node-mode-hook)
)
(provide 'node-mode)
