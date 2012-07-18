;; Aspell Mode
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "pt_BR")
(add-hook 'latex-mode-hook 'flyspell-mode)
(require 'battery)
(when (and battery-status-function
           (not (string-match-p "N/A"
                                (battery-format "%B"
                                                (funcall battery-status-function)))))
  (display-battery-mode 1))
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
;; Debuggers config
(setq gdb-show-main t
      gdb-many-windows t)
;; Edit Mode
(setq fill-column 80
      delete-selection-mode t
      blink-cursor-mode t
      doc-view-continuous t
      indent-tabs-mode nil)

;; (cua-mode t)
(whitespace-mode)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(require 'yasnippet-bundle)
(yas/load-directory (concat dotfiles-dir "/snippets"))
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(require 'emms-i18n)
;; (require 'emms-info)
;; (require 'emms-info-mp3info)
;; (require 'emms-info-ogginfo)
;; (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
;; (add-to-list 'emms-info-functions 'emms-info-mp3info)
;; (add-to-list 'emms-info-functions 'emms-info-ogginfo)
;; (setq emms-track-description-function 'emms-info-track-description)

(setq emms-player-list '(emms-player-mplayer
                         emms-player-mpg321
                         emms-player-ogg123))

(require 'emms-playlist-mode)
(setq emms-playlist-buffer-name "*Music*")
(setq emms-playlist-default-major-mode 'emms-playlist-mode)

(add-hook 'emms-player-finished-hook 'emms-next)

;; (require 'emms-mode-line)
;; (emms-mode-line 1)

;; (require 'emms-playing-time)
;; (emms-playing-time 1)

(require 'emms-lyrics)
(emms-lyrics 1)

;; (require 'dl-xwl-emms)
;; ERC Mode
(setq erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt
                                   netsplit networks noncommands
                                   readonly ring smiley sound stamp
                                   spelling track)))

;; (setq erc-server-coding-system '(utf-8 . utf-8))
(setq erc-server "irc.freenode.net"
      erc-port 6667
      erc-nick "dannluciano"
      erc-user-full-name user-full-name
      erc-prompt-for-password t)

(require 'erc-match)
(setq erc-keywords '("dannluciano"))

(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-server-buffer-on-quit t)
;; Eshell
;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat "[" (eshell/pwd) "]"
;;                 (if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
(setq eshell-cmpl-cycle-completions nil)

(setq path "/Users/dannluciano/.rbenv/shims:/usr/local/mysql/bin:/usr/local/gcc/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/usr/local/bin:/usr/X11/bin")
(setenv "PATH" path)
;; Flyspell
(auto-compression-mode t)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(defvar *dl-x* 0)
(defvar *dl-y* 0)
(defvar *dl-width* 80)
(defvar *dl-height* 40)

(defun frame-resize (frame x y width height)
  "Default Frame resize"
  (set-frame-position frame x y)
  (set-frame-width frame width)
  (set-frame-height frame height)
  (set-default-font "16"))


(defun setup-frame ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize (selected-frame) *dl-x* *dl-y* *dl-width* *dl-height*))

(defun create-frame-hook (frame)
  "Default Hook Called After a Create Frame"
  (with-selected-frame frame
    (when (display-graphic-p)
      (frame-resize frame *dl-x* *dl-y* *dl-width* *dl-height*)
      (load-theme 'solarized-dark))))

(create-frame-hook (selected-frame))

(add-hook 'after-make-frame-functions 'create-frame-hook)
(autoload 'gimme "gimme" "launch GIMME" t)
;; Git
(require 'magit)
(global-set-key (kbd "s-g") 'magit-status)
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "dannluciano@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "dannluciano.com.br")
;; GO Game
(autoload 'gnugo "gnugo" "Play Go" t)
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; source: https://github.com/technomancy/emacs-starter-kit/blob/v2/modules/starter-kit-bindings.elb
;; It's all about the project.
(global-set-key (kbd "C-c f") 'find-file-in-project)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(global-set-key [(meta o)] 'other-window)


(require 'textmate)
(textmate-mode)

;; Keys Maps
(global-set-key (kbd "s-b") 'ibuffer)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-vertically)
(global-set-key (kbd "s-3") 'split-window-horizontally)
(global-set-key (kbd "s-6") 'flymake-mode)
(global-set-key (kbd "s-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "<s-right>") 'end-of-line)
(global-set-key (kbd "<s-left>") 'beginning-of-line-text)

;; (global-set-key (kbd "<M-s-right>") 'next-buffer)
;; (global-set-key (kbd "<M-s-left>") 'previous-buffer)

(global-set-key (kbd "<M-left>") 'backward-word)
(global-set-key (kbd "<M-right>") 'forward-word)
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)

(global-set-key (kbd "<C-M-up>") 'windmove-up)
(global-set-key (kbd "<C-M-down>") 'windmove-down)

(global-unset-key (kbd "<C-M-right>"))
(global-unset-key (kbd "<C-M-left>"))
(local-unset-key (kbd "<C-M-right>"))
(local-unset-key (kbd "<C-M-left>"))

(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-left>") 'windmove-left)
;; LATEX
(setq TeX-PDF-mode t)


;; This section is extracted from
;;; prelude-latex.el --- Emacs Prelude: Sane setup for LaTeX writers.
;;
;; Copyright (c) 2011 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar.batsov@gmail.com>
;; URL: http://www.emacswiki.org/cgi-bin/wiki/Prelude
(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")
        (output-html "HTML Viewer")))
;; this section is good for OS X only
;; TODO add sensible defaults for Linux/Windows
(setq TeX-view-program-list
      '(("DVI Viewer" "open %o")
        ("PDF Viewer" "open %o")
        ("HTML Viewer" "open %o")))
;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
(autoload 'ess "ESS" nil)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
;; (require 'rvm)
;; (rvm-use-default)

(autoload 'mustache-mode "Mustache Mode" t)

(add-to-list 'load-path (concat dotfiles-dir "vendor/rhtml"))
(autoload 'rhtml-mode "Rhtml Mode" t)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-timer-interval 300)
(provide 'dlcorp)
