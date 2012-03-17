(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-path に追加
(add-to-load-path "elisp" "conf" "public_repos")

;; 改行と同時にインデント
(global-set-key (kbd "C-m") 'newline-and-indent)
;; "C-c l" 行の折り返し表示を切り替える
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
;; "C-t" でウインドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; Mac OS Xの場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; Windowsの場合のファイル名の設定
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))


;;; フレーム
;; 行番号をウィンドウ左に表示
;;(global-linum-mode t)
;; カラム番号も表示
(column-number-mode t)

;; 時計を表示
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;;; インデント
(setq-default tab-width 4)
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;;; color-theme
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))