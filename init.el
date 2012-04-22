;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>
;; Benchmarking

(defvar *emacs-load-start* (current-time))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(custom-safe-themes (quote ("d589f8adcca47e586469f7719e11a1d3ead95d13bf365ac0ae15b04fa6ca7c93" "b7553781f4a831d5af6545f7a5967eb002c8daeee688c5cbf33bf27936ec18b3" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" default)))
 ;; '(desktop-save-mode t nil (desktop))
 '(global-font-lock-mode t nil (font-lock))
 '(save-place t nil (saveplace))
 '(sendmail-query-once-function (quote smtpmail-send-it) t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit fdf6e3)))))


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
(add-to-list 'load-path (concat dotfiles-dir "dannluciano"))
(add-to-list 'load-path (concat dotfiles-dir "vendor"))



;; ELPA
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit textmate sr-speedbar)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; You can keep system- or user-specific customizations here
(setq system-type-specific-config (concat dotfiles-dir (prin1-to-string system-type) ".el"))

(if (file-exists-p system-type-specific-config)
    (load system-type-specific-config))


;; Menu Mode
(if (window-system)
    (if (fboundp 'menu-bar-mode) (menu-bar-mode t))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode 0)))


;; Speedbar
(load-file (concat dotfiles-dir "/elpa/sr-speedbar-0.1.8/sr-speedbar.el"))
(setq speedbar-use-images nil
      sr-speedbar-right-side nil)
(global-set-key [(control tab)] 'sr-speedbar-toggle)


;; UX
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq pop-up-windows nil)
(setq column-number-mode t)


;; Color Theme
;; (if (window-system)
;; (load-theme 'solarized-dark))
;; (load-theme 'wombat))

;; (if (window-system)
;; (run-with-idle-timer 0.1 nil 'setup-frames))

(whitespace-mode t)
;; (eshell)
;; (sr-speedbar-toggle)
;; (other-window 1)
(server-start)

;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
