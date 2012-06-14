;;全角空白、タブ文字、行末空白の表示
;;   http://homepage1.nifty.com/blankspace/emacs/color.html
;(defface my-face-b-1 '((t (:background "CadetBlue1"))) nil)
;(defface my-face-b-2 '((t (:background "LemonChiffon2"))) nil)
;(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;(defvar my-face-b-1 'my-face-b-1)
;(defvar my-face-b-2 'my-face-b-2)
;(defvar my-face-u-1 'my-face-u-1)
;(defadvice font-lock-mode (before my-font-lock-mode ())
;  (font-lock-add-keywords
;   major-mode
;   '(("　" 0 my-face-b-1 append)
;     ("\t" 0 my-face-b-2 append)
;     ("[ \t]+$" 0 my-face-u-1 append)
;     )))
;(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
;(ad-activate 'font-lock-mode)



;====================================
;;全角スペースとかに色を付ける
;====================================
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-1 '((t (:background "dark turquoise"))) nil)
(defface my-face-b-2 '((t (:background "cyan"))) nil)
(defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
;     ("　" 0 my-face-b-1 append)
;     ("\t" 0 my-face-b-2 append)
;     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                  (if font-lock-mode
                  nil
                (font-lock-mode t))))


;====================================
;;jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
;====================================
(require 'jaspace)
;; 全角空白を表示させる。
(setq jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる。
(setq jaspace-alternate-eol-string "↓\n")
;; タブ記号を表示。
;(setq jaspace-highlight-tabs t)  ; highlight tabs

;; EXPERIMENTAL: On Emacs 21.3.50.1 (as of June 2004) or 22.0.5.1, a tab
;; character may also be shown as the alternate character if
;; font-lock-mode is enabled.
;; タブ記号を表示。
;(setq jaspace-highlight-tabs ?^) ; use ^ as a tab marker
(setq jaspace-highlight-tabs ?>) ; use ^ as a tab marker
(setq jaspace-modes (append jaspace-modes ;; 各種 major mode で有効に
                            (list
                             'php-mode
                             'ruby-mode
                             'python-mode
                             'js2-mode
			     'css-mode
			     'html-mode
			     'text-mode
			     'markdown-mode
			     'espresso-mode
                             )))



