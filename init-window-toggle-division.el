;; バッファが2分割されているときに縦横をトグル
(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let ((before-height)
        (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)
    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally))
    (other-window 1)
    (switch-to-buffer other-buf)
    (other-window -1)))
;;;(global-set-key "\C-c\C-o" 'window-toggle-division)
;;;(global-set-key "\C-c\[C-tab]" 'window-toggle-division)
; C-i-> tab
(global-set-key "\C-c\C-i" 'window-toggle-division)

