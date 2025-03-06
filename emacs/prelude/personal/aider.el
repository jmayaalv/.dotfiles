(prelude-require-packages '(transient magit))
;;(package-vc-install '(aider :url "https://github.com/tninja/aider.el"))
(setq aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml")))
(global-set-key (kbd "C-c z") 'aider-transient-menu)
