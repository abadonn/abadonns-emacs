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
