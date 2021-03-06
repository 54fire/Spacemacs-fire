(defun 54fire/open-init-file()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

(global-set-key (kbd "<f1>") '54fire/open-init-file)

;; 有道词典的快捷方式
(spacemacs/set-leader-keys "yo" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "yp" 'youdao-dictionary-play-voice-at-point)

(spacemacs/set-leader-keys "0" 'neotree-toggle)


(spacemacs/set-leader-keys (kbd "tl") 'awesome-tab-forward)
(spacemacs/set-leader-keys (kbd "th") 'awesome-tab-backward)
(spacemacs/set-leader-keys (kbd "tt") 'awesome-tab-switch-group)

