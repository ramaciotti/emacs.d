(setq initial-frame-alist '((font . "Consolas-9")))
(setq default-frame-alist '((font . "Consolas-9")))

;; unicode fallback
(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 11
                               :weight 'normal)))

(load-theme 'sanityinc-tomorrow-day t)
