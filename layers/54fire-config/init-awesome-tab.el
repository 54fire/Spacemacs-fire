
  (use-package awesome-tab
    :ensure nil
    :load-path "~/.spacemacs.d/elpa/awesome-tab/"
    :config
    (with-eval-after-load 'evil
      (define-key evil-normal-state-map (kbd ",tt") 'awesome-tab-switch-group)
      (define-key evil-normal-state-map (kbd ",ta") 'awesome-tab-select-beg-tab)
      (define-key evil-normal-state-map (kbd ",te") 'awesome-tab-select-end-tab)
      (define-key evil-normal-state-map (kbd ",t<") 'awesome-tab-move-current-tab-to-left)
      (define-key evil-normal-state-map (kbd ",t>") 'awesome-tab-move-current-tab-to-right)
      (define-key evil-normal-state-map (kbd ",tl") 'awesome-tab-forward)
      (define-key evil-normal-state-map (kbd ",th") 'awesome-tab-backward))
    (setq awesome-tab-cycle-scope 'tabs) ; Navigate through visible tabs only.
    (setq awesome-tab-style 'box)
    (setq awesome-tab-background-color "#2e3434")
    (awesome-tab-mode 1))

(provide 'init-awesome-tab)
