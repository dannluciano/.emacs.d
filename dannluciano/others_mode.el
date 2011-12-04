(defvar *width* (display-pixel-width))
(defvar *height* (display-pixel-height))

(defun frame-resize ()
  "Default Frame resize"
  (interactive)
  (set-frame-position (selected-frame) (/ (display-pixel-width) 5) 0)
  (set-frame-width (selected-frame) (truncate (* (/ *width* 5) (/ 4 7.17))))
  (set-frame-height (selected-frame) (truncate (/ *height* 16.32))))

(defun speedbar-frame-resize ()
  "Default Speedbar Frame resize"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-width (selected-frame) (truncate (* (/ *width* 5) (/ 1 7.17))))
  (set-frame-height (selected-frame) (truncate (/ *height* 16.32))))

(defun setup-frames ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize))

(global-set-key [(meta o)] 'other-frame)
(global-set-key [(control tab)] 'speedbar)

(defvar stack-trace-on-error ())

;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
