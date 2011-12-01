;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>
;; Benchmarking
(defvar *emacs-load-start* (current-time))


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
(defvar my-packages '(starter-kit)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Menu Mode and Frames Setup
(if (fboundp 'menu-bar-mode) (menu-bar-mode t))
(if window-system
    (setup-frames)
  (if (fboundp 'menu-bar-mode) (menu-bar-mode 0)))



;; You can keep system- or user-specific customizations here
(setq system-type-specific-config (concat dotfiles-dir (prin1-to-string system-type) ".el"))
(if (file-exists-p system-type-specific-config) (load system-type-specific-config))


;; Color Theme
(require 'color-theme)
;; (require 'color-theme-actress)
;; (require 'color-theme-blackboard)
;; (require 'color-theme-complexity)
;; (require 'color-theme-dpaste)
;; (require 'color-theme-eclipse)
;; (require 'color-theme-github)
;; (require 'color-theme-ir-black)
;; (require 'color-theme-railscasts)
(require 'color-theme-solarized)
;; (require 'color-theme-tango)
;; (require 'color-theme-tangotango)
;; (require 'color-theme-wombat)
;; (require 'color-theme-zenburn)
;; (color-theme-blackboard)

(if window-system
    (color-theme-solarized-dark)
  (load-theme 'wombat))


(global-hl-line-mode -1)
(hl-line-mode -1)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(server-start)


;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-enable t nil (desktop))
 '(desktop-save-mode t nil (desktop))
 '(global-font-lock-mode t nil (font-lock))
 '(save-place t nil (saveplace))
 '(speedbar-use-images nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit fdf6e3)))))
