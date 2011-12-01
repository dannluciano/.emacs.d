;; Eshell
;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat "[" (eshell/pwd) "]"
;;                 (if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
(setq eshell-cmpl-cycle-completions nil)
