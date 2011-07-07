(set-frame-font "Menlo-14")

;; Textmate

(require 'textmate)
(require 'peepopen)
(textmate-mode)
(setq ns-pop-up-frames nil)
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)


;; Mac-friendley keys map

(global-set-key (kbd "s-b") 'list-buffers)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-vertically)
(global-set-key (kbd "s-3") 'split-window-horizontally)
(global-set-key (kbd "s-5") 'eassist-switch-h-cpp)
(global-set-key (kbd "s-6") 'flymake-mode)
(global-set-key (kbd "s-7") 'ecb-activate)
(global-set-key (kbd "s-8") 'ecb-deactivate)
(global-set-key (kbd "s-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<s-right>") 'next-buffer)
(global-set-key (kbd "<s-left>") 'previous-buffer)