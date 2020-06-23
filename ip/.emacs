;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Enable evil mode
(require 'evil)
(evil-mode 1)

;; Misc
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq major-mode 'text-mode)
(setq-default major-mode 'text-mode)
(global-visual-line-mode 1)

;;(load-theme 'leuven)
;;(add-to-list 'exec-path "/home/diamond/bin")
;;(pdf-tools-install)

;; Buffer move
;;(require 'buffer-move)
;;(global-set-key (kbd "<C-S-up>")     'buf-move-up)
;;(global-set-key (kbd "<C-S-down>")   'buf-move-down)
;;(global-set-key (kbd "<C-S-left>")   'buf-move-left)
;;(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; F12 toggles line numbers
(global-set-key (kbd "<f12>") 'linum-mode)

;; Startup
(setq inhibit-startup-message t)
(defun display-startup-echo-area-message ()
  (message nil))
(setq initial-scratch-message "")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (pdf-tools evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
