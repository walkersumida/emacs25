;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'elixir-mode)
(add-to-list 'ac-modes 'go-mode)
