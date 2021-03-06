;; Darwin.el
;; (set-frame-font "Monaco-16")

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))


;; Peep Open
(require 'textmate)
(require 'peepopen)
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)

(setq ns-pop-up-frames nil
  emms-source-file-default-directory "~/Music/all/")


;; Mac friendley keys maps
(global-set-key (kbd "<s-return>") 'ns-toggle-fullscreen)
;; (run-with-idle-timer 0.1 nil 'ns-toggle-fullscreen)


;; Growl Notification
(defvar growlnotify-command (executable-find "growlnotify") "The path to growlnotify")

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (start-process "growlnotify" nil growlnotify-command (encfn title) "-a" "Emacs" "-n" "Emacs" "-m" (encfn message))) t)


(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: " erc-nick " mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)

(provide 'dl-darwin)
