;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>
;; Very much influenced by
;;   https://github.com/technomancy/emacs-starter-kit
;;   https://github.com/topfunky/emacs-starter-kit
;;   https://github.com/dimiro1/.emacs

;; Benchmarking
(defvar *emacs-load-start* (current-time))

;; Initial Options
(setq user-full-name "Dann Luciano")
(setq user-mail-address "dannluciano@gmail.com")

(push "/usr/local/bin" exec-path)
(push "/usr/texbin" exec-path)

(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin" ":" "/usr/texbin/"))

(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(setq auto-save-default nil)
(setq TeX-PDF-mode t)
(setq indent-tabs-mode nil)
(setq-default tab-width 2)
(setq ispell-local-dictionary "pt_BR")
(setq ispell-program-name "/usr/local/bin/aspell")
(setq inhibit-startup-screen t)
;; (setq ns-command-modifier 'meta)
(setq
 backup-by-copying t ;; don't clobber symlinks
 backup-directory-alist ;; don't litter
 '(("." .  "~/.emacs.d/autosaves/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ;; use versioned backups
(fset 'yes-or-no-p 'y-or-n-p)
(set-fringe-style -1)
(tooltip-mode -1)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; Set Encondig UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-enable t nil (desktop))
 '(global-font-lock-mode t nil (font-lock))
 '(save-place t nil (saveplace))
 '(speedbar-after-create-hook (quote (speedbar-frame-reposition-smartly speedbar-frame-resize)))
 '(speedbar-use-images nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; LoadPath
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auctex"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auctex/preview"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/nxhtml"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/twittering-mode"))


;; IBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Aspell
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "pt_BR")
(add-hook 'latex-mode-hook 'flyspell-mode)


;; Autopair
(require 'autopair)
(autopair-global-mode)


;; ELPA
(require 'package)
(setq package-archives '(
       ("ELPA" . "http://tromey.com/elpa/")
       ("gnu" . "http://elpa.gnu.org/packages/")
       ("marmalade" . "http://marmalade-repo.org/packages/")
))
(add-to-list 'load-path (concat dotfiles-dir "/elpa"))
(package-initialize)


;; Color-Theme
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
;;(require 'color-theme-ir-black)
;;(color-theme-ir-black)
(require 'color-theme-solarized)
(color-theme-solarized-dark)


;; YASnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))


;; WhiteSpace
(require 'whitespace)


;; Edit Mode
(setq column-number-mode t
      fill-column 80
      show-paren-mode t
      delete-selection-mode t
      blink-cursor-mode t
      doc-view-continuous t)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))


;; Eshell
(require 'ansi-color)
(require 'eshell)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
    eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)


;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))


;; C Mode
;; A partial list of the better known C styles:
;;     “gnu”: The default style for GNU projects
;;     “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;;     “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;;     “stroustrup”: What Stroustrup, the author of C++ used in his book
;;     “linux”: What the Linux developers use for kernel development
;;     “python”: What Python developers use for extension modules
;;     “java”: The default style for java-mode (see below)
;;     “user”: When you want to define your own style

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

(defun my-c-common-hook()
  (require 'member-function)
  (local-set-key "\C-cm" 'expand-member-functions)
  (turn-on-auto-fill))
(add-hook 'c-mode-hook 'my-c-common-hook)
(add-hook 'c++-mode-hook 'my-c-common-hook)

(defun my-c-hook()
  (c-set-style "gnu"))
(add-hook 'c-mode-hook 'my-c-hook)

(defun my-cpp-hook()
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-cpp-hook)

(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))


;; Erlang
(autoload 'erlang-mode "erlang-mode" "Mode for editing ERLANG files")
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))


;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Mode for editing markdown files")
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;; Textile
(autoload 'textile-mode "textile-mode" "Mode for editing textile files")
(add-to-list 'auto-mode-alist '("\\.textile$" . textile-mode))


;; Ruby Mode
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))


(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))


(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))


;; LaTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)


