(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "~/.pyenv/shims/flake8")
(custom-set-variables
 '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128"))))
