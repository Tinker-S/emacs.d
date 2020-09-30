;; add go mode
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/vet
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u github.com/golang/lint/golint
;; go get -u github.com/rogpeppe/godef
;; go get -u github.com/stamblerre/gocode
;; go get -u github.com/juntaki/gogtags

(require-package 'go-mode)
(require-package 'go-eldoc)

(defun go-mode-setup()
  (setq compile-command "go build -v && go test -v && go vet && golint")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
)
(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go-mode)