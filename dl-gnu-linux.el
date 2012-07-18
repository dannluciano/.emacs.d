;; GNU/Linux
;; (set-default-font "Monospace-14")


;; Textmate
(require 'textmate)
(textmate-mode)


(cua-mode)


;; GNU/Linux friendley keys map
(global-set-key (kbd "<s-return>") 'toggle-fullscreen)


(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

;; (run-with-idle-timer 0.1 nil 'toggle-fullscreen)


;; ERC Nick Notify
(autoload 'erc-nick-notify-mode "erc-nick-notify"
  "Minor mode that calls 'erc-nick-notify-cmd'
when his nick gets mentioned in an erc channel" t)
(eval-after-load 'erc '(erc-nick-notify-mode t))
