;; Edit Mode
(setq fill-column 80
      delete-selection-mode t
      blink-cursor-mode t
      doc-view-continuous t
      indent-tabs-mode nil)

;; (cua-mode t)
(whitespace-mode)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(require 'yasnippet-bundle)
(yas/load-directory (concat dotfiles-dir "/snippets"))
