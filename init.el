;;#+TAGS: config dotfile emacs
;;#+AUTHOR: yearluk
;;#+DATE: 2020-04-02
;;#+FILENAME: xolotl.maranlan:~/.emacs.d/init.el
;;#+OPTIONS: toc:nil

;;; BEGIN init.el

(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))


;; Initialise the packages
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Ensure =use-package= availability
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure =use-package= prior to loading it
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-config.org"))
;;(org-babel-load-file (expand-file-name "~/.emacs.d/personal-info.org"))

;;; END init.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-processes nil)
 '(kill-whole-line t)
 '(mouse-yank-at-point t)
 '(package-selected-packages
   (quote
    (ac-R spaceline-all-the-icons spaceline doom-modeline projectile dashboard swiper use-package)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-quoted ((t (:foreground "red" :family "Hack"))))
 '(minibuffer-prompt ((t (:foreground "#6BA9DC" :family "Menlo-16")))))
