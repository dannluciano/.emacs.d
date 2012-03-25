(defun frame-resize (x y width height)
  "Default Frame resize"
  (set-frame-position (selected-frame) x y)
  (set-frame-width (selected-frame) width)
  (set-frame-height (selected-frame) height))


(defun setup-frames ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize *dl-x* *dl-y* *dl-width* *dl-height*))

(global-set-key [(meta o)] 'other-window)

;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
