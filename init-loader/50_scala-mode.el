;; scala-mode
(require 'scala-mode)

(setenv "PATH" (concat "/usr/local/bin/sbt:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala:" (getenv "PATH")))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-hook 'ensime-mode-hook
          '(lambda ()
             (define-key ensime-mode-map (kbd "M-/") 'ensime-import-type-at-point)))
