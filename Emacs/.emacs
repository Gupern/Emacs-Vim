(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (whiteboard))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))

;;;--- 显示行号
(require 'linum)
(setq linum-format "%3d ")
;;;---对所有文件生效
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))
;;;--- 显示列号
(setq column-number-mode t)
(setq line-number-mode t)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？
;;;---  关闭出错量的提示音
(setq visible-bell t)

;; ---禁止备份
(setq make-backup-files nil)

;; 不生成临时文件
(setq-default make-backup-files nil)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)


;;;---防止页面滚动时跳动，
;;scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动
;;scroll-step 1 设置为每次翻滚一行，可以使页面更连续
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;;-------- 改变Emacs要你回答yes的行为,按y或空格键表示yes，n表示no。
(fset 'yes-or-no-p 'y-or-n-p)

;;---  括号匹配
;;打开括号匹配显示模式
(show-paren-mode t)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处
(setq show-paren-style 'parenthesis)
;;---- 在行首 C-k 时，同时删除该行
(setq-default kill-whole-line t)
;;删除欢迎界面
(setq inhibit-startup-message t)
(switch-to-buffer buffer-file-name)
(delete-other-windows)

;;设置初始窗口大小
;;设置窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 268 28)
;;设置宽和高,我的十寸小本是110,33,大家可以调整这个参数来适应自己屏幕大小
(set-frame-width (selected-frame) 88)
(set-frame-height (selected-frame) 25)
;;control+space
;;(global-unset-key (kbd "C-@"))  
(global-set-key (kbd "M-SPC") 'set-mark-command) 
