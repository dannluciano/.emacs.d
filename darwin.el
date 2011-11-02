;; Darwin

;; (set-frame-font "Menlo-12")


;; Textmate
(require 'textmate)
(require 'peepopen)
(textmate-mode)
(setq ns-pop-up-frames nil
  emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music/")
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)


;; Mac-friendley keys map
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
(global-set-key (kbd "<M-left>") 'backward-word)
(global-set-key (kbd "<M-right>") 'forward-word)
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "<M-s-right>") 'next-buffer)
(global-set-key (kbd "<M-s-left>") 'previous-buffer)
(global-set-key (kbd "<s-return>") 'ns-toggle-fullscreen)

;; (run-with-idle-timer 0.1 nil 'ns-toggle-fullscreen)
;; (run-with-idle-timer 0.1 nil 'frame-resize)
