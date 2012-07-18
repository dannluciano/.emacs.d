;; A partial list of the better known C styles:
;;     “gnu”: The default style for GNU projects
;;     “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;;     “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;;     “stroustrup”: What Stroustrup, the author of C++ used in his book
;;     “linux”: What the Linux developers use for kernel development
;;     “python”: What Python developers use for extension modules
;;     “java”: The default style for java-mode (see below)
;;     “user”: When you want to define your own style

;; C Common Mode
(defun my-c-common-hook()
  (require 'member-function)
  (local-set-key "\C-cm" 'expand-member-functions)
  (turn-on-auto-fill))
(add-hook 'c-mode-hook 'my-c-common-hook)
(add-hook 'c++-mode-hook 'my-c-common-hook)

;; C Mode
(defun my-c-hook()
  (c-set-style "gnu"))
(add-hook 'c-mode-hook 'my-c-hook)


;; C++ Mode
(defun my-cpp-hook()
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-cpp-hook)

(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))

;; SourcePair
(require 'sourcepair)
(setq sourcepair-source-path '("." "../src"))
(setq sourcepair-header-path '("." "../include"))
(global-set-key (kbd "s-5") 'sourcepair-load)



;; Semantic Mode
(semantic-mode 1)
(require 'semantic/sb)
(global-semantic-highlight-func-mode 1)


(defun find-makefile ()
  (let ((fn buffer-file-name))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/Makefile")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setf dir (file-truename (concat dir "/.."))))
      (if (file-exists-p (concat dir "/Makefile"))
          (flymake-mode)))))
(add-hook 'c-mode-hook 'find-makefile)
(add-hook 'c++-mode-hook 'find-makefile)
