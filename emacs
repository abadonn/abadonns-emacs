;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adding goodies to enhance use exp  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;colour theming
(require 'color-theme)
(color-theme-initialize)
(color-theme-taming-mr-arneson)
;shortening yes / no to y / n
(defalias 'yes-or-no-p 'y-or-n-p) ;; less typing for me
;easy move of window
(global-set-key [M-left] 'windmove-left) ; move to left windnow
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up) ; move to upper window
(global-set-key [M-down] 'windmove-down) ; move to downer window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting indent standards           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replace TABs with 2 spaces
(setq-default c-basic-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; Remove trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Add newline at the end of edited buffer
(defconst require-final-newline 1)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hacks - or - what needs to be      ;;
;; removed later                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hiding warnings when not developing emacs
;It is here for stuff like mumamo warnings etc
;(setq warning-minimum-level :error)
