;;; iedit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "iedit" "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit.el"
;;;;;;  "5722dd62fb89d8525f8920c6ea843dfd")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/iedit-20220216.717/iedit.el

(autoload 'iedit-mode "iedit" "\
Toggle Iedit mode.
This command behaves differently, depending on the mark, point,
prefix argument and variable `iedit-transient-mark-sensitive'.

If Iedit mode is off, turn Iedit mode on.

When Iedit mode is turned on, all the occurrences of the current
region in the buffer (possibly narrowed) or a region are
highlighted.  If one occurrence is modified, the change are
propagated to all other occurrences simultaneously.

If region is not active, `iedit-default-occurrence' is called to
get an occurrence candidate, according to the thing at point.  It
might be url, email address, markup tag or current symbol(or
word).

In the above two situations, with digit prefix argument 0, only
occurrences in current function are matched.  This is good for
renaming refactoring in programming.

You can also switch to Iedit mode from isearch mode directly. The
current search string is used as occurrence.  All occurrences of
the current search string are highlighted.

With an universal prefix argument, the occurrence when Iedit mode
is turned off last time in current buffer is used as occurrence.
This is intended to recover last Iedit mode which is turned off.
If region active, Iedit mode is limited within the current
region.

With repeated universal prefix argument, the occurrence when
Iedit mode is turned off last time (might be in other buffer) is
used as occurrence.  If region active, Iedit mode is limited
within the current region.

With digital prefix argument 1, Iedit mode is limited on the
current symbol or the active region, which means just one
instance is highlighted.  This behavior serves as a start point
of incremental selection work flow.

If Iedit mode is on and region is active, Iedit mode is
restricted in the region, e.g. the occurrences outside of the
region is excluded.

If Iedit mode is on and region is active, with an universal
prefix argument, Iedit mode is restricted outside of the region,
e.g. the occurrences in the region is excluded.

Turn off Iedit mode in other situations.

Commands:
\\{iedit-mode-keymap}
Keymap used within overlays:
\\{iedit-mode-occurrence-keymap}

\(fn &optional ARG)" t nil)

(autoload 'iedit-mode-from-isearch "iedit" "\
Start Iedit mode using last search string as the regexp.

\(fn &optional ARG)" t nil)

(autoload 'iedit-mode-toggle-on-function "iedit" "\
Toggle Iedit mode on current function." t nil)

(autoload 'iedit-execute-last-modification "iedit" "\
Apply last modification in Iedit mode to the current buffer or an active region.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "iedit" "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/iedit-20220216.717/iedit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "iedit" '("iedit-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "iedit-lib" "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-lib.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-lib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "iedit-lib" '("iedit-")))

;;;***

;;;### (autoloads nil "iedit-rect" "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-rect.el"
;;;;;;  "1fd92967b468827cb5d578a601144f4a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-rect.el

(autoload 'iedit-rectangle-mode "iedit-rect" "\
Toggle Iedit-rect mode.

When Iedit-rect mode is on, a rectangle is started with visible
rectangle highlighting.  Rectangle editing support is based on
Iedit mechanism.

Commands:
\\{iedit-rect-keymap}

\(fn &optional BEG END)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "iedit-rect" "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-rect.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-rect.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "iedit-rect" '("iedit-rect")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-lib.el"
;;;;;;  "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit-rect.el"
;;;;;;  "../../../../../.emacs.d/elpa/iedit-20220216.717/iedit.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; iedit-autoloads.el ends here
