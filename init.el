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
 '(custom-safe-themes (quote ("222166d219e827e44d4f38442fe39888e2140d3383173f789b284808efa518c4" "adeab0646e21115b96a5e92dfe5169056d9a91130d144243856b04aa23ec463b" "537ca47d1757056f1dc230479a800976fd507062450885af518a07a6d09b5a8b" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "374e79a81930979e673b8e0869e135fb2450b18c6474ca145f104e0c6f003267" "532391a2cfb814f71f90d104f49841cdf6f97a2bc0bd37ebd0d521c2e906416b" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "69349beba557a65bb06f89b28b8fd2890c742f07" "1f392dc4316da3e648c6dc0f4aad1a87d4be556c" "1440d751f5ef51f9245f8910113daee99848e2c0" "e254937cba0f82c2d9eb3189a60748df9e486522" "485737acc3bedc0318a567f1c0f5e7ed2dfde3fb" "d14db41612953d22506af16ef7a23c4d112150e5" default)))
 '(desktop-save-mode t nil (desktop))
 '(fringe-mode (quote (10 . 10)) nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(indicate-buffer-boundaries nil)
 '(save-place t nil (saveplace))
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
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))


;; ELPA
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
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
(setq system-type-specific-config
      (concat dotfiles-dir (prin1-to-string system-type) ".el"))
(if (file-exists-p system-type-specific-config)
    (load system-type-specific-config))


;; Speedbar
(load-file (concat dotfiles-dir "/elpa/sr-speedbar-0.1.8/sr-speedbar.elc"))
(setq speedbar-use-images nil
      sr-speedbar-right-side nil)
(global-set-key [(control tab)] 'sr-speedbar-toggle)


;; UX
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq pop-up-windows nil)
(setq column-number-mode t)

;; (if (fboundp 'display-battery-mode) (display-battery-mode t))

;; Color Theme
;; (if window-system
;; (load-theme 'solarized-dark)
;; (load-theme 'wombat)


(whitespace-mode t)
(eshell)
(sr-speedbar-toggle)
(other-window 1)
(server-start)

;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
