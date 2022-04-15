(require 'cider)


;;; CIDER

;; Additional Hot Keys
(define-key cider-mode-map (kbd "C-c M-o") #'cider-repl-clear-buffer)
(define-key cider-mode-map (kbd "C-c M-S") #'cider-selector)
(define-key cider-mode-map (kbd "<tab>") #'company-indent-or-complete-common)

;; config
(setq-default ediff-ignore-similar-regions t)
(setq cider-eldoc-display-for-symbol-at-point nil
      cider-clojure-cli-global-options "-A:dev"
      cider-history-file (concat user-emacs-directory "cider-history")
      cider-repl-wrap-history t
      cider-repl-history-file "~/.cider-repl-history"
      clojure-align-forms-automatically t
      diff-custom-diff-options "--suppress-common-lines"
      cider-save-file-on-load t
      cider-prompt-for-symbol nil
      nrepl-log-messages nil
      nrepl-hide-special-buffers t
      cider-font-lock-dynamically '(macro core function var)
      cider-repl-display-help-banner nil)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;;support for guardrails
(put '>defn 'clojure-doc-string-elt 2)


;;; Portal
(defun portal.api/open ()
  (interactive)
  (cider-nrepl-sync-request:eval
   "(require 'portal.api) (portal.api/tap) (portal.api/open)"))

(defun portal.api/clear ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/clear)"))

(defun portal.api/close ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/close)"))
