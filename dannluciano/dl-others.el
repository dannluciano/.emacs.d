(defvar *width* (display-pixel-width))
(defvar *height* (display-pixel-height))
(defvar *squares* (cond
                   ((eq *width* 1280) 5)
                   ((eq *width* 1680) 6)
                   (t 1)
                   ))

(defun frame-resize ()
  "Default Frame resize"
  (interactive)
  (set-frame-position (selected-frame) (/ (display-pixel-width) *squares*) 0)
  (set-frame-width (selected-frame) (truncate (/ (/ *width* *squares*) 1.79487179)))
  (set-frame-height (selected-frame) (truncate (/ *height* 16.32))))


(defun setup-frames ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize)
  ;; (ecb-minor-mode)
  ;; (delete-other-windows)
  )

(global-set-key [(meta o)] 'other-window)

;; (defvar stack-trace-on-error ())

;; Recompile Function
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))
