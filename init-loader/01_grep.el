; ag
(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-buffers t)

; wgrep
(require 'wgrep)
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t)
                           (setq wgrep-enable-key "r")
                           (wgrep-ag-setup)))
