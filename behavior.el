(global-rainbow-delimiters-mode)

(semantic-mode)
(global-ede-mode 1)
(global-semantic-idle-local-symbol-highlight-mode)
(global-semantic-idle-summary-mode)
(global-semantic-idle-scheduler-mode)
(global-semantic-idle-completions-mode)

(ac-config-default)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)

(yas-global-mode)
(sml/setup)

(setq-default inhibit-startup-screen t
              initial-scratch-message nil)

(show-paren-mode t)
(server-mode)
(global-auto-revert-mode)

;;;  Behavior settings
(setq-default truncate-lines t
              default-truncate-lines t
              column-number-mode t
              line-number-mode t
              tab-width 4
              indent-tabs-mode nil
              fill-column 80
              make-backup-files nil
              read-file-name-completion-ignore-case t
              savehist-file "~/.emacs.d/savehist"
              use-dialog-box nil)

(savehist-mode t)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(setq uniquify-buffer-name-style 'post-forward)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(global-whitespace-mode t)
(setq whitespace-line-column 79)
(setq whitespace-style '(face lines-tail))

(sublimity-global-mode)
