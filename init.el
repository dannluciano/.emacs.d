;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>
;; Benchmarking
(defvar *emacs-load-start* (current-time))

;; Initial Options
(setq user-full-name "Dann Luciano")
(setq user-mail-address "dannluciano@gmail.com")
(message "Hi %s <%s>" user-full-name user-mail-address)


;; Set Encondig UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; PATH
(push "/usr/local/bin" exec-path)
(push "/usr/texbin" exec-path)
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin" ":" "/usr/texbin/"))


;; Default Dot Files Directory
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)


;; ELPA
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;; You can keep system- or user-specific customizations here
(setq system-type-specific-config (concat dotfiles-dir (prin1-to-string system-type) ".el")
      system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)
(if (file-exists-p system-type-specific-config) (load system-type-specific-config))
(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))


(setq visible-bell 1)
(setq ring-bell-function 'ignore)


;; Setup Frames
(frame-resize)
(speedbar)
(speedbar-frame-resize)


;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
