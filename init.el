(load-theme 'wombat t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

;; add my custom setting
(add-to-list 'load-path "~/.emacs.d/custom/")

(require 'setup-editing)
(require 'setup-files)
(require 'setup-programming)
(require 'setup-faces-and-ui)


;;end custom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;begin load elpa's package

;; color-theme
(require 'color-theme)

;; muti-term
(require 'multi-term)

;;auto highlight the paste text
(require 'volatile-highlights)
(volatile-highlights-mode t)

;;auto clear useless whitespace
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;;undo tree, make emacs's undo like a normal text editor
(require 'undo-tree)
(global-undo-tree-mode)

;; template complete
(require 'yasnippet)
(yas-global-mode 1)

;; company, short for complete anything
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


;; group list in ibuffer
(add-hook 'ibuffer-hook
	  (lambda ()
	    (ibuffer-vc-set-filter-groups-by-vc-root)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	      (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
	      (name 18 18 :left :elide)
	      " "
	      (size 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      (vc-status 16 16 :left)
	      " "
	      filename-and-process)))

;; project tree view
;; since ztree works with files and directories, let's consider it in
;; group Files
(require 'ztree-diff)
(require 'ztree-dir)


;;flycheck: auto check your code
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)


;; auto resize your window
(require 'golden-ratio)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; do not enable golden-raio in thses modes
(setq golden-ratio-exclude-modes '("ediff-mode"
				   "gud-mode"
				   "gdb-locals-mode"
				   "gdb-registers-mode"
				   "gdb-breakpoints-mode"
				   "gdb-threads-mode"
				   "gdb-frames-mode"
				   "gdb-inferior-io-mode"
				   "gud-mode"
				   "gdb-inferior-io-mode"
				   "gdb-disassembly-mode"
				   "gdb-memory-mode"
				   "magit-log-mode"
				   "magit-reflog-mode"
				   "magit-status-mode"
				   "IELM"
				   "eshell-mode" "dired-mode"))

(golden-ratio-mode)



(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; key maping
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; init.el end here
