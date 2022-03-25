;;; pfuture-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pfuture" "../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture.el"
;;;;;;  "a2757858c1186900ec77b031df20268b")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture.el

(autoload 'pfuture-new "pfuture" "\
Create a new future process for command CMD.
Any arguments after the command are interpreted as arguments to the command.
This will return a process object with additional 'stderr and 'stdout
properties, which can be read via (process-get process 'stdout) and
\(process-get process 'stderr) or alternatively with
\(pfuture-result process) or (pfuture-stderr process).

Note that CMD must be a *sequence* of strings, meaning
this is wrong: (pfuture-new \"git status\")
this is right: (pfuture-new \"git\" \"status\")

\(fn &rest CMD)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "pfuture" "../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pfuture" '("pfuture-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/pfuture-20211229.1513/pfuture.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pfuture-autoloads.el ends here
