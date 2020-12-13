;; UI configuration

;; Save Emacs session
(desktop-save-mode 1)

;; Auto-save in the visited file
(setq auto-save-visited-file-name t)

(defun toggle-transparency ()
  "Set background transparent"
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))

(global-set-key (kbd "C-c C-t") 'toggle-transparency)

;; subtle visual indication which window is currently active by dimming the
;; faces on the others

(use-package dimmer
  :ensure t
  :config
  (progn (setq dimmer-percent 0.4)
        (dimmer-activate)))


;;Highlights the current line
(global-hl-line-mode t)

;; Ace window number
(with-eval-after-load 'ace-window
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))))

;; Move buffers
(use-package buffer-move
  :ensure t
  :bind (("<s-up>" . buf-move-up)
         ("<s-down>" . buf-move-down)
         ("<s-left>" . buf-move-left)
         ("<s-right>" . buf-move-right)))


;; Use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)
