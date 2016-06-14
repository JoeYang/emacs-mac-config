;; proxy not needed
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "proxy:8080")
        ("https" . "proxy:8080")))

;; packages
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

;; bind key
(setq mac-command-modifier 'meta)

;; cycling buffers
;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<M-tab>") 'other-window)

;; tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'exec-path "/usr/local/bin")

;; color theme
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-solarized)

;; set font and size
(set-default-font "Monaco 16")

;; make sure these packages are installed
(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; Show parenthesis mode
(show-paren-mode 1)
(paredit-mode 1)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode t)))
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(rainbow-delimiters-mode)

;; disable the annoying box
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

