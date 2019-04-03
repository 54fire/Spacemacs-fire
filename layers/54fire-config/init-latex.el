
(setq-default TeX-master nil)
;; (setq TeX-global-PDF-mode t)
(setq-default TeX-engine (quote xetex))
(add-hook 'LaTeX-mode-hook 'cdlatex-mode)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)

(provide 'init-latex)
