;;オートコンプリート
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(add-to-list 'ac-modes 'objc-mode) ;; Objective-C用：objc-modeになったら、auto-completeをスタートさせる
(add-to-list 'ac-modes 'php-mode)  ;; PHP用：php-modeになったら、auto-completeをスタートさせる
(add-to-list 'ac-modes 'ruby-mode)  ;; Ruby用：ruby-modeになったら、auto-completeをスタートさせる
(add-to-list 'ac-modes 'js2-mode)  ;; Ruby用：ruby-modeになったら、auto-completeをスタートさせる
