(prelude-require-package  'diminish)

;; Start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; No need for ~ files when editign
(setq create-lockfiles nil)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)
;; Use UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)

;; Delete Selection Mode
(delete-selection-mode t)

;; Hippie Expand
(global-set-key (kbd "M-RET") 'hippie-expand)


;; No tabs
(setq-default indent-tabs-mode nil)

;;; Uniquify
;;   When several buffers visit identically-named files, Emacs must give the
;;   buffers distinct names. There are several different styles for constructing
;;   such names. Post-forward puts the dricetory names in forward order after
;;   the file name.

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Discover mode
(prelude-require-package  'discover)
(global-discover-mode 1)


;; Disable beep
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)


;; Emacs sessions
(desktop-save-mode 1)

;; Auto-save in the visited file
(setq auto-save-visited-file-name t)

;; delete trailiing whitespace
(add-hook 'before-save-hook
          (lambda nil
            (delete-trailing-whitespace)))

;; disable beep
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; Don't split windows automatically
(setq split-height-threshold nil
      split-width-threshold nil)


;; all the icons
(when (display-graphic-p)
  (prelude-require-package 'all-the-icons))

;; line nunbers in progmode only
(defun custom-display-line-numbers ()
  (setq  display-line-numbers 'absolute
         display-line-numbers-current-absolute t
         display-line-numbers-width 4
         display-line-numbers-widen t)
  (set-face-attribute 'line-number-current-line nil
                      :background "#696969" :foreground "black"))

(add-hook 'prog-mode-hook (lambda ()
                            (custom-display-line-numbers)))

;; Transparency
(defun toggle-transparency ()
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))
(global-set-key (kbd "C-c C-t") 'toggle-transparency)

;; Modeline
(prelude-require-package 'doom-modeline)
(setq  all-the-icons-color-icons nil
       inhibit-compacting-font-caches t
       find-file-visit-truename t
       doom-modeline-vcs-max-length 20)
(doom-modeline-mode 1)

;;; Dimmer
;;  subtle visual indication which window is currently active by dimming the
;;  faces on the others.
(prelude-require-package 'dimmer)
(setq dimmer-percent 0.4)
(dimmer-activate)


;;; Beacon
(prelude-require-package 'beacon)
(beacon-mode 1)
(setq beacon-blink-duration 0.5)
(setq beacon-blink-delay 0.5)
(add-to-list 'beacon-dont-blink-major-modes '('term-mode 'ediff-mode 'ediff))

;; Spinner
(prelude-require-package 'spinner)

;;; buffer movement
;; Sometimes the problem isn't that you want to move the cursor to a
;; particular window, but you want to move a buffer. buffer-move lets
;; you do that.
(global-set-key (kbd "<s-up>") 'buf-move-up)
(global-set-key (kbd "<s-down>") 'buf-move-down)
(global-set-key (kbd "<s-left>") 'buf-move-left)
(global-set-key (kbd "<s-right>") 'buf-move-right)

;; shrink and enlarge windows
(global-set-key (kbd "s-=") 'shrink-window)
(global-set-key (kbd "s-+") 'enlarge-window)

;; Backup Directore
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; Clean obsolete buffers automatically
(prelude-require-package 'midnight)

;; Move lines
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


;; Projectile
(when prelude-super-keybindings
  (define-key prelude-mode-map (kbd "s-R") 'projectile-recentf))
