
(setq inhibit-startup-message t)
(setq custom-file "~/.emacs.d/.emacs.custom.el")

;; Ui custom
(scroll-bar-mode -1) ;Disable visible scrollbar
(tool-bar-mode -1) ;Disable visible tool bar
(tooltip-mode -1) ;Disable tooltips
(menu-bar-mode -1) ;Disable menu bar
(setq visible-bell nil) ;Disable exclamation mark show up whenever press C-g

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Map keys
(setq mac-command-modifier 'meta) ;Map option to command

;; Initialize package
(require 'package)

(add-to-list 'package-archives '(("melpa" . "https://melpa.org/packages/")
	     ("org" . "https://orgmode.org/elpa/")
	     ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Set Themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one-light t))


;;; Set ivy for minbuffer autocompletion
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(load-file custom-file)
