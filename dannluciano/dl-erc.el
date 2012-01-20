;; ERC Mode
(setq erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt
                                   netsplit networks noncommands
                                   readonly ring smiley sound stamp
                                   spelling track)))

(setq erc-server "irc.freenode.net"
  erc-port 6667
  erc-nick "dannluciano"
  erc-user-full-name user-full-name
  erc-prompt-for-password t)

(require 'erc-match)
    (setq erc-keywords '("dannluciano"))

(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-server-buffer-on-quit t)
