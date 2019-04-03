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
    all-the-icons-dired
    ranger
    cdlatex
    )
  )


(defun 54fire/post-init-ranger()
  (setq ranger-cleanup-on-disable t)
  (setq ranger-cleanup-eagerly t)
  (setq ranger-modify-header nil)
  ;; To exclude certain files (e.g. videos) from being previewed
  (setq ranger-excluded-extensions '("mkv" "iso" "mp4" "pdf"))
  ;; Binary files will not be previewed, if this variable is set to t
  (setq ranger-dont-show-binary t)
  (setq ranger-preview-file t)
  ;; Files that are larger than the max file size (in MB) variable, won't be previewed.
  (setq ranger-max-preview-size 20)
  ;; Hide dotfiles
  (setq ranger-show-hidden nil)
  (setq ranger-parent-depth 0)
  (setq ranger-max-parent-width 0.12)
  ;; Show cursor in ranger
  (setq ranger-hide-cursor nil)
  )
(defun 54fire/init-all-the-icons-dired()
  (use-package all-the-icons-dired
    :init
    :ensure t
    :config
    :hook ((dired-mode . all-the-icons-dired-mode)
           (ranger-mode .all-the-icons-dired-mode))
    ))

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

(defun 54fire/init-cdlatex()
  (use-package cdlatex
    :init
    :ensure t
    ))
;;; packages.el ends here
