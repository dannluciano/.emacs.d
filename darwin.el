(message "Darwin")

(set-frame-font "Menlo-14")
(set-frame-position (selected-frame) (- (/ (display-pixel-width) 4) 0) 20);


;; Textmate
(require 'textmate)
(require 'peepopen)
(textmate-mode)
(setq ns-pop-up-frames nil)
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)


;; Mac-friendley keys map
(global-set-key (kbd "s-b") 'ibuffer)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-vertically)
(global-set-key (kbd "s-3") 'split-window-horizontally)
(global-set-key (kbd "s-5") 'eassist-switch-h-cpp)
(global-set-key (kbd "s-6") 'flymake-mode)
(global-set-key (kbd "s-7") 'ecb-activate)
(global-set-key (kbd "s-8") 'ecb-deactivate)
(global-set-key (kbd "s-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "<s-right>") 'end-of-line)
(global-set-key (kbd "<s-left>") 'beginning-of-line-text)
(global-set-key (kbd "<M-s-right>") 'next-buffer)
(global-set-key (kbd "<M-s-left>") 'previous-buffer)
(global-set-key (kbd "<s-return>") 'ns-toggle-fullscreen)

;; (run-with-idle-timer 0.1 nil 'ns-toggle-fullscreen)
