(require 'package)
(add-to-list 'package-archives
         `("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version  24)
  (add-to-list 'package-archives
           `("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; zenburn-theme
(load-theme 'zenburn t)

;;============================================================
;; Packages
;;============================================================
;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; fill-column-indicator
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode)))
(setq default-fill-column 80)
(setq fci-rule-color "#DCDCDC")
(global-fci-mode)

;; ido-ubiquitous
(ido-mode)
(ido-ubiquitous)
(setq ido-everywhere t)

;; lua-mode

;; org

;; saveplace
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saved-places")

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; tabbar
(tabbar-mode)
(global-set-key (kbd "M-p") 'tabbar-backward)
(global-set-key (kbd "M-n") 'tabbar-forward)
 
;; undo-tree
(global-undo-tree-mode)
; persistent undo history
(setq undo-tree-history-directory-alist
      `((".*" . "~/.emacs.d/.undo/")))
(setq undo-tree-auto-save-history t)

;; yasnippet
(yas-global-mode)


;;============================================================
;; General Setting
;;============================================================
;; Turn off GUI stuff
(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq visible-bell t)
(setq inhibit-startup-message t)

;; font
(set-default-font "Yahei Mono")

(line-number-mode)
(column-number-mode)
;(global-hl-line-mode)
(global-linum-mode)

(setq mouse-yank-at-point t)

(setq kill-ring-max 256)


(setq default-frame-alist '((width . 86) (height . 48) (menu-bar-lines . 1)))

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq scroll-margin 3
      scroll-conservatively 10000)

(setq default-major-mode `text-mode)

(show-paren-mode)
(setq show-paren-style 'parenthesis)

(mouse-avoidance-mode 'animate)

(setq frame-title-format "emacs@%b")

(auto-image-file-mode)

(global-font-lock-mode)

(setq user-full-name "Sachs Wong")

(setq user-mail-address "sachswong27@gmail.com")

(setq version-control t                 ; Use version numbers for backups
      backup-by-copying t               ; Don't clobber symlinks
      kept-new-versions 8               ; Number of newest versions to keep
      kept-old-versions 2               ; Number of oldest versions to keep
      delete-old-versions t             ; Ask to delete excess backup versions?
      backup-directory-alist `((".*" . ,"~/.emacs.d/.backup/"))
      auto-save-list-file-prefix "~/.emacs.d/.autosave/"
      auto-save-file-name-transforms '((".*" "~/.emacs.d/.autosave/" t)))


;;=============================================================
;; Global Key Binding
;;=============================================================
(global-set-key (kbd "C-SPC") 'nil)
(global-set-key (kbd "C-M-SPC") 'set-mark-command)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;============================================================
;; C
;;============================================================
(defun on-c-mode-common()
  (message "on-c-mode-common")
  (c-set-style "stroustrup")
  )
(add-hook `c-mode-common-hook 'on-c-mode-common)

;;============================================================
;; Customize
;;============================================================
