(use-package fira-code-mode
  :ensure t
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
  :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes
