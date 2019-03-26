;;; packages.el --- 54fire layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: 54fire <54fire@54firedeMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `54fire-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `54fire/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `54fire/pre-init-PACKAGE' and/or
;;   `54fire/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst 54fire-packages
  '(exec-path-from-shell
    neotree
    )
  )

(defun 54fire/init-exec-path-from-shell()
  (use-package exec-path-from-shell
    :init
    :ensure t
    :if (and (eq system-type 'darwin) (display-graphic-p))
    :config
    (progn
      (when (string-match-p "/zsh$" (getenv "SHELL"))
        ;; Use a non-interactive login shell.  A login shell, because my
        ;; environment variables are mostly set in `.zprofile'.
        (setq exec-path-from-shell-arguments '("-l")))
      (exec-path-from-shell-initialize))))

(defun 54fire/init-neotree()
  (use-package neotree
    :defer t
    :ensure t
    :commands (neotree-change-root
               neotree-quick-look
               neotree-toggle
               neotree-hide
               neotree-enter)
    :init
    (spacemacs/set-leader-keys "ft" 'neotree-toggle)
    (spacemacs/set-leader-keys "0" 'neotree-show)
    (setq neo-create-file-auto-open t
          neo-auto-indent-point nil
          neo-banner-message "Press ? for neotree help"
          ;; neo-autorefresh t
          neo-smart-open t
          neo-mode-line-type 'none
          neo-window-width 28
          neo-show-updir-line nil
          neo-theme (if (display-graphic-p) 'icons 'arrow)
          neo-banner-message nil
          neo-confirm-create-file #'off-p
          neo-confirm-create-directory #'off-p
          neo-show-hidden-files nil
          neo-keymap-style 'concise
          neo-hidden-regexp-list
          '(;; vcs folders
            "^\\.\\(DS_store\\|git\\|gitignore\\|hg\\|svn\\)$"
            ;; compiled files
            "\\.\\(pyc\\|o\\|elc\\|lock\\|css.map\\)$"
            ;; generated files, caches or local pkgs
            "^\\(node_modules\\|.\\(project\\|cask\\|yardoc\\|sass-cache\\)\\)$"
            ;; org-mode folders
            "^\\.\\(sync\\|export\\|attach\\)$"
            "~$" "\\.emacs*"
            ;; ignore bazel file
            "^bazel-*"
            "^#.*#$"))
    :config
    (when (bound-and-true-p evil-mode)
      (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
      (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
      (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
      (evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
      (evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-change-root)
      (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
      (evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-copy-node)
      (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
      (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
      (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
      (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-hidden-file-toggle)))
  )
;;; packages.el ends here
