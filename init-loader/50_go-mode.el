;; go
;; (eval-after-load "go-mode"
;;   '(require 'flymake-go))
(add-hook 'go-mode-hook #'flycheck-mode)

(add-to-list 'load-path "~/go/src/github.com/nsf/gocode/emacs")
(add-to-list 'load-path "~/go/src/github.com/golang/lint/misc/emacs")
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'golint)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "M-.") 'godef-jump)))

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-i") 'go-import-add)))

;; go-eldoc
;; (require 'go-eldoc)
;; (add-hook 'go-mode-hook 'go-eldoc-setup)
;; (set-face-attribute 'eldoc-highlight-function-argument nil
;;                     :underline t :foreground "green"
;;                     :weight 'bold)

;; flycheck
;; (add-hook 'go-mode-hook 'flycheck-mode)
