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
 '(default ((t (:family "΢���ź�" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))

;;;--- ��ʾ�к�
(require 'linum)
(setq linum-format "%3d ")
;;;---�������ļ���Ч
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))
;;;--- ��ʾ�к�
(setq column-number-mode t)
(setq line-number-mode t)
(display-time-mode 1);;����ʱ����ʾ���ã���minibuffer������Ǹ�����
(setq display-time-24hr-format t);;ʱ��ʹ��24Сʱ��
(setq display-time-day-and-date t);;ʱ����ʾ�������ں;���ʱ��
(setq display-time-use-mail-icon t);;ʱ�����Ա������ʼ�����
(setq display-time-interval 10);;ʱ��ı仯Ƶ�ʣ���λ�������ţ�
;;;---  �رճ���������ʾ��
(setq visible-bell t)

;; ---��ֹ����
(setq make-backup-files nil)

;; ��������ʱ�ļ�
(setq-default make-backup-files nil)

;;����emacs���ⲿ���������ճ��
(setq x-select-enable-clipboard t)


;;;---��ֹҳ�����ʱ������
;;scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ����
;;scroll-step 1 ����Ϊÿ�η���һ�У�����ʹҳ�������
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;;-------- �ı�EmacsҪ��ش�yes����Ϊ,��y��ո����ʾyes��n��ʾno��
(fset 'yes-or-no-p 'y-or-n-p)

;;---  ����ƥ��
;;������ƥ����ʾģʽ
(show-paren-mode t)
;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ����ţ�����겻�ᷳ�˵�������һ�����Ŵ�
(setq show-paren-style 'parenthesis)
;;---- ������ C-k ʱ��ͬʱɾ������
(setq-default kill-whole-line t)
;;ɾ����ӭ����
(setq inhibit-startup-message t)
(switch-to-buffer buffer-file-name)
(delete-other-windows)

;;���ó�ʼ���ڴ�С
;;���ô���λ��Ϊ�������Ͻ�(0,0)
(set-frame-position (selected-frame) 268 28)
;;���ÿ�͸�,�ҵ�ʮ��С����110,33,��ҿ��Ե��������������Ӧ�Լ���Ļ��С
(set-frame-width (selected-frame) 88)
(set-frame-height (selected-frame) 25)
;;control+space
;;(global-unset-key (kbd "C-@"))  
(global-set-key (kbd "M-SPC") 'set-mark-command) 
