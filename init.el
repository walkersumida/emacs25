;;cask
(require 'cask)
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(require 'init-loader)
(init-loader-load "~/.emacs.d/init-loader")
