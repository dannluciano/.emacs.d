;; Edit Mode
(setq fill-column 80
      delete-selection-mode t
      blink-cursor-mode t
      doc-view-continuous t
      indent-tabs-mode nil)


(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
