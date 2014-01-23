(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'cl)
(require 'uniquify)
(require 'package)
(require 'yasnippet)

(when (window-system)
  (require 'git-gutter-fringe))

;;; Set up font and unicode fallback
(setq initial-frame-alist '((font . "Droid Sans Mono-9")))
(setq default-frame-alist '((font . "Droid Sans Mono-9")))

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 11
                               :weight 'normal)))


;;;  Startup settings
(global-rainbow-delimiters-mode)
(ac-config-default)
(yas-global-mode)
(sml/setup)

(setq-default inhibit-startup-screen t
              initial-scratch-message nil)

(show-paren-mode t)

(when (window-system)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 0)
  (blink-cursor-mode 0)

  (global-git-gutter-mode 1)
  (setq-default indicate-buffer-boundaries 'left)
  (setq-default indicate-empty-lines 1))

(server-mode)

(global-auto-revert-mode)
(global-hl-line-mode t)

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


;;;  Mode settings
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (c-set-offset 'substatement-open 0)
            (local-set-key (kbd "C-c C-m") 'compile)))

(add-hook 'css-mode-hook (lambda () (setq css-indent-offset 2)))

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(add-hook 'text-mode-hook (lambda () (auto-fill-mode t)))

(add-hook 'haskell-mode-hook (lambda () (turn-on-haskell-indentation)))

(load-theme 'gandalf t)
