;; ruby-mode
;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(defun ruby-mode-set-encoding () nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ruby$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))

;; custom indent on ruby-mode
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; rvm
;;(require 'rvm)
;;(rvm-use-default)

;; rbenv
(require 'rbenv)
(global-rbenv-mode)

;; robe
;; (autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
;; (autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
;; (add-hook 'robe-mode-hook 'robe-ac-setup)

(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; rubocop
;; required) gem install rubocop -v [version]
(require 'rubocop)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))

;; rbeautify
;; required) gem install rbeautify
(defun ruby-beautify-buffer ()
  (interactive)
  (let (p rb)
      (setq p (point) rb (buffer-string))

      (with-temp-buffer
        (insert rb)
        (call-process-region (point-min) (point-max) "rbeautify" t t)
        (setq rb (buffer-string)))

      (erase-buffer)
      (insert rb)
      (goto-char p)))

(eval-after-load 'ruby-mode
  '(define-key ruby-mode-map (kbd "C-c C-v f") 'ruby-beautify-buffer))

;; refactor-mode
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

;; rspec-mode
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))
