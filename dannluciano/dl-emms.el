;; EMMS
(require 'emms)
(require 'emms-setup)
(require 'emms-mode-line)
(require 'emms-playing-time)
(emms-standard)
(emms-default-players)
(setq emms-playlist-buffer-name "*Musics*")
(emms-mode-line 1)
(emms-playing-time 1)
(require 'xwl-emms)
