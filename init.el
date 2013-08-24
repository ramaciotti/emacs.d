(require 'cl)
(require 'uniquify)
(require 'package)

;;;  ELPA settings
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;;  Install missing packages
(package-initialize)

(defvar packages-list
  '(auto-complete
    color-theme-sanityinc-tomorrow
    csharp-mode        
    evil               
    evil-leader        
    evil-nerd-commenter
    evil-numbers       
    evil-paredit       
    flymake            
    flymake-easy       
    flymake-php        
    flymake-phpcs      
    gandalf-theme      
    go-mode            
    haskell-mode       
    less-css-mode      
    markdown-mode
    org                
    paredit            
    php-mode           
    popup              
    rainbow-delimiters 
    twilight-theme     
    undo-tree          
    yasnippet)
  "List of packages needs to be installed at launch")

(defun my/has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))

(when (my/has-package-not-installed)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")

  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))


;;  ELPA packages are loaded *after* this file, so we need this:
(defun my/after-init-hook ()
  (require 'auto-complete)
  (require 'auto-complete-config)
  (require 'yasnippet)

  (load-theme 'sanityinc-tomorrow-night)
  (global-rainbow-delimiters-mode)
  (ac-config-default)
  (yas-global-mode))

(add-hook 'after-init-hook 'my/after-init-hook)


;;;  Startup settings
(setq-default inhibit-startup-screen t
              initial-scratch-message nil)

(show-paren-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
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
(global-linum-mode t)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(setq uniquify-buffer-name-style 'post-forward)


;;;  Mode settings
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (c-set-offset 'substatement-open 0)))

(add-hook 'css-mode-hook (lambda () (setq css-indent-offset 2)))

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(add-hook 'text-mode-hook (lambda () (auto-fill-mode t)))


;;;  Automatically added text by Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58"
                              "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e"
                              "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a"
                              "6615e5aefae7d222a0c252c81aac52c4efb2218d35dfbb93c023c4b94d3fa0db"
                              "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523"
                              "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d"
                              default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
