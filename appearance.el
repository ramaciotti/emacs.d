(when (window-system)
  (require 'git-gutter-fringe))

(when (window-system)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 0)
  (blink-cursor-mode 0)
  (global-git-gutter-mode 1))
