(require 'org)
(require 'ob-C)
(require 'ob-ruby)

(setq org-src-fontify-natively t)

(defun org-confirm-babel-evaluate-settings (lang body)
  (not (or (string= lang "emacs-lisp")
           (string= lang "ruby")
           (string= lang "C")
           (string= lang "cpp")
           )))

(setq org-confirm-babel-evaluate 'org-confirm-babel-evaluate-settings)
