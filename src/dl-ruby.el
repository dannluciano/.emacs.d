;; (require 'rvm)
;; (rvm-use-default)

(autoload 'mustache-mode "Mustache Mode" t)

(add-to-list 'load-path (concat dotfiles-dir "vendor/rhtml"))
(autoload 'rhtml-mode "Rhtml Mode" t)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
