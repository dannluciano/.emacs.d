(require 'emms-setup)
(emms-standard)
(emms-default-players)

(require 'emms-i18n)
;; (require 'emms-info)
;; (require 'emms-info-mp3info)
;; (require 'emms-info-ogginfo)
;; (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
;; (add-to-list 'emms-info-functions 'emms-info-mp3info)
;; (add-to-list 'emms-info-functions 'emms-info-ogginfo)
;; (setq emms-track-description-function 'emms-info-track-description)

(setq emms-player-list '(emms-player-mplayer
                         emms-player-mpg321
                         emms-player-ogg123))

(require 'emms-playlist-mode)
(setq emms-playlist-buffer-name "*Music*")
(setq emms-playlist-default-major-mode 'emms-playlist-mode)

(add-hook 'emms-player-finished-hook 'emms-next)

;; (require 'emms-mode-line)
;; (emms-mode-line 1)

;; (require 'emms-playing-time)
;; (emms-playing-time 1)

(require 'emms-lyrics)
(emms-lyrics 1)

;; (require 'dl-xwl-emms)
