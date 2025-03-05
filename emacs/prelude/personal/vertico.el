(prelude-require-packages '(marginalia embark-consult consult embark  orderless))

;; The `marginalia' package provides helpful annotations next to
;; completion candidates in the minibuffer.  The information on
;; display depends on the type of content.  If it is about files, it
;; shows file permissions and the last modified date.  If it is a
;; buffer, it shows the buffer's size, major mode, and the like.
;;

(marginalia-mode 1)

(setq completion-styles '(orderless basic))
(global-set-key (kbd "C-s") 'consult-line)
