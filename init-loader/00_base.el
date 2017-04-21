;; hide tool bar
(tool-bar-mode -1)
;; hide menu bar
(menu-bar-mode -1)

(prefer-coding-system 'utf-8)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

(setq backup-inhibited t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; share clipboard
(setq darwin-p   (eq system-type 'darwin)
      linux-p    (eq system-type 'gnu/linux)
      carbon-p   (eq system-type 'mac)
      meadow-p   (featurep 'meadow))
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(if (or darwin-p carbon-p)
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

;; jump
(require 'dumb-jump)
(dumb-jump-mode t)
(require 'ctags nil t)

(require 'git-gutter+)
(global-git-gutter+-mode t)

;; current row highlight
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#CCCCCC"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)

(global-hl-line-mode t)
;; matching pairs of parentheses
(show-paren-mode t)
(setq show-paren-style 'mixed)
;; selection-highlighting
(setq transient-mark-mode t)

(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq scroll-step 1)
(setq scroll-conservatively 1)

;; disabled auto-save
(setq auto-save-mode nil)
(setq buffer-auto-save-file-name nil)

;; hide startup message
(setq inhibit-startup-message t)

;; default text mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-hook 'text-mode-hook '(lambda ()
                             (electric-indent-local-mode -1)))
(add-hook 'lisp-mode-hook '(lambda ()
                             (electric-indent-local-mode -1)))

(setq text-mode-hook 'turn-off-auto-fill)

(column-number-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; english
(set-face-attribute 'default nil
                    :family "Menlo" ;; font
                    )    ;; font size

;; japanese
(set-fontset-font
 t 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))

;; turn off ring bell
(setq ring-bell-function 'ignore)
