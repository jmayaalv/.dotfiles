;;; marginalia-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "marginalia" "../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia.el"
;;;;;;  "1eab4a8e86bdc8fefc538559e4f175eb")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia.el

(defvar marginalia-mode nil "\
Non-nil if Marginalia mode is enabled.
See the `marginalia-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `marginalia-mode'.")

(custom-autoload 'marginalia-mode "marginalia" nil)

(autoload 'marginalia-mode "marginalia" "\
Annotate completion candidates with richer information.

If called interactively, enable Marginalia mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'marginalia-cycle "marginalia" "\
Cycle between annotators in `marginalia-annotator-registry'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "marginalia" "../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "marginalia" '("marginalia-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/marginalia-20220312.1357/marginalia.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; marginalia-autoloads.el ends here
