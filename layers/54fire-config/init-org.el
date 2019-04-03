;; 设置org-mode的标题符号
(setq org-bullets-bullet-list
      '("✡" "✽" "✲" "✱" "✻" "✼" "✽" "✾" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇"))
;; org-mode中table字体设置
(defun set-buffer-variable-pitch ()
  (interactive)
  (set-face-attribute 'org-table nil
                      :fontset (create-fontset-from-fontset-spec
                                (concat "-*-*-*-*-*--*-*-*-*-*-*-fontset-orgtable"
                                        ",han:KaiTi:size=20"
                                        ",default: Source Code Pro:size=16"))))
(add-hook 'org-mode-hook 'set-buffer-variable-pitch)

(provide 'init-org)
