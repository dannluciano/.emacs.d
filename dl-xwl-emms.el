;; Track Show Format (for playlist buffer)

(eval-after-load "emms"
  '(progn

     (setq xwl-emms-playlist-last-track nil)
     (setq xwl-emms-playlist-last-indent "\\")

     (defun xwl-emms-track-description-function (track)
       "Return a description of the current track."
       (let* ((name (emms-track-name track))
              (type (emms-track-type track))
              (short-name (file-name-nondirectory name))
              (play-count (or (emms-track-get track 'play-count) 0))
              (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
              (empty "..."))
         (prog1
             (case (emms-track-type track)
               ((file url)
                (let* ((artist (or (emms-track-get track 'info-artist) empty))
                       (playing-time (or (emms-track-get track 'info-playing-time) 0))
                       (min (/ playing-time 60))
                       (sec (% playing-time 60))
                       (album (or (emms-track-get track 'info-album) empty))
                       (tracknumber (emms-track-get track 'info-tracknumber))
                       (short-name (file-name-sans-extension
                                    (file-name-nondirectory name)))
                       (title (or (emms-track-get track 'info-title) short-name))

                       ;; last track
                       (ltrack xwl-emms-playlist-last-track)
                       (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                                    empty))
                       (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                                   empty))

                       (same-album-p (and (not (string= lalbum empty))
                                          (string= album lalbum))))

                  (format "%-40s | %-40s | %-40s"
                          artist

                          album

                          ;; Combine indention, tracknumber, title.
                          (concat
                           (if (and tracknumber ; tracknumber
                                    (not (zerop (string-to-number tracknumber))))
                               (format "%02d." (string-to-number tracknumber))
                             "")
                           title ; title
                           ))))
               ((url)
                (concat (symbol-name type) ":" name))
               (t
                (format "%-3d%s"
                        play-count
                        (concat (symbol-name type) ":" name))))
           (setq xwl-emms-playlist-last-track track))))

     (setq emms-track-description-function
           'xwl-emms-track-description-function)
     ))

(provide 'dl-xwl-emms)
