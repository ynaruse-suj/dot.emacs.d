;; 右端で折り返さない
;(setq truncate-lines t)
;(setq truncate-lines t)
;(setq truncate-partial-width-windows t)
;(setq truncate-partial-width-windows nil)
(setq-default truncate-lines t)

;;====================================
;;; 折り返し表示ON/OFF
;;====================================
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
;;(global-set-key "\C-c\C-l" 'toggle-truncate-lines) ; 折り返し表示ON/OFF
;;Ctrの後にtr
(global-set-key "\C-ctr" 'toggle-truncate-lines) ; 折り返し表示ON/OFF


