(defun frame-resize ()
  "Default Frame resize"
  (interactive)
  (set-frame-position (selected-frame) (/ (display-pixel-width) 4) 0)
  (set-frame-width (selected-frame) (truncate (* (/ (display-pixel-width) 4) (/ 3 7.11))))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))

(defun speedbar-frame-resize ()
  "Speedbar Frame resize"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-width (selected-frame) (truncate (/ (/ (display-pixel-width) 4) 7.36)))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))

(global-set-key [(meta o)] 'other-frame)
(global-set-key [(meta s)] 'speedbar)

;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
