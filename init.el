;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>

;; Benchmarking
(defvar *emacs-load-start* (current-time))

(require 'cl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "8b49009d04730bc5d904e7bb5c7ff733f3f9615c3d6b3446eca0766e6da2bea1" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "d589f8adcca47e586469f7719e11a1d3ead95d13bf365ac0ae15b04fa6ca7c93" "b7553781f4a831d5af6545f7a5967eb002c8daeee688c5cbf33bf27936ec18b3" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" default)))
 '(flymake-gui-warnings-enabled nil)
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
)

;; Dann Luciano
(setq user-full-name "Dann Luciano")
(setq user-mail-address "dannluciano@gmail.com")
(setq user-site "http://dannluciano.com.br")

(defvar *dl-x* 0)
(defvar *dl-y* 0)
(defvar *dl-width* 80)
(defvar *dl-height* 40)


;; Set Encondig UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; PATH
(push "/usr/local/bin" exec-path)
(push "/usr/texbin" exec-path)
(push "/usr/local/gcc/bin" exec-path)


;; Default Dot Files Directory
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
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


(when (string-equal (prin1-to-string system-type) "darwin")
  (require 'dl-darwin))

(when (string-equal (prin1-to-string system-type) "gnu/linux")
  (require 'dl-gnu-linux))

(when (string-equal system-name "dl-macbook.local")
  (require 'dl-macbook))

(when (string-equal system-name "dl-imac.local")
  (require 'dl-imac))

(require 'dlcorp)

;; Menu Mode
(if (window-system)
    (if (fboundp 'menu-bar-mode) (menu-bar-mode t))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode 0)))


;; Speedbar
(setq speedbar-use-images nil)
(load "sr-speedbar.el")
(setq sr-speedbar-right-side nil)
(global-set-key [(control tab)] 'sr-speedbar-toggle)


;; UX
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq pop-up-windows nil)
(setq column-number-mode t)

(whitespace-mode t)
(server-start)


;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
