(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist
    (append '(("\\.\\([pP][Llm]\\|al\\|t\\|psgi\\)$" . cperl-mode)) auto-mode-alist ))
(add-hook 'cperl-mode-hook
          (lambda()
             (setq indent-tabs-mode nil)
             (setq cperl-tab-always-indent t)
             (setq cperl-indent-parens-as-block t)
             (setq cperl-close-paren-offset -4)
             (setq cperl-continued-statement-offset 4)
             (setq cperl-indent-level 4)
             ))

;; perlbrew
(require 'perlbrew)
;;(perlbrew-use "perl-5.19.1")

