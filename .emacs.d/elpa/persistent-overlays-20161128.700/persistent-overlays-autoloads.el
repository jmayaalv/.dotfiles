;;; persistent-overlays-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "persistent-overlays" "../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays.el"
;;;;;;  "820e7a83d9b27702e9f880655fe8d6cd")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays.el

(autoload 'persistent-overlays-merge-overlays "persistent-overlays" "\
Merge overlays.
If OVFILE is not provided, the overlay file corresponding to the
current buffer is loaded from `persistent-overlays-directory' and
merged with existing overlays.  If OVFILE is provided, it
specifies the path to the overlay file to be merged.

NOTE: If a loaded overlay has exactly the same properties and
values as an existing overlay only a single overlay is retained.

\(fn &optional OVFILE)" t nil)

(autoload 'persistent-overlays-load-overlays "persistent-overlays" "\
Load overalys.
If OVFILE is not provided the overlay file corresponding to
the current buffer is loaded from `persistent-overlays-directory'.  If OVFILE is
provided it specifies the path to the overlay file to be loaded.

NOTE: All overlays that contain properties in
`persistent-overlays-property-names' are removed before loading overlays.  Loaded
overlays are not merged with existing overlays.  A future version
may provide an `persistent-overlays-merge-overlays' function.

\(fn &optional OVFILE)" t nil)

(autoload 'persistent-overlays-save-overlays "persistent-overlays" "\
Save overlays.
If OVFILE is not provided, the overlay file corresponding to the
current buffer is saved in the directory pointed to by
`persistent-overlays-directory'.  If OVFILE is provided, it
specifies the path of the overlay file to be saved.

NOTE: Only overlays that contain properties in
`persistent-overlays-property-names' are saved.  If the overlay
already exists it is overwritten.

\(fn &optional OVFILE)" t nil)

(autoload 'persistent-overlays-minor-mode "persistent-overlays" "\
This is a minor mode to make overlays persistent by saving
them to a file and subsequently loading them. By default overlays
are stored in ~/.emacs-persistent-overlays with a file name that
is created as a combination of the buffer name and a SHA1 hash of
the file name to which they correspond.
`persistent-overlays-directory' may be set to indicate a
different directory in which to store overlays. If
`persistent-overlays-use-path-name' is set to t, the overlay file
is named using the underscore delimited full path of the file
instead of using a SHA1 hash. Overlay file names always end with
.povly.

If called interactively, enable Persistent-Overlays minor mode if
ARG is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

`persistent-overlays-property-names' specifies a list of property
symbols that must exist in an overlay for it to be handled by
this mode. By default it is set to a list containing the symbol
'invisible so that overlays which hide sections of a buffer are
stored. This was the primary motivation for this mode.

If `persistent-overlays-auto-save' is t all overlays containing
properties in `persistent-overlays-property-names' will be saved
in the directory indicated by `persistent-overlays-directory'
when the buffer is saved.

If `persistent-overlays-auto-load' is t existing overlays for the
buffer will be loaded from `persistent-overlays-directory' when
the buffer is loaded or when `persistent-overlays-minor-mode' is
enabled.

If `persistent-overlays-auto-merge' is t existing overlays for
the buffer will be loaded and merged from
`persistent-overlays-directory' when the buffer is loaded and
when `persistent-overlays-minor-mode' is enabled. This is the
default behavior which is useful when
persistent-overlays-minor-mode is enabled after having created
additional overlays.

Other custom variables are
`persistent-overlays-store-with-user-file',
`persistent-overlays-store-as-hidden' and
`persistent-overlays-disable-on-major-mode-change'.  Please use
describe-variable for details on those variables.

NOTE: There is currently no mechanism for binding overlay files
with the corresponding user files when files are moved. If you
wish to retain existing stored overlays you can manually load or
merge the overlays from the original overlay file after renaming
the user file. You may also want to delete the original overlay
file after merging to avoid having unused overlay files lying
around. Each overlay file contains the full path name of the file
to which it applies as its first line.

Key bindings:
\\{persistent-overlays-minor-mode-map}

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "persistent-overlays"
;;;;;;  "../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "persistent-overlays" '("persistent-overlays-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/persistent-overlays-20161128.700/persistent-overlays.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; persistent-overlays-autoloads.el ends here
