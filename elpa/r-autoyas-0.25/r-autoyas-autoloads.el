;;; r-autoyas-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "r-autoyas" "r-autoyas.el" (20205 33623))
;;; Generated autoloads from r-autoyas.el

(add-hook 'ess-mode-hook '(lambda nil (require 'r-autoyas nil t) (when (featurep 'r-autoyas) (set (make-local-variable 'yas/fallback-behavior) '(apply r-autoyas-expand-maybe)) (when (boundp 'autopair-handle-action-fns) (set (make-local-variable 'autopair-handle-action-fns) (list #'autopair-r-autoyas-paren-action))) (yas/minor-mode 1) (when (boundp 'yas/after-exit-snippet-hook) (add-hook 'yas/after-exit-snippet-hook (lambda nil (interactive) (when r-autoyas-wrap-on-exit (r-autoyas-wrap))) t t)))))

;;;***

;;;### (autoloads nil nil ("r-autoyas-pkg.el") (20205 33623 228038))

;;;***

(provide 'r-autoyas-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; r-autoyas-autoloads.el ends here
