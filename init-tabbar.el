;;タブバー
;;-----------------------------------------------------------
;; install http://www.emacswiki.org/emacs/download/tabbar.el
;; ref http://d.hatena.ne.jp/tequilasunset/20110103/p1
;; ref http://idita.blog11.fc2.com/blog-entry-810.html
(require 'tabbar)

;;====================================
;;; タブバーON/OFF
;;====================================
;(tabbar-mode 1)
(tabbar-mode 0)
;(setq-default tabbar-mode t)
(defun toggle-tabbar ()
  "トグル動作します."
  (interactive)
  (if tabbar-mode
      (tabbar-mode 0)
    (tabbar-mode 1))
  (recenter))
(global-set-key "\C-c\C-g" 'toggle-tabbar)


;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(1.0))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :background "black")
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "white"
 :box '(:line-width 1 :color "white" :style released-button))
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "cyan"
 :box '(:line-width 1 :color "white" :style pressed-button))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute
 'tabbar-separator nil
 :height 0.5)

   ;; タブがはみ出た時はスクロール(初期値t・nilで省略表示)
;; (setq tabbar-auto-scroll-flag nil)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; タブ切り替えのキーバインド
(global-set-key (kbd "C-l") 'tabbar-forward-tab)
(global-set-key (kbd "C-h") 'tabbar-backward-tab)

;; タブ上をマウス中クリックでkill-buffer
(defun my-tabbar-buffer-help-on-tab (tab)
  "Return the help string shown when mouse is onto TAB."
  (if tabbar--buffer-show-groups
      (let* ((tabset (tabbar-tab-tabset tab))
             (tab (tabbar-selected-tab tabset)))
        (format "mouse-1: switch to buffer %S in group [%s]"
                (buffer-name (tabbar-tab-value tab)) tabset))
    (format "\
mouse-1: switch to buffer %S\n\
mouse-2: kill this buffer\n\
mouse-3: delete other windows"
            (buffer-name (tabbar-tab-value tab)))))

(defun my-tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-2)
      (with-current-buffer buffer
        (kill-buffer)))
     ((eq mouse-button 'mouse-3)
      (delete-other-windows))
     (t
      (switch-to-buffer buffer)))
    ;; Don't show groups.
    (tabbar-buffer-show-groups nil)))

(setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
(setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)

