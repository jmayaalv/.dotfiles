;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the minimal config needed to get org-mode from melpa and
;; get it up and running so that we can load our emacs config from a
;; .org file in a literate manner. The basis for this can be found
;; here:
;;
;; http://orgmode.org/worg/org-contrib/babel/intro.html
(require 'package)

(setq package-enable-at-startup nil)
;;(package-initialize)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			;; ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; This means we prefer things from ~/.emacs.d/elpa over the standard packages.
(package-initialize)


;; This bootstraps us if we don't have anything
(when (not package-archive-contents)
  (package-refresh-contents))

;; This installs elpa packages if we haven't done that yet
(defun maybe-install-and-require (p)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

(setq desktop-restore-forces-onscreen nil)
(setq magit-last-seen-setup-instructions "1.4.0")

                                        ;
;; org-mode always needs to be installed in an emacs where it isn't loaded.
(require 'org)





(org-babel-load-file (concat (getenv "HOME") "/.emacs.d/org/config.org"))
(put 'erase-buffer 'disabled nil)
(defvar clojure--prettify-symbols-alist nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(cider-enlighten-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "0cb1b0ea66b145ad9b9e34c850ea8e842c4c4c83abe04e37455a1ef4cc5b8791" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "632694fd8a835e85bcc8b7bb5c1df1a0164689bc6009864faed38a9142b97057" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "f56eb33cd9f1e49c5df0080a3e8a292e83890a61a89bceeaa481a5f183e8e3ef" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "05a4b82c39107308b5c3720fd0c9792c2076e1ff3ebb6670c6f1c98d44227689" "54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(nyan-mode t)
 '(org-agenda-files
   '("/Users/juan.maya/org/refile.org" "/Users/juan.maya/Workspace/ms-edge/edge/doc/edge.org"))
 '(package-selected-packages
   '(html-to-hiccup doom-themes itail logview log4j-mode vlf anzu tuareg ivy-posframe counsel-projectile ivy-rich counsel lsp-java gnu-elpa-keyring-update plantuml-mode eyuml cider-hydra hercules persistent-overlays yaml-mode flycheck-clj-kondo company-quickhelp discover-my-major helm-descbinds restclient ag persp-projectile perspective yasnippet material-theme beacon nord-theme dracula-theme darkula-theme treemacs-projectile treemacs 0blayout ta crux key-chord spaceline airline-themes solarized-theme flycheck-color-mode-line helm-ag eyebrowse iedit expand-region flycheck-joker nyan-mode ssh-tunnels htmlize swiper-helm try org-bullets asana ace-window avy markdown-mode helm-css-scss css-eldoc tagedit orgit zenburn-theme which-key use-package super-save smartscan refheap rainbow-mode rainbow-delimiters ox-reveal neotree magit js2-mode inf-clojure highlight-symbol helm-projectile helm-orgcard git-gutter-fringe+ gist exec-path-from-shell discover company-flx clojure-cheatsheet clj-refactor buffer-move all-the-icons align-cljlet ace-jump-mode))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((cider-ns-refresh-after-fn . "user/start")
     (cider-ns-refresh-before-fn . "user/stop")
     (cider-preferred-build-tool . "clojure-cli")
     (cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend")
     (projectile-grep-default-files quote
                                    ("*.clj" "*.cljs" "*.cljc"))
     (eval cider-register-cljs-repl-type 'fm "(require 'figwheel.main)(figwheel.main/start \"dev\")" 'cider-verify-piggieback-is-present)
     (bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")
     (checkdoc-package-keywords-flag)
     (cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")
     (cider-refresh-after-fn . "user/go")
     (cider-refresh-before-fn . "user/stop")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "#F07667" :foreground "#efefef" :weight normal))))
 '(helm-match ((t (:background "#2B2B2B" :foreground "#DFAF8F" :weight bold :family "Menlo")))))
(put 'narrow-to-region 'disabled nil)
