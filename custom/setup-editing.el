(provide 'setup-editing)

;; GROUP: Editing -> Editing Basics
(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )


(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; GROUP: Editing -> Killing
(setq
 kill-ring-max 5000 ; increase kill-ring capacity
 kill-whole-line t  ; if NIL, kill whole line and move the next line up
 )

;; show important whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
			    (setq-local whitespace-style
					'(face
					  tabs
					  tab-mark
					  spaces
					  space-mark
					  trailing
					  indentation::space
					  indentation::tab
					  newline
					  newline-mark))
			    (whitespace-mode 1)))

(setq desktop-restore-frames t)
(setq desktop-restore-in-current-display t)
(setq desktop-restore-forces-onscreen nil)

;;ibuffer key
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-M-f") 'forward-sexp)
(global-set-key (kbd "C-M-b") 'backward-sexp)
(global-set-key (kbd "C-M-k") 'kill-sexp)
(global-set-key (kbd "C-M-<SPC>") 'mark-sexp)

;;always use ibuffer
(defalias 'list-buffers 'ibuffer)


;;语法高亮
(global-font-lock-mode t)
(setq scroll-conservatively 9999)
(setq git-lock-defer-on-scrolling t)
(setq font-lock-support-mode 'jit-lock-mode) 
;;以空行结束
(setq require-final-newline t)
;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;页面平滑滚动， scroll-margin 5 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
(setq scroll-margin 5
  scroll-conservatively 10000)
;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)
;;-----------------------------------------
;; 使用空格缩进,indent-tabs-mode:
;; t 使用 TAB 作格式化字符, nil 使用空格作格式化字符
;;-----------------------------------------
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
;; 设置缩进字符数
(setq c-basic-offset 4)
(setq tab-stop-list ())

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))
;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; set auto indent  with RET
(global-set-key (kbd "RET") 'newline-and-indent)

;; set utf-8
(setq locale-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'ctext)
(set-default-coding-systems 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;当emacs退出时保存文件打开状态
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))

(setq enable-recursive-minibuffers t)
(setq require-final-newline t)
(setq track-eol t)

(load "desktop")
(desktop-load-default)
(desktop-read)
(setq-default make-backup-files nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(global-unset-key (kbd "C-z"))

(set-default-font  "-*-Menlo-normal-normal-normal-*-12-*-*-*-m-0-iso10646-")

