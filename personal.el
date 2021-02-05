;; -*- coding: utf-8; lexical-binding: t; -*-

;; Some of my personal config

;; open file from xclipboard
;; when I use command 'ff' find a file and copy it's full path to xclipboard, then I can use this function open the file directly in emacs.
(defun my-open-file-from-clipboard ()
  (interactive)
  (let* ((name (shell-command-to-string "xclip -selection c -o")))
    (if (file-exists-p name)
        (find-file name))))

(with-eval-after-load 'evil
  (my-comma-leader-def
    "av" 'my-open-file-from-clipboard
    "xq" 'read-only-mode
    "xg" 'magit-status))

(with-eval-after-load 'evil-matchit
  (setq evilmi-shortcut "m"))

(require-init 'init-go-mode t)

;; turn on keyfreq mode
(turnon-keyfreq-mode)

;; I prefer doom-gruvbox theme for now.
(load-theme 'doom-gruvbox t)
