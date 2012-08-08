;; (require 'rvm)
;; (rvm-use-default)

(autoload 'mustache-mode "Mustache Mode" t)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rhtml"))
(autoload 'rhtml-mode "rhtml-mode.el" "Rhtml Mode" t nil)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
