;; 共通ロードパスの追加
(load "~/.emacs.d/init-load-path")

;; 全体的な環境設定
;; Unicodeをメインにする場合の設定
;使用する言語環境
(set-language-environment 'Japanese)
;開く場合に優先する文字コード
(prefer-coding-system       'utf-8)
;デフォルトで使用する文字コード
(set-default-coding-systems 'utf-8)
;新しいファイルを作成するときの文字コード
(setq default-buffer-file-coding-system 'utf-8)

;; Windows依存とMac依存の設定ファイルを別ファイルからそれぞれ読む
(cond
 ((eq window-system 'w32)
  (load "~/.emacs.d/init-windows"))
 ((eq window-system 'ns)
  (load "~/.emacs.d/init-macos"))
 ((eq window-system 'mac)
  (load "~/.emacs.d/init-macos"))
 ((eq window-system 'x)
  (load "~/.emacs.d/init-xwindow")))

;; auto-install
;; wgetが必要
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install/") ;Emacs Lispをインストールするディレクトリの指定
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup) ;install-elisp.elとコマンド名を同期
;(setq auto-install-use-wget t)

;; オートコンプリート設定の読み込み
(load "~/.emacs.d/init-auto-complete")

;; タブバー設定の読み込み
(if window-system (progn
		    (load "~/.emacs.d/init-tabbar")
		    ))

;; snippet設定の読み込み
(load "~/.emacs.d/init-snippet")

;; モード設定の読み込み
(load "~/.emacs.d/init-modes")

;; flymake設定の読み込み
(load "~/.emacs.d/init-flymake")

;; タブキー設定の読み込み
(load "~/.emacs.d/init-tabkey")

;; 全角空白、タブ、改行表示モード設定の読み込み
(load "~/.emacs.d/init-jaspace")

;; ファイルナビゲーション設定の読み込み
(load "~/.emacs.d/init-navigation")

;; バッファ2分割時の縦横トグル設定の読み込み
(load "~/.emacs.d/init-window-toggle-division")

;; アウトラインモード設定の読み込み
(load "~/.emacs.d/init-outline-tree")

;; 編集行のハイライト設定の読み込み
(if window-system (progn
		    (load "~/.emacs.d/init-hilight-line")
		    ))

;; 行の折り返しON/OFF設定の読み込み
(load "~/.emacs.d/init-truncate-lines")


;; Interactively Do Things (highly recommended, but not strictly required)
;; ファイルやバッファのオープン、切り替えをサポート
;; C-sで次のファイルを選択、C-rで前のファイルを選択
;; tabで補完一覧表示。一覧が一つしかない時はそのファイルを開く。
;; C-fすると通常のC-x C-fの状態に戻る
;; //でルートディレクトリへ
;; C-x C-dでDired
(require 'ido)
;;(ido-mode t)
(ido-mode 'buffer)
(setq ido-enable-flex-matching t)
(setq ido-confirm-unique-completion t)
(setq ido-default-buffer-method 'samewindow)
(setq ido-use-filename-at-point t)
(ido-mode t)
(ido-everywhere t)
;;(set-face-background 'ido-first-match "Gray")
;;(set-face-foreground 'ido-subdir "blue3")
(icomplete-mode 1)
(custom-set-variables
 '(ido-enable-last-directory-history nil)
 '(ido-record-commands nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0))


;; ウィンドウフレームの設定
;; ウィンドウ設定
(if window-system (progn
		    (setq initial-frame-alist
			  '((top . 20) 
			    (left . 60)
			    (width . 165) (height . 60) ))
		    (set-background-color "Black")
		    (set-foreground-color "White")
		    (set-cursor-color "Gray")
		    ))

;; メニューバーを消す
(menu-bar-mode -1)
;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)

;; モードライン設定
;; モードラインに時間を表示する
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; モードラインに行数とカラムを表示
(line-number-mode 1)
(column-number-mode 1)

;; モードラインの色
(set-face-foreground 'modeline "light blue")
(set-face-background 'modeline "grey19")
;(set-face-background 'modeline "black")

;; モードラインにバッテリ残量表示
(display-battery-mode t)

;; タイトルバー設定
;; タイトルバーにファイル名を表示
;(setq frame-title-format "%b")
;; ウィンドウタイトルをファイルパスに
(setq frame-title-format (format "%%f - Emacs @%s" (system-name)))

;; ショートカットキー設定
;; M-g で指定行へ移動
(global-set-key "\M-g" 'goto-line)

;; 複数行コメントブロック
(global-set-key "\C-c>" 'comment-region)
(global-set-key "\C-c<" 'uncomment-region)

;; ファイル編集回り設定
;; 前回編集していた場所を記憶
(load "saveplace")
(setq-default save-place t)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; Beep音を消す(その代わりにBeep音が鳴るタイミングで画面が点滅)
(setq visible-bell t)
;; Beep音を鳴らす(画面の点滅は無い)
;(setq visible-bell nil)
;; Beep音も点滅もしないように無効な関数を設定してみる
(setq ring-bell-function 'ignore)

;; リージョンに色を付ける
(setq transient-mark-mode t)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
;(setq auto-save-default nil)


;; ファイルを訪問時のフックからvc-find-file-hookを削除
;; こいつが有効だと、gitとかcvsとかのディレクトリがある場合に
;; 再帰的にいろいろ調査しようとして、動きがすごく重たい
;; ネットワークディレクトリ上のファイルを開くと顕著
;; gitとかcvsとかの便利機能をemacsで使わないならオフ
;; ちなみにgitはmagitというlispがある。でもWindowsでは動かないかも
(remove-hook 'find-file-hooks 'vc-find-file-hook)
;;(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
