;; モード設定

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;;; K&R のスタイルを使う
             ;(c-set-style "k&r")
             (c-set-style "stroustrup")
             ;;; インデントには tab を使う
             (setq indent-tabs-mode t)
             ;;; インデント幅
             (setq c-basic-offset 4)
	     (setq tab-width 4)
             ))

;; C++ style
;(add-hook 'c++-mode-hook
;          '(lambda()
;             (c-set-style "stroustrup")
;             ;(setq indent-tabs-mode nil)     ; インデントは空白文字で行う（TABコードを空白に変換）
;             ;(c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
;             ;;; K&R のスタイルを使う
;             ;(c-set-style "k&r")
;             ;;; インデントには tab を使う
;             (setq indent-tabs-mode t)
;             ;;; インデント幅
;             (setq c-basic-offset 4)
;             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
;             ))

(setq auto-mode-alist
      ;;; 拡張子とモードの対応
      (append
       '(("\\.c$" . c-mode))
       '(("\\.h$" . c-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; php
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;php-mode
;(load-library "php-mode")
;(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (setq c-basic-offset 4)
	     (c-set-offset 'case-label' 4)
	     (setq indent-tabs-mode nil)
;;	     (setq indent-tabs-mode t)
	     ;; M-TAB が有効にならないので以下の設定を追加
;	     (define-key php-mode-map "\C-\M-i" 'php-complete-function)
	     ;; その他
;	     (define-key php-mode-map "\C-\M-a" 'php-beginning-of-defun)
;	     (define-key php-mode-map "\C-\M-e" 'php-end-of-defun)
;	     (setq php-manual-path "~/.emacs.d/manual/php") 
	     ;;C-cC-fで関数helpにジャンプ
	     (setq php-search-url "http://www.phppro.jp/")
	     (setq php-manual-url "http://www.phppro.jp/phpmanual")
;            複数行コメント
	     (setq comment-start "// ")
	     (setq comment-end "")
	     )
	  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(autoload 'python-mode "python-mode" "Major mode for editing python code." t)
;(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-hook 'python-mode-hook
	  '(lambda()
	     (setq tab-width 4)
	     (setq indent-level 4)
	     (setq python-indent 4)
	     (setq py-indent-offset 4)
	     (setq indent-tabs-mode nil)
;;	     (setq indent-tabs-mode t)
;        複数行コメント
	     (setq comment-start "# ")
	     (setq comment-end "")
	     )
	  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C# support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'flymake)
;(add-hook 'csharp-mode-hook
;	  '(lambda ()
;	     (flymake-mode t)))

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))
;; Patterns for finding Microsoft C# compiler error messages:
(require 'compile)
(push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): error" 1 2 3 2) compilation-error-regexp-alist)
(push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): warning" 1 2 3 1) compilation-error-regexp-alist)

;; Patterns for defining blocks to hide/show:
(push '(csharp-mode
        "\\(^\\s *#\\s *region\\b\\)\\|{"
        "\\(^\\s *#\\s *endregion\\b\\)\\|}"
        "/[*/]"
        nil
        hs-c-like-adjust-block-beginning)
      hs-special-modes-alist)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; javascript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'espresso)
              (setq espresso-indent-level 2
                    espresso-expr-indent-offset 2
                    indent-tabs-mode nil)
	      (setq comment-start "// ")
	      (setq comment-end "")
              (set (make-local-variable 'indent-line-function) 'espresso-indent-line)))


;(add-hook 'js2-mode-hook
;	  '(lambda()
;	     (setq tab-width 4)
;	     (setq indent-level 4)
;	     (setq js2-basic-offset 4)
;	     (setq indent-tabs-mode nil)
;;	     (setq indent-tabs-mode t)
;        複数行コメント
;	     (setq comment-start "// ")
;	     (setq comment-end "")
;	     )
;	  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; rubydb
(autoload 'ruby "rubydb2x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; ruby-electric.el --- electric editing commands for ruby files
;; if に対するendとか入れてくれる
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(let ((rel (assq 'ruby-electric-mode minor-mode-map-alist)))
  (setq minor-mode-map-alist (append (delete rel minor-mode-map-alist) (list rel))))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-modeのインデント
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; end に対応する行をハイライト
(require 'ruby-block)
(defun ruby-mode-hook-ruby-block()
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)
;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)
;; 何もしない
;(setq ruby-block-highlight-toggle 'noghing)
;; ミニバッファに表示
;(setq ruby-block-highlight-toggle 'minibuffer)
;; オーバレイする
;(setq ruby-block-highlight-toggle 'overlay)


;; rhtml-mode
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  (lambda () (rinari-launch)))

;; haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;;sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;; Ruby on Railsの開発サポート
;; C-c ; f c (controller を開く)
;; C-c ; f h (helper を開く)
;; C-c ; f i (migration を開く)
;; C-c ; f m (model を開く)
;; C-c ; f v (view を開く)
;; http://cocomonrails.blogspot.com/2009/07/emacs-rinari-yasnippet.html
;; Rinari
(require 'rinari)
(add-hook 'haml-mode-hook 'rinari-minor-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MarkDown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
;(setq auto-mode-alist
;      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkd$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn$" . markdown-mode))

;; C-c C-c m でカレントバッファを HTML に変換し新しいバッファに表示
;; C-c C-c p でカレントバッファを変換しブラウザで開く
;; C-c C-c e で変換して保存。basename.mdwn だったら basename.html として保存
;; Windowsの場合Markdown.plを実行できるように以下の設定を追記
(if (eq window-system 'w32) (progn
			      (setq markdown-command "c:/cygwin/bin/perl.exe ~/.emacs.d/site-lisp/Markdown.pl")
			      )
  (progn
    (setq markdown-command "perl ~/.emacs.d/site-lisp/Markdown.pl"))
)
