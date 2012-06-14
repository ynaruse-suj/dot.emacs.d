;キーボードから入力される文字コード
(set-keyboard-coding-system 'sjis)

;ターミナルの文字コード
(set-terminal-coding-system 'utf-8)

;ファイル名の文字コード
(setq default-file-name-coding-system 'japanese-cp932-dos)

;クリップボードの文字コード
;; MS Windows clipboard
(set-clipboard-coding-system 'utf-16le-dos)

;; MS-Windows shell-mode
(add-hook
 'shell-mode-hook
 '(lambda ()
   (set-buffer-process-coding-system 'sjis 'sjis)))

;; Cygwin入ってる場合に設定しておくとfind grep使える
(setq find-dired-find-program "c:/cygwin/bin/find.exe")
(setq find-program "c:/cygwin/bin/find.exe")
(setenv "PATH" (format "c:/cygwin/bin;%s" (getenv "PATH")))


;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; NTEmacs (emacs 22.x) =>
;;  日本語文字: モトヤシーダまたはモトヤアポロを用意してください.
;;  英文字: consolas を用意してください.(Vista はデフォルトで入ってます. XP は microsoft からダウンロードしてください.)
;; NTEmacs (emacs 23.x) =>
;;  日本語文字: MS ゴシック
;;  英文字: consolas
;; GNU Emacs 23.x on unix =>
;;  ~/.Xresources にて日本語フォントを設定してください.
(set-default-font "Consolas 10")
(set-fontset-font (frame-parameter nil 'font)
				  'japanese-jisx0208
				  '("ＭＳ ゴシック" . "unicode-bmp")
				  )
(set-fontset-font (frame-parameter nil 'font)
	    'katakana-jisx0201
	    '("ＭＳ ゴシック" . "unicode-bmp")
	    )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フォントの設定
;;01234567890123456789
;;あいうえおかきくけこ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(cond (window-system
;       (set-face-attribute 'default nil
;                           :family "さざなみゴシック"
;                           :height 80)
;       (set-fontset-font (frame-parameter nil 'font)
;                         'japanese-jisx0208
;                         '("Takaoゴシック" . "unicode-bmp")
;                         )
;       (set-fontset-font (frame-parameter nil 'font)
;                         'katakana-jisx0201
;                         '("Takaoゴシック" . "unicode-bmp")
;                         )
;       (setq face-font-rescale-alist
;             '(
;               (".*さざなみゴシック.*" . 1.0)
;               (".*Takaoゴシック.*"    . 1.1)
;               ))
;       ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


;(set-face-attribute 'default nil
;		    :family "Ricty"
;		    :height 160)
;(set-fontset-font
; nil 'japanese-jisx0208
; (font-spec :family "Ricty"))
;;(add-to-list 'default-frame-alist '(font . "ricty-13.5"))
;(add-to-list 'default-frame-alist '(font . "ricty-12"))


; 機種依存文字
(require 'cp5022x)
; charset と coding-system の優先度設定
(set-charset-priority 'ascii
                      'japanese-jisx0208
                      'latin-jisx0201
                      'katakana-jisx0201
                      'iso-8859-1
                      'cp1252
                      'unicode)
(set-coding-system-priority 'utf-8
                            'euc-jp
                            'iso-2022-jp
                            'cp932)


;; 半透明化
;; 透明度の設定
(add-to-list 'default-frame-alist '(alpha . 80))


;; ツールバーの非表示
(if window-system (progn
		    (tool-bar-mode nil)))
