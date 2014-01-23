(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (c-set-offset 'substatement-open 0)
            (local-set-key (kbd "C-c C-m") 'compile)
            (setq ac-sources (append '(ac-source-clang
                                       ac-source-yasnippet)
                                     ac-sources))))

(add-hook 'css-mode-hook (lambda () (setq css-indent-offset 2)))

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

(add-hook 'text-mode-hook (lambda () (auto-fill-mode t)))

(add-hook 'haskell-mode-hook (lambda () (turn-on-haskell-indentation)))
