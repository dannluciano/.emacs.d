;; Eshell
;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat "[" (eshell/pwd) "]"
;;                 (if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
(setq eshell-cmpl-cycle-completions nil)

(setq path "/Users/dannluciano/.rbenv/shims:/usr/local/mysql/bin:/usr/local/gcc/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/usr/local/bin:/usr/X11/bin")
(setenv "PATH" path)
