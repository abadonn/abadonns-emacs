;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Emacs24 setup file          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting python virtual env         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(push "~/venvs/emacs/bin" exec-path)
(setenv "PATH"
        (concat
         "~/venvs/emacs/bin" ":"
         (getenv "PATH")
         ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package archives                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package) (setq package-archives '(
  ("gnu" ."http://elpa.gnu.org/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/")
  ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installing some default packages   ;;
;; that we want to have everywhere    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)

(defvar prelude-packages
  '(multi-term python-mode yasnippet php-mode php-extras web-mode
               blank-mode csv-mode cyberpunk-theme debian-changelog-mode
               highline windata tree-mode dirtree auto-complete
               js2-mode bookmark+ magit)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up manually retrieved pkgs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up installed packages      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq multi-term-program "/bin/zsh")

(global-highline-mode 1)
(set-face-background 'highline-face "#333")

(yas-global-mode 1)

(ac-config-default)
(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-ropemacs)))

(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(autoload 'global-blank-mode           "blank-mode" "Toggle blank visualization."        t)
(global-set-key "\M-#" 'global-blank-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;emacs can recognise lisp mode for .emacs but not emacs
(add-to-list 'auto-mode-alist '("emacs24" . lisp-mode))
(add-to-list 'auto-mode-alist '("emacs" . lisp-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Getting manually installed libs    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lib/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adding goodies to enhance use exp  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;IDO mode
(ido-mode t)
;persisting commands
(savehist-mode 1)
;colour theming
(load-theme 'cyberpunk t)
(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\' . ?\')
                            (?\{ . ?\})
                            ) )
;shortening yes / no to y / n
(defalias 'yes-or-no-p 'y-or-n-p)
;; Highlight parenthesis pairs
(show-paren-mode 1)

;;Turn on line numbers
(global-linum-mode 1)

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

;; ====================
;; insert date and time
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting indent standards           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replace TABs with 2 spaces
(setq-default c-basic-indent 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; Remove trailing white-spaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Add newline at the end of edited buffer
(defconst require-final-newline 1)
;; Show me trailing whitespaces, long lines and tabs
(require 'whitespace)
(autoload 'whitespace-mode
  "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options
  "whitespace" "Toggle local `whitespace-mode' options." t)
(global-whitespace-mode 1)
(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
(setq whitespace-line-column 120
      whitespace-style '(face tabs trailing lines-tail))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hacks - or - what needs to be      ;;
;; removed later                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hiding warnings when not developing emacs
;It is here for stuff like mumamo warnings etc
(setq warning-minimum-level :error)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/abadonn/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" default)))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
