;;; vlf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vlf" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf.el"
;;;;;;  "cb1be39f324b2a5b4b943e427c9713fd")
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf.el

(autoload 'vlf "vlf" "\
View Large FILE in batches.  When MINIMAL load just a few bytes.
You can customize number of bytes displayed by customizing
`vlf-batch-size'.
Return newly created buffer.

\(fn FILE &optional MINIMAL)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vlf" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf" '("vlf-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-base" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-base.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-base.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-base" '("vlf-")))

;;;***

;;;### (autoloads nil "vlf-ediff" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-ediff.el"
;;;;;;  "c8a56503f2a050b961cd273eee53989b")
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-ediff.el

(autoload 'vlf-ediff-files "vlf-ediff" "\
Run batch by batch ediff over FILE-A and FILE-B.
Files are processed with VLF with BATCH-SIZE chunks.
Requesting next or previous difference at the end or beginning
respectively of difference list, runs ediff over the adjacent chunks.

\(fn FILE-A FILE-B BATCH-SIZE)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vlf-ediff" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-ediff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-ediff.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-ediff" '("vlf-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-follow" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-follow.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-follow.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-follow" '("vlf-")))

;;;***

;;;### (autoloads nil "vlf-occur" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-occur.el"
;;;;;;  "a07bc881ce8cc909ad6ad5b873ad927f")
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-occur.el

(autoload 'vlf-occur-load "vlf-occur" "\
Load serialized `vlf-occur' results from current buffer." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "vlf-occur" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-occur.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-occur.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-occur" '("vlf-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-search" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-search.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-search.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-search" '("vlf-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-setup" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-setup" '("dired-vlf" "vlf-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-tune" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-tune.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-tune.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-tune" '("vlf-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "vlf-write" "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-write.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-write.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vlf-write" '("vlf-")))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-base.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-ediff.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-follow.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-occur.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-search.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-setup.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-tune.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf-write.el"
;;;;;;  "../../../../.emacs.d/elpa/vlf-20191126.2250/vlf.el") (0
;;;;;;  0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vlf-autoloads.el ends here
