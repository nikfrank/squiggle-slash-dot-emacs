(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)
(fset 'jsfunc
      (kbd "( ) = > { } <left> RET RET <tab> <up> <tab> <up> <end> <left> <left> <left> <left>"))
(fset 'reactprops
      "this.props.")
(fset 'consolelog
      (kbd "c o n s o l e . l o g ( ) ; <left><left>"))
(fset 'duplicateline
      (kbd "C-a C-k C-y <return> C-y"))
(fset 'openbrace
      (kbd "{ RET <tab> <end> RET } <tab> <up> <tab>"))
(fset 'htmlcomment
      (kbd "< ! - - - - > <left> <left> <left>"))
(fset 'htmlcommenton
      (kbd "<home> <tab> <right> ! - - <end> <left> - -"))
(fset 'htmlcommentoff
      (kbd "<home> <tab> <right> <deletechar> <deletechar> <deletechar> <end> <left> <backspace> <backspace>"))
(fset 'htmlelement
      (kbd "<home> <tab> C-k <tab> < C-y > RET RET < / C-y > <tab> <up> <tab> <up> <end> <left>"))
(fset 'jsxelement
      (kbd "<home> <tab> C-k <tab> < C-y > RET RET < / <tab> <up> <tab> <up> <end> <left>"))
(fset 'htmlelementinline
      (kbd "<end> C-<left> C-k <tab> < C-y > < / C-y > <left> C-<left> <left> <left>"))
(fset 'jsxelementinline
      (kbd "<home> <tab> C-k <tab> < C-y > < /"))
(fset 'htmlelementescape
      (kbd "<end> C-<left> C-k <tab> & l t ; C-y & g t ; & l t ; / C-y & g t ; <tab>"))
(fset 'prev-window-sc (kbd "C-- C-x o"))
(fset 'del-function (kbd "<delete>"))
(fset 'del-word (kbd "C-<delete>"))
(fset 'home-function (kbd "<home>"))

;; todo: save point and return to it!
(fset 'tab-entire-file (kbd "M-< S-M-> <tab> M-<"))

(fset 'sel-to-beginning-of-buffer (kbd "<C-S-home>"))
(fset 'sel-to-end-of-buffer (kbd "<C-S-end>"))

(global-set-key (kbd "±") 'home-function)
(global-set-key (kbd "§") 'del-function)
(global-set-key (kbd "C-§") 'del-word)

(global-set-key (kbd "C-F") 'jsfunc)
(global-set-key (kbd "<C-S-return>") 'duplicateline)
(global-set-key (kbd "C-$") 'reactprops)
(global-set-key (kbd "<C-tab>") 'consolelog)
(global-set-key (kbd "C-{") 'openbrace)
(global-set-key (kbd "C-<") 'htmlcomment)
(global-set-key (kbd "C-!") 'htmlcommenton)
(global-set-key (kbd "C-~") 'htmlcommentoff)
(global-set-key (kbd "C->") 'htmlelement)
(global-set-key (kbd "C-.") 'htmlelementinline)
(global-set-key (kbd "C-?") 'htmlelementescape)
(global-set-key (kbd "<M-iso-lefttab>") 'tab-entire-file)

(global-set-key (kbd "<C-S-kp-1>") 'sel-to-end-of-buffer)
(global-set-key (kbd "<C-kp-1>") 'end-of-buffer)
(global-set-key (kbd "<C-S-kp-7>") 'sel-to-beginning-of-buffer)
(global-set-key (kbd "<C-kp-7>") 'beginning-of-buffer)

(global-set-key (kbd "C-x p") 'prev-window-sc)

(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)



(defun swap-buffer-to-unique-shell ()
  "Run `shell' and `rename-uniquely' in sequence."
  (interactive)
  (shell)
  (rename-uniquely))

(global-set-key (kbd "C-s-t") 'swap-buffer-to-unique-shell)




(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.tpl\\'" . web-mode))
(setq inhibit-startup-message t)


(setq web-mode-content-types-alist
      '(
        ("json" . "\\.js\\.tpl\\'")
        ("css" . "\\.css\\.tpl\\'")
	("css" . "\\.css\\'")
	("css" . "\\.scss\\'")
        ("html" . "\\.html\\.tpl\\'")
        ("jsx" . "code")
        ("jsx" . "work")
        ("jsx" . "\\.jsx\\'")
        )
      )

(setq web-mode-enable-auto-quoting nil)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "DeepSkyBlue3")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "IndianRed")
  (local-set-key (kbd "C->") 'jsxelement)
  (local-set-key (kbd "C-.") 'jsxelementinline)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq js-indent-level 2)
(setq css-indent-offset 2)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(setq markdown-command "pandoc")

(custom-set-variables
 '(python-guess-indent nil)
 '(python-indent 2))


(setq-default indent-tabs-mode nil)

(set-face-attribute 'default nil :height 100)


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq ns-function-modifier 'control)
