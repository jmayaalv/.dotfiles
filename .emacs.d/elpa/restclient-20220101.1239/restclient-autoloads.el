;;; restclient-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient"
;;;;;;  "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient.el

(autoload 'restclient-http-send-current "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient" "\
Sends current request.
Optional argument RAW don't reformat response if t.
Optional argument STAY-IN-WINDOW do not move focus to response buffer if t.

\(fn &optional RAW STAY-IN-WINDOW)" t nil)

(autoload 'restclient-http-send-current-raw "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient" "\
Sends current request and get raw result (no reformatting or syntax highlight of XML, JSON or images)." t nil)

(autoload 'restclient-http-send-current-stay-in-window "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient" "\
Send current request and keep focus in request window." t nil)

(autoload 'restclient-mode "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient" "\
Turn on restclient mode.

\(fn)" t nil)

(register-definition-prefixes "../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient" '("restclient-"))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/restclient-20220101.1239/restclient-autoloads.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; restclient-autoloads.el ends here
