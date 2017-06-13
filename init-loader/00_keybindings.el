(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map [?¥] [?\\])
(define-key global-map (kbd "C-z") nil)
;; g: grep
(define-key global-map (kbd "C-x g") 'ag)
;; re: replace
(define-key global-map (kbd "C-x re") 'query-replace)
;; reload buffer
(global-set-key "\M-r" 'revert-buffer-no-confirm)
