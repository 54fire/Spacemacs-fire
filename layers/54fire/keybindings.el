
;; 有道词典快捷键设置
(spacemacs/set-leader-keys "yo" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "yp" 'youdao-dictionary-play-voice-at-point)

;; 快捷打开配置文件
(defun 54fire/init-file()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))
(global-set-key (kbd "<f1>") '54fire/init-file)

;;
