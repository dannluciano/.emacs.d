;; Aspell Mode
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "pt_BR")
(add-hook 'latex-mode-hook 'flyspell-mode)
