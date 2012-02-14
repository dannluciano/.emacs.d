;; ERC Mode
(setq erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt
                                   netsplit networks noncommands
                                   readonly ring smiley sound stamp
                                   spelling track)))

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
