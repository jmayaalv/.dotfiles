;; Tramp defaults
(setq auth-source-debug t)
(setq tramp-default-user "devel.jmayaalv")
(setq tramp-default-method "ssh")
(setq tramp-chunksize 500)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))
