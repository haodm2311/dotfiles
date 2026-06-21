(setq inhibit-startup-message t)

;; Ui custom
(scroll-bar-mode -1) ;Disable visible scrollbar
(tool-bar-mode -1) ;Disable visible tool bar
(tooltip-mode -1) ;Disable tooltips
(menu-bar-mode -1) ;Disable menu bar
;(set-frame-parameter nil 'undecorated-round t) ;Disable title bar
(setq visible-bell t) ;Set up visible bell to avoid flash when press tab button

;; Map keys
(setq mac-command-modifier 'meta) ;Map option to command

;; Themes
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one-light t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("87fa3605a6501f9b90d337ed4d832213155e3a2e36a512984f83e847102a42f4"
     "166a2faa9dc5b5b3359f7a31a09127ebf7a7926562710367086fcc8fc72145da"
     "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755"
     default))
 '(package-selected-packages '(doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
