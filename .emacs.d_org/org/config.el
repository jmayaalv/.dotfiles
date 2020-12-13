(defun load-if-exists (file)
  (if (file-exists-p file)
      (progn
        (load file)
        (message (format "Loading file: %s" file)))
    (message (format "No %s file. So not loading one." file))))

(maybe-install-and-require 'use-package)

(server-start)

;;Set it to big number(100mb) like most of the popular starter kits like Spacemacs/Doom/Prelude, etc do:
(setq gc-cons-threshold 100000000)

;;Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq scroll-preserve-screen-position t)

(tool-bar-mode -1)

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(setq create-lockfiles nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top
(setq-default indent-tabs-mode nil)

(delete-selection-mode t)

(global-set-key (kbd "M-RET") 'hippie-expand)

(use-package diminish :ensure t)

(setq-default indent-tabs-mode nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(use-package multiple-cursors
   :ensure t
   :bind
   (("C-S-c C-S-c" . mc/edit-lines)
    ("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
    ("C-c C-<" . 'mc/mark-all-like-this)))

(use-package discover
  :ensure t
  :config (global-discover-mode 1))

(defun my-bell-function ()
  (unless (memq this-command
    '(isearch-abort abort-recursive-edit exit-minibuffer
          keyboard-quit mwheel-scroll down up next-line previous-line
          backward-char forward-char))
        (ding)))
 (setq ring-bell-function 'my-bell-function)

(global-set-key (kbd "M-o") 'other-window)

(desktop-save-mode 1)

(setq auto-save-visited-file-name t)

(add-hook 'before-save-hook
          (lambda nil
           (delete-trailing-whitespace)))

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                             (interactive)
                             (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                             (interactive)
                             (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(defun insert-pragma-block ()
  (interactive)
  (insert ";;-------------------------------------------------------------------------------
;; ## Pragma-block-name"))

(global-set-key (kbd "<f5> p") 'insert-pragma-block)

(setq split-height-threshold nil
      split-width-threshold nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(use-package which-key
  :ensure t
  :config (progn (which-key-mode)
                 (diminish 'which-key-mode)))

(blink-cursor-mode 0)
(setq default-cursor-type 'bar)
(setq scroll-preserve-screen-position 'always)

(use-package try
  :ensure t)

(use-package gnu-elpa-keyring-update
  :ensure t)

(add-to-list 'load-path (concat user-emacs-directory "non-elpa/"))

(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; (require 'window-number-super)
;; (window-number-mode 1) ;; for the window numbers
;; (window-number-super-mode 1) ;; for the super key binding

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)))

(setq delete-by-moving-to-trash t)
(setq trash-directory "~/.Trash")

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

(setq scroll-margin 0
   scroll-conservatively 100000
   scroll-preserve-screen-position 1)

(setq frame-title-format
   '((:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
              "%b"))))

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(use-package all-the-icons
  :ensure t
  :init
  (progn (defun -custom-modeline-github-vc ()
           (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
             (concat
              (propertize (format " %s" (all-the-icons-octicon "git-branch"))
                          'face `(:height 1 :family ,(all-the-icons-octicon-family))
                          'display '(raise 0))
              (propertize (format " %s" branch))
              (propertize "  "))))

         (defvar mode-line-my-vc
           '(:propertize
             (:eval (when vc-mode
                      (cond
                       ((string-match "Git[:-]" vc-mode) (-custom-modeline-github-vc))
                       (t (format "%s" vc-mode)))))
              )
           "Formats the current directory.")))

;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t))

(use-package doom-themes
:ensure t
:config
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;(load-theme 'doom-one-light t)
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; or for treemacs users
;; (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;; (doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
 (doom-themes-org-config))

;;   (when (memq window-system '(mac ns)) (set-default-font
;;   "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(when (window-system)
       (set-frame-font "Fira Code"))
      (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               ;; (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               ;; (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
             (dolist (char-regexp alist)
               (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

      (add-hook 'cider-repl-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

      (add-hook 'org-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

;;      (add-hook 'helm-major-mode-hook
 ;;         (lambda ()
   ;;         (setq auto-composition-mode nil)))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

(defun custom-display-line-numbers ()
     (setq  display-line-numbers 'absolute
     display-line-numbers-current-absolute t
     display-line-numbers-width 4
     display-line-numbers-widen t)
     (set-face-attribute 'line-number-current-line nil
                         :background "#696969" :foreground "black"))

(add-hook 'prog-mode-hook (lambda ()
              (custom-display-line-numbers)))

(setq inhibit-startup-screen t)

(defun toggle-transparency ()
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(use-package nyan-mode
  :ensure t)

;; (use-package spaceline
;;   :ensure t
;;   :pin melpa-stable
;;   :config
;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))
;;                 spaceline-highlight-face-func 'spaceline-highlight-face-modified
;;                 spaceline-flychcek-bullet "❖ %s"
;;                 powerline-default-separator 'zigzag
;;                 powerline-height 18
;;                 spaceline-workspace-numbers-unicode t
;;                 spaceline-window-numbers-unicode t))

;;  (use-package spaceline-config
;;         :ensure spaceline
;;         :pin melpa-stable
;;         :config
;;         (diminish 'auto-revert-mode)
;;         (spaceline-emacs-theme)
;;         (spaceline-helm-mode 1)
;;       (spaceline-install
;;            'main
;;            '(((remote-host buffer-id) :face highlight-face)
;;              (major-mode)
;;              (minor-modes)
;;              ((flycheck-error flycheck-warning flycheck-info))
;;              (process :when active)
;;              (nyan-cat :when active)
;;              (buffer-position :when active))
;;            '((selection-info :face region :when mark-active)
;;              (which-function)
;;              (projectile-root)
;;              (version-control)
;;              (line-column)
;;              (global :when active)
;;              (window-number)
;;              (workspace-number))))

;;; Modeline
;;`file-local-name' is introduced in 25.2.2.
;; (unless (fboundp 'file-local-name)
;;   (defun file-local-name (file)
;;     "Return the local name component of FILE."
;;     (or (file-remote-p file 'localname) file)))

;;  (setq mode-line-position
;;         '((line-number-mode ("(%l" (column-number-mode ",%c")))
;;           (-4 ":%p" ) (")")))

;; (defun modeline-project-root ()
;;   "Get the path to the root of your project.
;; Return `default-directory' if no project was found."
;;   (file-local-name
;;    (or
;;     (when (featurep 'projectile)
;;       (ignore-errors (projectile-project-root)))
;;     default-directory)))

;; (defun truncate-relative-path (path)
;;   "Return the truncate of relative PATH."
;;   (save-match-data
;;     (let ((pos 0) matches)
;;       (setq path (concat "/" path))
;;       (while (string-match "\\(\/\\.?.\\)" path pos)
;;         (setq matches (concat matches (match-string 0 path)))
;;         (setq pos (match-end 0)))
;;       (concat matches "/"))))

;; (defun modeline-buffer-file-name ()
;;   "Propertized variable `buffer-file-name'."
;;   (let* ((buffer-file-truename (file-local-name (or (buffer-file-name (buffer-base-buffer)) "")))
;;          (project-root (modeline-project-root)))
;;     (concat
;;      ;; project
;;      (propertize
;;       (concat (file-name-nondirectory (directory-file-name project-root)) "/")
;;       'face '(:inherit font-lock-string-face :weight bold))
;;      ;; relative path
;;      (propertize
;;       (when-let (relative-path (file-relative-name
;;                                 (or (file-name-directory buffer-file-truename) "./")
;;                                 project-root))
;;         (if (string= relative-path "./") ""
;;           (substring (truncate-relative-path relative-path) 1)))
;;       'face 'font-lock-comment-face)
;;      ;; file name
;;      (propertize (file-name-nondirectory buffer-file-truename)
;;                  'face 'mode-line-buffer-id))))

;; (defvar-local modeline-buffer-info nil)
;; (defvar mode-line-buffer-info
;;   '(:propertize
;;     (:eval (or modeline-buffer-info
;;                (setq modeline-buffer-info
;;                      (if buffer-file-name
;;                          (modeline-buffer-file-name)
;;                        (propertize "%b" 'face '(:weight bold))))))))
;; (put 'mode-line-buffer-info 'risky-local-variable t)

;; (defsubst modeline-column (pos)
;;   "Get the column of the position `POS'."
;;   (save-excursion (goto-char pos)
;;                   (current-column)))
;; (defun selection-info()
;;   "Information about the current selection."
;;   (when mark-active
;;     (cl-destructuring-bind (beg . end)
;;         (cons (region-beginning) (region-end))
;;       (propertize
;;        (let ((lines (count-lines beg (min end (point-max)))))
;;          (concat (cond ((bound-and-true-p rectangle-mark-mode)
;;                         (let ((cols (abs (- (modeline-column end)
;;                                             (modeline-column beg)))))
;;                           (format "(%dx%d)" lines cols)))
;;                        ((> lines 1)
;;                         (format "(%d,%d)" lines (- end beg)))
;;                        ((format "(%d,%d)" 0 (- end beg))))))
;;        'face 'font-lock-warning-face))))

;; (setq-default mode-line-format
;;               '("%e"
;;                 mode-line-front-space
;;                 mode-line-client
;;                 mode-line-modified
;;                 mode-line-remote
;;                 ;; mode-line-frame-identification -- this is for text-mode emacs only
;;                 " "
;;                 mode-line-buffer-info
;;                 ;; mode-line-buffer-identification
;;                 " "
;;                 mode-line-position

;;                 (:eval (selection-info))
;;                 (vc-mode vc-mode)
;;                 " "
;;                 mode-line-modes
;;                 mode-line-misc-info
;;                 mode-line-end-spaces))

  (defun d/flycheck-lighter (state)
    "Return flycheck information for the given error type STATE.

Source: https://git.io/vQKzv"
    (let* ((counts (flycheck-count-errors flycheck-current-errors))
           (errorp (flycheck-has-current-errors-p state))
           (err (or (cdr (assq state counts)) "?"))
           (running (eq 'running flycheck-last-status-change)))
      (if (or errorp running) (format "•%s" err))))

(setq-default mode-line-format
              (list
               mode-line-modified

               mode-line-front-space

               mode-line-my-vc

               '(:eval (propertize " %b "
                                   'face
                                   (let ((face (buffer-modified-p)))
                                     (if face 'font-lock-warning-face
                                       'font-lock-type-face))
                                   'help-echo (buffer-file-name)))


               mode-line-position

               mode-line-front-space
               ;; flycheck
               '(:eval
                (when (and (bound-and-true-p flycheck-mode)
                           (or flycheck-current-errors
                               (eq 'running flycheck-last-status-change)))
                  (concat
                   (cl-loop for state in '((error . "#FB4933")
                                           (warning . "#FABD2F")
                                           (info . "#83A598"))
                            as lighter = (d/flycheck-lighter (car state))
                            when lighter
                            concat (propertize
                                    lighter
                                    'face `(:foreground ,(cdr state))))
                   " ")))

               ;; spaces to align right
               '(:eval (propertize
                " " 'display
                `((space :align-to (- (+ right right-fringe right-margin)
                                      ,(+ 3 (string-width mode-name)))))))

               ;; the current major mode
               (propertize " %m " 'face 'font-lock-string-face)))

(set-face-attribute 'mode-line nil
                    :background "#353644"
                    :foreground "white"
                    :box '(:line-width 8 :color "#353644")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#565063"
                    :foreground "white"
                    :box '(:line-width 8 :color "#565063")
                    :overline nil
                    :underline nil)

(use-package dimmer
  :ensure t
  :config
  (setq dimmer-percent 0.4)
  (dimmer-activate))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-blink-duration 0.5)
  (setq beacon-blink-delay 0.5)
  (add-to-list 'beacon-dont-blink-major-modes '('term-mode 'ediff-mode 'ediff)))

(use-package persistent-overlays
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (hs-minor-mode 1) (setq hs-allow-nesting t) (persistent-overlays-minor-mode 1)))
  (setq persistent-overlays-auto-save t)
  (setq persistent-overlays-auto-load t)
  (setq persistent-overlays-auto-merge t))

(use-package crux
  :ensure t
  :config
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
  (global-set-key (kbd "C-c o") #'crux-open-with)
  (global-set-key [(shift return)] #'crux-smart-open-line)
  (global-set-key (kbd "s-r") #'crux-recentf-find-file)
  (global-set-key (kbd "C-<backspace>") #'crux-kill-line-backwards)
  (global-set-key [remap kill-whole-line] #'crux-kill-whole-line))

(use-package key-chord
     :ensure t
     :config (key-chord-mode 1))

(use-package undo-tree
    :ensure t
    :config
    (global-undo-tree-mode)
    (diminish 'undo-tree-mode))

(defun ido-recentf-open ()
"Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
  (message "Opening file...")
  (message "Aborting")))

(use-package recentf
  :ensure t
  :bind
  (("C-x C-r" . ido-recentf-open))
  :init
  (recentf-mode t)
  (setq recentf-max-saved-items 200))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))
(setq dired-listing-switches "-alh")

(use-package counsel :ensure t
 :init (counsel-mode 1))

(use-package ivy
   :ensure t
   :init
   (progn
     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
     (setq enable-recursive-minibuffers t)
     (global-set-key (kbd "C-c C-r") 'ivy-resume)
     (global-set-key (kbd "<f6>") 'ivy-resume)
     (setq projectile-completion-system 'ivy)
     ;; swiper provides enhanced buffer search
     ;; counsel supercharges a lot of commands with some ivy magic

     (global-set-key (kbd "M-x") 'counsel-M-x)
     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
     (global-set-key (kbd "<f1> l") 'counsel-find-library)
     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
     (global-set-key (kbd "C-c g") 'counsel-git)
     (global-set-key (kbd "C-c j") 'counsel-git-grep)
     (global-set-key (kbd "C-c a") 'counsel-ag)
     (global-set-key (kbd "C-x l") 'counsel-locate)
     (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

 (use-package flx
  :ensure t
  :requires counsel
  :config
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus))))

(use-package ivy-posframe
   :ensure t
   :requires counsel
   :after ivy
   :diminish
   :init
   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
         ivy-posframe-height-alist '((t . 20))
         ivy-posframe-parameters '((internal-border-width . 10)))
   (setq ivy-posframe-width 150)
   (ivy-posframe-mode 1))

;; (use-package helm
;;   :ensure t
;;   :bind (("C-x C-f" . helm-find-files)
;;          ("C-x b" . helm-buffers-list)
;;          ("C-x h" . helm-command-prefix)
;;          ("M-x" . helm-M-x)
;;          ("M-y" . helm-show-kill-ring))
;;   :init
;;   (progn (setq helm-split-window-in-side-p nil)
;;          (setq helm-mode-fuzzy-match t) ;Fuzzy matching

;;          (when (executable-find "curl")
;;            (setq helm-google-suggest-use-curl-p t))

;;          (setq helm-split-window-in-side-p     t ; open helm buffer inside current window, not occupy whole other window
;;                helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;                helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;                helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;                helm-ff-file-name-history-use-recentf t)
;;          (helm-mode 1)
;;          (diminish 'helm-mode)))

(use-package magit
:ensure t
 :bind
 ("C-x g" . magit-status))

(use-package git-gutter-fringe+
 :ensure t
 :bind
 (("s-n" . git-gutter+-next-hunk)
  ("s-p" . git-gutter+-previous-hunk))
 :init
 (global-git-gutter+-mode t)
 (diminish 'git-gutter+-mode))

(use-package swiper
  :ensure t
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper))
  :config
  (progn
    (setq enable-recursive-minibuffers t)))

;; (use-package swiper-helm
;;   :ensure t
;;   :bind
;;   (("C-s" . swiper)
;;    ("C-r" . swiper))
;;   :config
;;   (progn
;;     (setq enable-recursive-minibuffers t)))

(use-package avy
  :ensure t
  :after key-chord
  :bind (("C-c j" . avy-goto-word-or-subword-1)
         ("C-," . avy-goto-word-or-subword-1))
  :config
  (key-chord-define-global "jj" 'avy-goto-word-1)
  (key-chord-define-global "jk" 'avy-goto-char))

(use-package ace-window
  :ensure t
  :init
  (progn (global-set-key [remap other-window] 'ace-window)
         (custom-set-faces
          '(aw-leading-char-face
            ((t (:inherit ace-jump-face-foreground :height 3.0)))))))

(windmove-default-keybindings)

(use-package buffer-move
  :ensure t
  :bind (("<s-up>" . buf-move-up)
         ("<s-down>" . buf-move-down)
         ("<s-left>" . buf-move-left)
         ("<s-right>" . buf-move-right)))

(global-set-key (kbd "s-=") 'shrink-window)
(global-set-key (kbd "s-+") 'enlarge-window)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("web" (or (mode . web-mode)
                          (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode)
                            (mode . shell-mode)))
               ("programming" (or (mode . clojure-mode)
                                  (name . "^.*clj$")
                                  (name . "^.*cljs$")))
               ("sql" (or (mode . sql-mode)
                                       (name . "^.*sql$")))
               ("emacs" (or (name . "^\\*scratch\\*$")
                            (name . "^\\*Messages\\*$")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

(use-package projectile
       :ensure t
       :init
       (projectile-global-mode))

     (use-package counsel-projectile
       :ensure t
       :requires (projectile counsel)
       :init
       (counsel-projectile-mode)
       (diminish 'projectile-mode)
       (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
       (global-set-key (kbd "s-f") 'counsel-projectile)
       (global-set-key (kbd "s-E") 'projectile-recentf)
       (global-set-key (kbd "s-s") 'projectile-grep)
)

     ;; (use-package helm-projectile
     ;;   :ensure t
     ;;   :requires (projectile helm)
     ;;   :config
     ;;   (helm-projectile-on))

(use-package super-save
  :ensure t
  :config (progn (super-save-mode +1)
                 (setq auto-save-default nil)
                 (diminish 'super-save-mode)))

(global-hl-line-mode t)

(use-package expand-region
  :ensure t
  :config (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)

; if you're windened, narrow to the region, if you're narrowed, widen
; bound to C-x n
(defun narrow-or-widen-dwim (p)
"If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
(interactive "P")
(declare (interactive-only))
(cond ((and (buffer-narrowed-p) (not p)) (widen))
((region-active-p)
(narrow-to-region (region-beginning) (region-end)))
((derived-mode-p 'org-mode)
;; `org-edit-src-code' is not a real narrowing command.
;; Remove this first conditional if you don't want it.
(cond ((ignore-errors (org-edit-src-code))
(delete-other-windows))
((org-at-block-p)
(org-narrow-to-block))
(t (org-narrow-to-subtree))))
(t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(use-package perspective
  :ensure t
  :commands persp-mode)

(use-package persp-projectile
  :ensure t
  :requires perspective)

;(use-package eyebrowse
 ; :ensure t
  ;:config(eyebrowse-mode t))

(use-package ag :ensure t)

(use-package anzu
  :ensure t
  :bind
  (("C-%" . anzu-query-replace)
   ("C-M-%" . anzu-query-replace-regexp))
  :config
  (diminish 'anzu-mode)
  (global-anzu-mode))

(use-package midnight :ensure t)

(use-package discover-my-major
  :ensure t
  :bind
  (("C-h M-m" . discover-my-major)
   ("C-h M-M" . discover-my-mode)))

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(use-package company-flx
  :ensure t
  :config (progn (global-company-mode)
                 (diminish 'company-mode)))

(use-package company-quickhelp
 :ensure t
 :bind (("C-c h" . company-quickhelp-manual-begin))
 :config
 (setq company-quickhelp-delay nil))

(show-paren-mode +1)

(use-package paredit
  :ensure t
  :bind
  (("M-[" . paredit-wrap-square)
   ("M-{" . paredit-wrap-curly))
  :config
  (diminish 'paredit-mode "()")
  (add-hook 'prog-mode-hook 'paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode)
  (diminish 'rainbow-mode))

(use-package highlight-symbol
  :ensure t
  :config (progn (add-hook 'prog-mode-hook 'highlight-symbol-mode)
                 (diminish 'highlight-symbol-mode)))

(use-package yasnippet
        :ensure t
        :config
         (setq yas-snippet-dirs      '("~/.emacs.d/snippets"))
         (yas-global-mode 1)
)

(diminish 'yas-minor-mode)

(use-package smartscan
  :ensure t
  :config
  (add-hook 'prog-mode-hook
            '(lambda () (smartscan-mode 1))))

(setq lisp-hooks (lambda ()
                   ;(eldoc-mode +1)
                          (diminish 'eldoc-mode)
                          (define-key paredit-mode-map
                            (kbd "{") 'paredit-open-curly)
                          (define-key paredit-mode-map
                            (kbd "}") 'paredit-close-curly)))

(add-hook 'emacs-lisp-mode-hook lisp-hooks)

;; load CIDER from its source code
;;       (add-to-list 'load-path "~/Documents/workspace/cider")
;;       (require 'cider)

(use-package cider
  :ensure t
  :pin melpa-stable
  :bind
  (("C-c M-o" . cider-repl-clear-buffer)
   ("C-c M-s" . cider-selector)
   ("<tab>" . company-indent-or-complete-common))
  :config
  (setq cider-clojure-cli-global-options "-J-Dguardrails.enabled -A:dev") ;set dv as default alias in cli
  (add-hook 'clojure-mode-hook lisp-hooks)

  ;(setq cider-lein-global-options "-o") ;sets lein to offine
  ;(setq cider-clojure-cli-global-options "-o")

  ;;history
  (setq cider-history-file (concat user-emacs-directory "cider-history"))
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-file "~/.cider-repl-history")
  (setq clojure-align-forms-automatically t)
  ;  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))") ;i dont' think this is needed anymore with fighweel.main
   (setq-default ediff-ignore-similar-regions t)
   ;; used when calling ediff-show-diff-output from ediff session
   ;; (bound to D). Not interactive.
   (setq ediff-custom-diff-options "--suppress-common-lines")

   ;Prevent C-c C-k from prompting to save the file corresponding to the buffer being loaded, if it's modified:
   (setq cider-save-file-on-load nil)
   (setq cider-save-file-on-load t)

   ;;Fuzzy Completion
   (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
   (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)


   ;Enable paredit or smartparens for minibuffer evaluations
   (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)

   ;Enable paredit in the repl
   (add-hook 'cider-repl-mode-hook 'paredit-mode)

   ;Interactive commands will try the command with the symbol at point first, and only prompt if that fails
   (setq cider-prompt-for-symbol nil)

   ;Dont log communication with nrepl server
   (setq nrepl-log-messages nil)

    ;hide the *nrepl-connection* and *nrepl-server* buffers from appearing
    (setq nrepl-hide-special-buffers t)

    ;Highlight symbols that are known to be defined.
    (setq cider-font-lock-dynamically '(macro core function var))

    ;Remove banner
    (setq cider-repl-display-help-banner nil)

    ;start fighweel repl. Needed?
;;     (setq cider-cljs-lein-repl
;;     "(cond
;;     (and (resolve 'user/run) (resolve 'user/browser-repl)) ;; Chestnut projects
;;     (eval '(do (user/run)
;;     (user/browser-repl)))

;;     (try
;;     (require 'figwheel-sidecar.repl-api)
;;     (resolve 'figwheel-sidecar.repl-api/start-figwheel!)
;;     (catch Throwable _))
;;     (eval '(do (figwheel-sidecar.repl-api/start-figwheel!)
;;     (figwheel-sidecar.repl-api/cljs-repl)))

;;     (try
;;     (require 'cemerick.piggieback)
;;     (resolve 'cemerick.piggieback/cljs-repl)
;;     (catch Throwable _))
;;     (eval '(cemerick.piggieback/cljs-repl (cljs.repl.rhino/repl-env)))

;;     :else
;;     (throw (ex-info \"Failed to initialize CLJS repl. Add com.cemerick/piggieback and optionally figwheel-sidecar to your project.\" {})))")
 )

(defun cider-ediff-hack ()
 (interactive)
 (let ((expected (get-text-property (point) 'actual))
  (tmp-buffer (generate-new-buffer " *tmp*"))
  (expected-buffer (generate-new-buffer " *expected*"))
  (actual-buffer   (generate-new-buffer " *actual*")))
 (with-current-buffer tmp-buffer
  (insert expected)
  (goto-char (point-min))
  (re-search-forward "= ")
  (let ((opoint (point)))
    (forward-sexp 1)
    (let* ((tpoint (point))
           (our-exp (buffer-substring-no-properties opoint (point)))
           (_ (forward-sexp 1))
           (our-act (buffer-substring-no-properties tpoint (point) )))
      (with-current-buffer expected-buffer
        (insert our-exp)
        (delete-trailing-whitespace))
      (with-current-buffer actual-buffer
        (insert our-act)
        (delete-trailing-whitespace))
      (apply 'ediff-buffers
             (setq cider-test-ediff-buffers
                   (list (buffer-name expected-buffer)
                         (buffer-name actual-buffer)))))))))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c r"))

 (use-package clj-refactor
  :pin melpa-stable
  :ensure t
    :config
   (setq cljr-warn-on-eval nil)
   (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
   (diminish 'clj-refactor-mode))

(use-package align-cljlet
  :ensure t)

;; (defun helm-clojure-headlines ()
;;   "Display headlines for the current Clojure file."
;;   (interactive)
;;   (helm :sources '(((name . "Clojure Headlines")
;;                     (volatile)
;;                     (headline "^[;(]")))))

;; (add-hook 'clojure-mode-hook
;;           (lambda () (local-set-key (kbd "s-h") 'helm-clojure-headlines)))

(defun sw1nn-nrepl-current-server-buffer ()
  (let ((nrepl-server-buf (replace-regexp-in-string "connection" "server" (nrepl-current-connection-buffer))))
    (when nrepl-server-buf
      (get-buffer nrepl-server-buf))))

(defun sw1nn-cider-perspective ()
  (interactive)
  (delete-other-windows)
  (split-window-below)
  (windmove-down)
  (shrink-window 25)
  (switch-to-buffer (sw1nn-nrepl-current-server-buffer))
  (windmove-up)
  (pop-to-buffer (cider-find-or-create-repl-buffer)))

(use-package inf-clojure
  :ensure t
  :config
  (add-hook 'inf-clojure-mode 'paredit-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (diminish 'flycheck-mode))

;; (use-package flycheck-joker
;;   :ensure t
;;   :requires flycheck)

(use-package flycheck-clj-kondo
         :ensure t
;;         :config

         ;;(dolist (checkers '((clj-kondo-clj . clojure-joker)
         ;;                    (clj-kondo-cljs . clojurescript-joker)
         ;;                    (clj-kondo-cljc . clojure-joker)))
         ;;  (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))
        )

        ;; then install the checker as soon as `clojure-mode' is loaded
        (use-package clojure-mode
        :ensure t
        :config
        (require 'flycheck-clj-kondo))

(use-package html-to-hiccup
  :ensure t
  :config
    (define-key clojure-mode-map (kbd "H-h") 'html-to-hiccup-convert-region))

(use-package lsp-mode
            :commands lsp
            :ensure t
            :hook ((clojure-mode . lsp)
                   (clojurec-mode . lsp)
                   (clojurescript-mode . lsp))
            :init
            (setq lsp-keymap-prefix "s-l")
            (setq lsp-clojure-server-command '("bash" "-c" "cd ~/projects/clojure/clojure-lsp && lein run"))
            (setq lsp-enable-indentation nil)
            (setq lsp-enable-completion-at-point nil)
            (setq lsp-eldoc-enable-hover nil)
;;            (setq lsp-enable-symbol-highlighting nil)

            :config
            (lsp-enable-which-key-integration t)
             ;;add paths to your local installation of project mgmt tools, like lein
            (setenv "PATH" (concat
                             "/usr/local/bin" path-separator
                             (getenv "PATH")))
            (dolist (m '(clojure-mode
                         clojurec-mode
                         clojurescript-mode
                         clojurex-mode))
               (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
            (setq lsp-clojure-server-command '("bash" "-c" "clojure-lsp")  ;;Optional: In case `clojure-lsp` is not in your PATH
                  lsp-enable-indentation nil))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(use-package gist :ensure t)

(add-to-list 'auto-mode-alist '("\\.sql\\'" . sql-mode))

(setq sql-connection-alist
      '((localhost.dev
         (sql-name "localhost.dev")
         (sql-default-directory nil)
         (sql-postgres-program "psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsdev")
         (sql-database "imsdb_dev"))

        (localhost.test
         (sql-name "localhost.test")
         (sql-postgres-program "psql")
         (sql-default-directory nil)
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imstest")
         (sql-database "imsdb_test"))

        (oic.prod
         (sql-name "oic.prod")
         (sql-default-directory "/ssh:devel.jmayaalv@oicdb:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsoicprod")
         (sql-database "imsoicproddb"))

        (omi.prod
         (sql-name "omi.prod")
         (sql-default-directory "/ssh:devel.jmayaalv@omidb:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsomiprod")
         (sql-database "imsomiproddb"))

         (omnia.test
         (sql-name "omnia.test")
         (sql-default-directory "/ssh:devel.jmayaalv@omniatest:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsombps")
         (sql-database "imsombpsdb"))

        (oic.test3
         (sql-name "oic.test3")
         (sql-default-directory "/ssh:devel.jmayaalv@oictest3:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsoictest3")
         (sql-database "imsoictest3db"))

        (veritas.test
         (sql-name "veritas.test")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@veritastest:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsveritastest1")
         (sql-database "imsveritastest1db"))

        (veritas.prod
         (sql-name "veritas.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@veritasprod:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsveritasprod")
         (sql-database "imsveritasproddb"))

        (omi.test1
         (sql-name "omi.test1")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@omitest:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsomitest1")
         (sql-database "imsomitest1db"))

       (omi.test2
         (sql-name "omi.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@omitest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsomitest2")
         (sql-database "imsomitest2db"))

      (omi.test4
         (sql-name "omi.test4")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@omitest4:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsomitest4")
         (sql-database "imsomitest4db"))

        (northstar.prod
         (sql-name "northstar.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@nsdb:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsbcgprod")
         (sql-database "imsbcgproddb"))


       (northstar.test
         (sql-name "northstar.test")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@nstest1:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsnfstest1db")
         (sql-database "imsnfstest1"))

        (sanlam.prod
         (sql-name "sanlam.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@sanlamdb:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imssanlamprod")
         (sql-database "imssanlamproddb"))

        (glacier.test
         (sql-name "glacier.test1")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@glaciertest:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsglaciertest1")
         (sql-database "imsglaciertest1db"))

       (glacier.test2
         (sql-name "glacier.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@glaciertest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsglaciertest2")
         (sql-database "imsglaciertest2db"))

        (glacier.prod
         (sql-name "glacier.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@glacierdb:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsglacierprod")
         (sql-database "imsglacierproddb"))

        (omnia.prod
         (sql-name "omnia.prod")
         (sql-postgres-program "/usr/local/postgresql-12.2/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@omniadb:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsombprod")
         (sql-database "imsombproddb"))

        (agl.prod
         (sql-name "agl.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@agldb:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsdartaprod")
         (sql-database "imsdartaproddb"))
        (argus.prod
         (sql-name "argus.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@argusprod:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsargusprod")
         (sql-database "imsargusproddb"))
        (providence.prod
         (sql-name "providence.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@providenceprod:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsprovidenceprod")
         (sql-database "imsprovidenceproddb"))))

(defun sql-localhost.dev ()
   (interactive)
   (my-sql-connect  'postgres 'localhost.dev))

 (defun sql-localhost.test ()
   (interactive)
   (my-sql-connect  'postgres 'localhost.test))

 (defun sql-oic.prod ()
   (interactive)
   (my-sql-connect 'postgres 'oic.prod))

 (defun sql-omnia.prod ()
   (interactive)
   (my-sql-connect 'postgres 'omnia.prod))

 (defun sql-agl.prod ()
   (interactive)
   (my-sql-connect 'postgres 'agl.prod))

 (defun sql-omi.prod ()
   (interactive)
   (my-sql-connect 'postgres 'omi.prod))

 (defun sql-oic.test3 ()
   (interactive)
   (my-sql-connect 'postgres 'oic.test3))

 (defun sql-glacier.prod ()
   (interactive)
   (my-sql-connect 'postgres 'glacier.prod))

 (defun sql-argus.prod ()
   (interactive)
   (my-sql-connect 'postgres 'argus.prod))

 (defun sql-providence.prod ()
   (interactive)
   (my-sql-connect 'postgres 'providence.prod))

 (defun sql-glacier.test ()
   (interactive)
   (my-sql-connect 'postgres 'glacier.test))

(defun sql-glacier.test2 ()
   (interactive)
   (my-sql-connect 'postgres 'glacier.test2))

 (defun sql-veritas.test ()
   (interactive)
   (my-sql-connect 'postgres 'veritas.test))

 (defun sql-veritas.prod ()
   (interactive)
   (my-sql-connect 'postgres 'veritas.prod))

 (defun sql-sanlam.prod ()
   (interactive)
   (my-sql-connect 'postgres 'sanlam.prod))

 (defun sql-northstar.prod ()
   (interactive)
   (my-sql-connect 'postgres 'northstar.prod))

 (defun sql-northstar.test ()
   (interactive)
   (my-sql-connect 'postgres 'northstar.test))

 (defun sql-omi.test1 ()
   (interactive)
   (my-sql-connect 'postgres 'omi.test1))

(defun sql-omi.test2 ()
   (interactive)
   (my-sql-connect 'postgres 'omi.test2))

(defun sql-omi.test4 ()
   (interactive)
   (my-sql-connect 'postgres 'omi.test4))

 (defun sql-omnia.test ()
   (interactive)
   (my-sql-connect 'postgres 'omnia.test))

 (defun my-sql-connect (product connection)
   (setq sql-product product)
   (sql-connect connection))

 (defun sql-connect-preset (product name)
   "Connect to a predefined SQL connection listed in `sql-connection-alist'"
   (setq sql-product product)
   (eval `(let ,(cdr (assoc name sql-connection-alist))
            (flet ((sql-get-login (&rest what)))
              (sql-product-interactive sql-product)))))

(defun sql-make-smart-buffer-name ()
  "Return a string that can be used to rename a SQLi buffer.
  This is used to set `sql-alternate-buffer-name' within
  `sql-interactive-mode'."
  (or (and (boundp 'sql-name) sql-name)
      (concat (if (not(string= "" sql-server))
                  (concat
                   (or (and (string-match "[0-9.]+" sql-server) sql-server)
                       (car (split-string sql-server "\\.")))
                   "/"))
              sql-database)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (setq sql-alternate-buffer-name (sql-make-smart-buffer-name))
            (sql-rename-buffer)))

(defun sql-add-newline-first (output)
   "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
  (concat "\n" output))

(defun sqli-add-hooks ()
  "Add hooks to `sql-interactive-mode-hook'."
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

(setq ispell-program-name "aspell"
      ispell-dictionary "english")

(setq org-replace-disputed-keys t)
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c w") 'widen)
(global-set-key (kbd "C-c n") 'calendar)

(setq org-agenda-files (quote ("~/org"
                               "~/Developer/ms-edge/edge/doc"
                               "~/Developer/ims-api/docs/org"
                               "~/Developer/kane-labs/silnik/doc"
                               "~/org/architecture")))

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))


(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-directory "~/org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;;Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets
(setq org-refile-use-outline-path t)

; Targets complete directly
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t


; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)


; Exclude DONE state tasks from refile targets
(defun jm/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'jm/verify-refile-target)

(setq org-src-fontify-natively t)

(setq ispell-program-name (executable-find "aspell"))

;;      (add-hook 'org-mode-hook
;;                (lambda () (local-set-key (kbd "s-h") 'helm-org-headlines)))

;; (use-package helm-orgcard
;;  :ensure t
;;  :config
;;  (add-hook 'org-mode-hook
;;   (lambda () (local-set-key [s-f1] 'helm-orgcard))))

(use-package ox-reveal :ensure t)

(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

(use-package orgit
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package ox-reveal
;;   :ensure t
;;   :init (progn
;;           (setq org-reveal-root "https://cdn.jsdelivr.net/reveal.js/3.0.0/")
;;           (setq org-reveal-mathjax t)))

(use-package tagedit
 :ensure t
 :config
 (eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
 (tagedit-add-experimental-features))

(add-hook 'css-mode-hook 'paredit-mode)

(add-hook 'css-mode-hook 'rainbow-mode)

(use-package css-eldoc :ensure t)

;; (use-package helm-css-scss
;;  :ensure t
;;  :config
;;  (add-hook 'css-mode-hook
;;             (lambda () (local-set-key (kbd "s-h") 'helm-css-scss))))

(use-package htmlize
  :ensure t)

(use-package markdown-mode
 :ensure t
 :commands (markdown-mode gfm-mode)
 :mode (("README\\.md\\'" . gfm-mode)
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode))
 :init (setq markdown-command "markdown"))

(add-to-list 'auto-mode-alist '(".md$" . gfm-mode))

(setq markdown-open-command "open")

(use-package json-mode
  :ensure t)

(use-package yaml-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package plantuml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode)))

(use-package vlf :ensure t)

(use-package logview
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.log\\'" . logview-mode)))

(global-set-key [remap comment-dwim] #'comment-line)
(global-set-key [remap paredit-comment-dwim] #'comment-line)

(use-package restclient
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode)))

(setq auth-source-debug t)
(setq tramp-default-user "devel.jmayaalv")
(setq tramp-default-method "ssh")
(setq tramp-chunksize 500)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))

(setq auth-sources
  '((:source "~/.emacs.d/secrets/authinfo.gpg")))

  ;(custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg2"))

(setq epa-pinentry-mode 'loopback)

(defvar *atlas-home* "/Users/juan.maya/Developer/db-support")

(defun atlas-migration-name (path client branch)
     "New migration with `PATH` name on the given `CLIENT` using the `BRANCH` and current time."
     (format "%s/sql/%s/%s-%s.up.sql" path client (format-time-string "%Y%m%d%H%M%S") branch))

(defun atlas-migration (client branch)
         "Create a new migration on the given `CLIENT` in the new `BRANCH` and outputs the migration on a new buffer."
         (interactive "sclient? \nsbranch? ")
         (let ((migration-file-path (atlas-migration-name *atlas-home* client branch)))
           (switch-to-buffer (generate-new-buffer migration-file-path))
           (write-file migration-file-path)
           (message (format "new migration: %s on branch: %s" migration-file-path branch))))
