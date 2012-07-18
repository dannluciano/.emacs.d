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
