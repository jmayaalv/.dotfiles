;; clj-kondo

(use-package flycheck-clj-kondo
  :ensure t)

;; then install the checker as soon as `clojure-mode' is loaded
(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(use-package align-cljlet
  :ensure t)

(with-eval-after-load 'cider
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-file "~/.cider-repl-history")
  (setq clojure-align-forms-automatically t)
  (setq-default ediff-ignore-similar-regions t)
  (setq ediff-custom-diff-options "--suppress-common-lines")

  ;; Prevent C-c C-k from prompting to save the file corresponding to the buffer
  ;; being loaded, if it's modified:
  (setq cider-save-file-on-load t)

  ;;Fuzzy Completion
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

  ;;Enable paredit or smartparens for minibuffer evaluations
  ;(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)

  ;;Interactive commands will try the command with the symbol at point first,
  ;;and only prompt if that fails
  (setq cider-prompt-for-symbol nil)


  ;;Dont log communication with nrepl server
  (setq nrepl-log-messages nil)

  ;;hide the *nrepl-connection* and *nrepl-server* buffers from appearing
  (setq nrepl-hide-special-buffers t)

  ;;Highlight symbols that are known to be defined.
  (setq cider-font-lock-dynamically '(macro core function var))

  ;;Remove banner
  (setq cider-repl-display-help-banner nil))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c r"))

(use-package clj-refactor
  :ensure t
  :config
  (setq cljr-warn-on-eval nil)
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
  (diminish 'clj-refactor-mode))
