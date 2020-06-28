;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; M-x package-install; evil, 

;; EVIL
(require 'evil)
(evil-mode 1)

;; Misc
(tool-bar-mode -1)
;;(toggle-scroll-bar -1)
(setq major-mode 'text-mode)
(setq-default major-mode 'text-mode)
(global-visual-line-mode 1)
(setq x-select-enable-clipboard t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-prettify-symbols-mode t)
(setq scroll-conservatively 100)
(transient-mark-mode 1)
;;(load-theme 'leuven)
;;(add-to-list 'exec-path "/home/user/bin")
;;(pdf-tools-install)

;; Easier resize bindings
(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

;; Indentation
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'nil)

;; Eshell Prompt
(setq eshell-prompt-regexp "^[^αλ\n]*[αλ] ")
(setq eshell-prompt-function
      (lambda nil
        (concat
         (if (string= (eshell/pwd) (getenv "HOME"))
             (propertize "~" 'face `(:foreground "#99CCFF"))
           (replace-regexp-in-string
            (getenv "HOME")
            (propertize "~" 'face `(:foreground "#99CCFF"))
            (propertize (eshell/pwd) 'face `(:foreground "#99CCFF"))))
         (if (= (user-uid) 0)
             (propertize " α " 'face `(:foreground "#FF6666"))
         (propertize " λ " 'face `(:foreground "#A6E22E"))))))
(setq eshell-highlight-prompt nil)

;; Super - Control - RET to open eshell
(defun eshell-other-window ()
  "Create or visit an eshell buffer."
  (interactive)
  (if (not (get-buffer "*eshell*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 0)
        (eshell))
    (switch-to-buffer-other-window "*eshell*")))
(global-set-key (kbd "<C-s-return>") 'eshell-other-window)

;; Brackets
(show-paren-mode 1)
(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            ))
(electric-pair-mode t)

;; Aliases
(defalias 'open 'find-file-other-window)
(defalias 'clean 'eshell/clear-scrollback)
(defalias 'yes-or-no-p 'y-or-n-p)

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
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
	("dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" default)))
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
