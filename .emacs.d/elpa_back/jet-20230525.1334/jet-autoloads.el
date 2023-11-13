;;; jet-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "jet" "jet.el" (0 0 0 0))
;;; Generated autoloads from jet.el

(autoload 'jet-print "jet" "\
Run jet for THING at cursor and ARGS printing to messages buffer.

\(fn THING &optional ARGS)" t nil)

(autoload 'jet-paste-cursor "jet" "\
Run jet for THING at cursor and ARGS pasting to current buffer.

\(fn THING &optional ARGS)" t nil)

(autoload 'jet-paste-buffer "jet" "\
Run jet for THING at cursor and ARGS pasting to current buffer.

\(fn THING &optional ARGS)" t nil)

(autoload 'jet-to-clipboard "jet" "\
Run jet for THING at cursor and ARGS copying to clipboard.

\(fn THING &optional ARGS)" t nil)

(autoload 'jet-debug "jet" "\
Print the jet command for THING at cursor and ARGS.

\(fn THING &optional ARGS)" t nil)
 (autoload 'jet-menu "jet-menu" "Run jet for THING." t)

(autoload 'jet "jet" "\
Run jet interactive command builder." t nil)

(autoload 'jet-print-version "jet" "\
Print the jet version." t nil)

(register-definition-prefixes "jet" '("jet-"))

;;;***

;;;### (autoloads nil nil ("jet-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; jet-autoloads.el ends here
