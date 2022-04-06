;;; gist-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "../../../../../.emacs.d/elpa/gist-20171128.406/gist"
;;;;;;  "../../../../../.emacs.d/elpa/gist-20171128.406/gist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/gist-20171128.406/gist.el

(autoload 'gist-region "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post the current region as a new paste at gist.github.com
Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn BEGIN END &optional PRIVATE CALLBACK)" t nil)

(autoload 'gist-region-private "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post the current region as a new private paste at gist.github.com
Copies the URL into the kill ring.

\(fn BEGIN END)" t nil)

(autoload 'gist-buffer "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post the current buffer as a new paste at gist.github.com.
Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn &optional PRIVATE)" t nil)

(autoload 'gist-buffer-private "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post the current buffer as a new private paste at gist.github.com.
Copies the URL into the kill ring." t nil)

(autoload 'gist-region-or-buffer "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post either the current region, or if mark is not set, the
  current buffer as a new paste at gist.github.com

Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn &optional PRIVATE)" t nil)

(autoload 'gist-region-or-buffer-private "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Post either the current region, or if mark is not set, the
  current buffer as a new private paste at gist.github.com

Copies the URL into the kill ring." t nil)

(autoload 'gist-list-user "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Displays a list of a user's gists in a new buffer.  When called from
  a program, pass 'current-user as the username to view the user's own
  gists, or nil for the username and a non-nil value for force-reload to
  reload the gists for the current buffer.

\(fn USERNAME &optional FORCE-RELOAD BACKGROUND)" t nil)

(autoload 'gist-list "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Displays a list of all of the current user's gists in a new buffer.

\(fn &optional FORCE-RELOAD BACKGROUND)" t nil)

(autoload 'gist-fetch "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\


\(fn ID)" t nil)

(autoload 'gist-star "../../../../../.emacs.d/elpa/gist-20171128.406/gist" nil t nil)

(autoload 'gist-unstar "../../../../../.emacs.d/elpa/gist-20171128.406/gist" nil t nil)

(autoload 'gist-list-starred "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
List your starred gists.

\(fn &optional BACKGROUND)" t nil)

(autoload 'gist-fork "../../../../../.emacs.d/elpa/gist-20171128.406/gist" "\
Fork a gist." t nil)

(register-definition-prefixes "../../../../../.emacs.d/elpa/gist-20171128.406/gist" '("dired-do-gist" "gist-"))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/gist-20171128.406/gist-autoloads.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gist-autoloads.el ends here
