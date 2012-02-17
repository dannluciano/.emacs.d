;; Darwin
(set-frame-font "Monaco-12")


;; Peep Open
(require 'peepopen)
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)

(setq ns-pop-up-frames nil
  emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music/")


;; Mac friendley keys maps
(global-set-key (kbd "<s-return>") 'ns-toggle-fullscreen)

;; (run-with-idle-timer 0.1 nil 'ns-toggle-fullscreen)


;; Growl Notification
(defvar growlnotify-command (executable-find "growlnotify") "The path to growlnotify")

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (let* ((process (start-process "growlnotify" nil
                                   growlnotify-command
                                   (encfn title)
                                   "-a" "Emacs"
                                   "-n" "Emacs")))
      (process-send-string process (encfn message))
      (process-send-string process "\n")
      (process-send-eof process)))
  t)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)
