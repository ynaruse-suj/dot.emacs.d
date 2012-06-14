;; キーボードから入力される文字コード
(set-keyboard-coding-system 'sjis-mac)

;; ターミナルの文字コード
(set-terminal-coding-system 'utf-8)

;; ファイル名の文字コード
(when (>= emacs-major-version 23)
  (set-file-name-coding-system 'utf-8)
)
(when (<= emacs-major-version 22)
  (require 'utf-8m)
  (set-file-name-coding-system 'utf-8m)
)

;; クリップボードの文字コード
(set-clipboard-coding-system 'utf-8)

;;;キーバインド設定
;; Macのキーバインドを使う。optionをメタキーにする。
(when (<= emacs-major-version 22)
  (mac-key-mode 1)
)
(setq mac-option-modifier 'meta)


(when (>= emacs-major-version 23)
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)
)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)


;; フォント設定
;(if (eq window-system 'mac) (require 'carbon-font))
;(fixed-width-set-fontset "hirakaku_w3" 12)
;(setq fixed-width-rescale nil)

;(if (eq window-system 'mac) (progn 
;							  (require 'carbon-font)
;							  (fixed-width-set-fontset "hirakaku_w3" 12)
;							  (setq fixed-width-rescale nil)
;;							  (set-default-font "fontset-hiraginomaru12")
;;							  (setq default-frame-alist (append '((font . "fontset-hiraginomaru12"))))
;))

(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 160)
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Ricty"))
;(add-to-list 'default-frame-alist '(font . "ricty-13.5"))
(add-to-list 'default-frame-alist '(font . "ricty-11"))



;; growl messages at file saved
(defun growlnotify-after-save-hook ()
  (shell-command
   (format "growlnotify -t \"Emacs\" -m \"saved : %s \""
		   (buffer-name (current-buffer)))))
(add-hook 'after-save-hook 'growlnotify-after-save-hook)

;; 半透明化
;; 透明度の設定
(add-to-list 'default-frame-alist '(alpha . 80))

