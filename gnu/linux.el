(message "GNU/Linux")
(cua-mode)
(set-default-font "Monospace-14")

(global-set-key (kbd "A-b") 'list-buffers)
(global-set-key (kbd "A-0") 'delete-window)
(global-set-key (kbd "A-1") 'delete-other-windows)
(global-set-key (kbd "A-2") 'split-window-vertically)
(global-set-key (kbd "A-3") 'split-window-horizontally)
(global-set-key (kbd "A-5") 'eassist-switch-h-cpp)
(global-set-key (kbd "A-6") 'flymake-mode)
(global-set-key (kbd "A-7") 'ecb-activate)
(global-set-key (kbd "A-8") 'ecb-deactivate)
(global-set-key (kbd "A-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<A-right>") 'next-buffer)
(global-set-key (kbd "<A-left>") 'previous-buffer)



(defun toggle-fullscreen (&optional f)
	(interactive)
	(let ((current-value (frame-parameter nil 'fullscreen)))
		(set-frame-parameter nil 'fullscreen
												 (if (equal 'fullboth current-value)
														 (if (boundp 'old-fullscreen) old-fullscreen nil)
													 (progn (setq old-fullscreen current-value)
																	'fullboth)))))

(run-with-idle-timer 0.1 nil 'toggle-fullscreen)
