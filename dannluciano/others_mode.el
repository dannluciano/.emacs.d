(defun frame-resize ()
  "Default Frame resize"
  (interactive)
  (set-frame-position (selected-frame) (/ (display-pixel-width) 5) 0)
  (set-frame-width (selected-frame) (truncate (* (/ (display-pixel-width) 5) (/ 3 7.17))))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))

(defun speedbar-frame-resize ()
  "Speedbar Frame resize"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-width (selected-frame) (truncate (/ (/ (display-pixel-width) 5) 7.36)))
  (set-frame-height (selected-frame) (truncate (/ (display-pixel-height) 16.32))))

(defun setup-frames ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize)
  (speedbar)
  (speedbar-frame-resize))

(global-set-key [(meta o)] 'other-frame)

;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
