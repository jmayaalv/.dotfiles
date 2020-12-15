;; set the file that contains known secrets. (GPG required)

(prelude-require-package 'gnu-elpa-keyring-update)
(setq auth-sources
      '((:source "~/.emacs.d/personal/authinfo.gpg")))
;(custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg2"))
