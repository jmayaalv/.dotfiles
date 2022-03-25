;;; consult-lsp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "consult-lsp" "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp.el"
;;;;;;  "0bd9dce108e38fcffc22e6a5567fc205")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp.el

(autoload 'consult-lsp-diagnostics "consult-lsp" "\
Query LSP-mode diagnostics. When ARG is set through prefix, query all workspaces.

\(fn ARG)" t nil)

(autoload 'consult-lsp-symbols "consult-lsp" "\
Query workspace symbols. When ARG is set through prefix, query all workspaces.

\(fn ARG)" t nil)

(autoload 'consult-lsp-file-symbols "consult-lsp" "\
Search symbols defined in current file in a manner similar to `consult-line'.

If the prefix argument GROUP-RESULTS is specified, symbols are grouped by their
kind; otherwise they are returned in the order that they appear in the file.

\(fn GROUP-RESULTS)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "consult-lsp"
;;;;;;  "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-lsp" '("consult-lsp-")))

;;;***

;;;***

;;;### (autoloads nil "consult-lsp-marginalia" "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-marginalia.el"
;;;;;;  "7ee667d2d90888712df490e51c965116")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-marginalia.el

(defvar consult-lsp-marginalia-mode nil "\
Non-nil if Consult-Lsp-Marginalia mode is enabled.
See the `consult-lsp-marginalia-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `consult-lsp-marginalia-mode'.")

(custom-autoload 'consult-lsp-marginalia-mode "consult-lsp-marginalia" nil)

(autoload 'consult-lsp-marginalia-mode "consult-lsp-marginalia" "\
Use marginalia with consult-lsp functions.

If called interactively, enable Consult-Lsp-Marginalia mode if
ARG is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "consult-lsp-marginalia"
;;;;;;  "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-marginalia.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-marginalia.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-lsp-marginalia" '("consult-lsp-marginalia--")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-marginalia.el"
;;;;;;  "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/consult-lsp-20220320.1125/consult-lsp.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; consult-lsp-autoloads.el ends here
