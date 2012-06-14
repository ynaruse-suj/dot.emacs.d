;; yasnippet
;; snippet(部品)を内部に持っていてコード補完をしてくれる
;; Emacsのメニューを表示している場合項目が追加されている
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet/snippets")

;; rails-snippets
;; rails用のコード補完
(yas/load-directory "~/.emacs.d/site-lisp/yasnippets-rails/rails-snippets")