;; ESHELL
;; Part of the Emacs Starter Kit
(setq eshell-cmpl-cycle-completions nil
  eshell-save-history-on-exit t
  eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(defvar eshell-vc-dirty
  " $ " "String to use for the prompt when there are uncomitted checkins.")

(defun eshell-vc-prompt ()
  "Return a prompt with VC branch and dirty state."
  (let ((branch (eshell/branch)))
    (propertize (concat (eshell/pwd)
                        (and branch (concat " (" (concat branch ") ")))
                        (cond ((= (user-uid) 0) "# ")
                              ((and branch (eshell/vc-dirty)) eshell-vc-dirty)
                              (t "$ ")))
                'face 'eshell-prompt)))

(defun eshell-vc-skip-prompt ()
  "Skip the prompt using text properties instead of a regex."
  (goto-char (next-property-change (point) nil (point-max))))

(require 'magit)
(defalias 'eshell/branch 'magit-get-current-branch)
(defun eshell/vc-dirty () (not (magit-everything-clean-p)))

(setq eshell-prompt-function #'eshell-vc-prompt
      eshell-skip-prompt-function #'eshell-vc-skip-prompt)


;; SourcePair
(require 'sourcepair)
(global-set-key (kbd "s-5") 'sourcepair-load)


;; Semantic Mode
(semantic-mode 1)
(require 'semantic/sb)
(global-semantic-decoration-mode 1)
(global-semantic-highlight-func-mode 1)
(setq semantic-decoration-styles
  (quote (("semantic-decoration-on-includes")
          ("semantic-decoration-on-protected-members" . t)
          ("semantic-decoration-on-private-members" . t)
          ("semantic-tag-boundary"))))


;; Auto Insert Header
;; (require 'autoinsert)
;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; (setq auto-insert-directory "~/.mytemplates/") ;;; Or use custom, *NOTE* Trailing slash important
;; (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
;; (define-auto-insert "\.py" "my-python-template.py")
;; (define-auto-insert "\.php" "my-php-template.php")


;; LISP
(defun my-lisp-hook ()
  (require 'quack))
(add-hook 'lisp-mode 'my-lisp-hook)


;; ERC
(setq erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring smiley sound stamp spelling track)))
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


;; Flyspell
(auto-compression-mode t)
(add-hook 'text-mode-hook 'turn-on-flyspell)


;; View Mode
(global-unset-key [(meta o)])
(global-set-key [(meta o)] 'other-frame)
(global-set-key [(meta s)] 'speedbar)


;; GO Game
(autoload 'gnugo "gnugo" "Play Go" t)


;; HTMLIZE
(autoload 'htmlize "htmlize" "HTMLize" t)


;; NxHtml
(autoload 'autostart "nxhtml" "NXHTML" t)


;; EMMS
(require 'emms-setup)
(require 'emms-mode-line)
(require 'emms-playing-time)
(require 'emms-lyrics)
;; (emms-devel)
(emms-standard)
(emms-default-players)
(setq emms-playlist-buffer-name "*Musics*")
(emms-mode-line 1)
(emms-playing-time 1)
(emms-lyrics 1)
(require 'xwl-emms)


;; Twittering
(require 'twittering-mode)
(setq twittering-icon-mode t)
(add-hook 'twittering-edit-mode-hook (lambda () (ispell-minor-mode) (flyspell-mode)))


;; OTHERS
(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'coding-hook 'add-watchwords)

(defun frame-resize ()
  (interactive)
	(set-frame-position (selected-frame) (/ (display-pixel-width) 4) 0)
  (set-frame-width (selected-frame) (truncate (* (/ (display-pixel-width) 4) (/ 3 7.11))))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))

(defun speedbar-frame-resize ()
  (interactive)
	(set-frame-position (selected-frame) 0 0)
  (set-frame-width (selected-frame) (truncate (/ (/ (display-pixel-width) 4) 7.44)))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))


(defun kill-current-line ()
  "Kill the current line, no matter where the cursor is."
  (interactive)
  (textmate-select-line) (kill-region (region-beginning) (region-end)))
(global-set-key [(control shift k)] 'kill-current-line)


;; System and User Configurations
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      system-type-specific-config (concat dotfiles-dir (prin1-to-string system-type) ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p system-type-specific-config) (load system-type-specific-config))

;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
