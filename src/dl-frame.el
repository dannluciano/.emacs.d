(defun frame-resize (frame x y width height)
  "Default Frame resize"
  (set-frame-position frame x y)
  (set-frame-width frame width)
  (set-frame-height frame height)
  (set-default-font "16"))


(defun setup-frame ()
  "Setup Initial Frame and Speedbar"
  (interactive)
  (frame-resize (selected-frame) *dl-x* *dl-y* *dl-width* *dl-height*))

(defun create-frame-hook (frame)
  "Default Hook Called After a Create Frame"
  (with-selected-frame frame
    (when (display-graphic-p)
      (frame-resize frame *dl-x* *dl-y* *dl-width* *dl-height*)
      (load-theme 'solarized-dark))))

(create-frame-hook (selected-frame))

(add-hook 'after-make-frame-functions 'create-frame-hook)
