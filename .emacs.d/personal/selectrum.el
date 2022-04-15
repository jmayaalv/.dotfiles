(prelude-require-packages  '(prescient selectrum-prescient marginalia embark consult))

(prescient-persist-mode +1)
(selectrum-prescient-mode 1)
(prescient-persist-mode 1)
(global-set-key [remap execute-extended-command] 'execute-extended-command)

(marginalia-mode)
(advice-add #'marginalia-cycle :after
            (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))
(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(global-set-key (kbd "C-s") 'consult-line)
