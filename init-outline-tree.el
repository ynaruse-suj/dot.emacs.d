;; アウトラインモード
;; *見出し
;; **小見出し
;; ** 小小見出し
(defun outtree ()
  "outline-tree"
  (interactive)
  (if 'outline-mode (outline-mode))
  (hide-body)
  (let* ((basename (princ (buffer-name)))
         (newtmp (concat basename "-tree")))
    (if (get-buffer newtmp)
        (unless (get-buffer-window newtmp)
            (split-window-vertically 10)
            (switch-to-buffer newtmp)
            (other-window 1))
      (progn
        (make-indirect-buffer (current-buffer) newtmp)
        (split-window-vertically 10)
        (switch-to-buffer newtmp)
        (if 'outline-mode (outline-mode))
        (hide-sublevels 1)
        (other-window 1)))))


