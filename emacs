;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming Lang Support           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lib/")
;nxhtml plugin
(load "~/.emacs.d/lib/nxhtml/autostart")
;yasnippet plugin
(add-to-list 'load-path "~/.emacs.d/lib/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;autocomplete
(add-to-list 'load-path "~/.emacs.d/lib/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lib/auto-complete/lib/popup")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/auto-complete/dict")
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;emacs can recognise lisp mode for .emacs but not emacs
(add-to-list 'auto-mode-alist '("emacs" . lisp-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adding goodies to enhance use exp  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;colour theming
(require 'color-theme)
(color-theme-initialize)
(color-theme-taming-mr-arneson)
(setq mumamo-background-colors nil)
;; adding line and column ident
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
;shortening yes / no to y / n
(defalias 'yes-or-no-p 'y-or-n-p)
;; Highlight parenthesis pairs
(show-paren-mode 1)
;; Uniquify can recognise when two different buffers has same names
;; and adds additional string to distinguish them
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;easy move of window
(global-set-key [M-left] 'windmove-left) ; move to left windnow
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up) ; move to upper window
(global-set-key [M-down] 'windmove-down) ; move to downer window
;; Reload/Edit this file the easy way
(defun x-reload-dot-emacs()
  (interactive)
  (load-file "~/.emacs"))
(defun x-edit-dot-emacs()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key "\C-c\C-r" 'x-reload-dot-emacs)
(global-set-key "\C-c\C-e" 'x-edit-dot-emacs)

;; Place temp files into tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting indent standards           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replace TABs with 2 spaces
(setq-default c-basic-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; Remove trailing white-spaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Add newline at the end of edited buffer
(defconst require-final-newline 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hacks - or - what needs to be      ;;
;; removed later                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hiding warnings when not developing emacs
;It is here for stuff like mumamo warnings etc
;(setq warning-minimum-level :error)
