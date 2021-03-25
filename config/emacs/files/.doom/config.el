;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Robin Oude Vrielink"
      user-mail-address "robin@oudevrielink.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "Inconsolata" :size 12 :weight 'medium)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 22 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 22)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font" :size 26))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  ;; '(font-lock-comment-face :slant Italic :weight Regular)
  '(font-lock-comment-face :slant Italic)
  '(font-lock-keyword-face :slant Italic)
  '(font-lock-type-face :weight Regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; ORG
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/personal/org/")
(setq org-ellipsis " ▾")

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-mode-hook 'writeroom-mode))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Same setting as vim's scrolloff
(setq scroll-margin 6)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(ruby-reek)))

;; Change the way the filename is displayed in doom-modeline
(setq doom-modeline-buffer-file-name-style 'truncate-all)

(setq doom-modeline-vcs-max-length 20)

;; EMAIL
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;(require 'smtpmail)
(setq user-mail-address "robin@oudevrielink.net"
      user-full-name  "Robin Oude Vrielink"
      ;; I have my mbsyncrc in a different folder on my system, to keep it separate from the
      ;; mbsyncrc available publicly in my dotfiles. You MUST edit the following line.
      ;; Be sure that the following command is: "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      ;; mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      mu4e-update-interval  300
      mu4e-main-buffer-hide-personal-addresses t
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.fastmail.com" 587 nil nil))
      mu4e-sent-folder "/personal/Sent"
      mu4e-drafts-folder "/personal/Drafts"
      mu4e-trash-folder "/personal/Trash"
      mu4e-maildir-shortcuts
      '(("/personal/Inbox"      . ?i)
        ("/personal/Sent Items" . ?s)
        ("/personal/Drafts"     . ?d)
        ("/personal/Trash"      . ?t)))

(defvar my-mu4e-account-alist
  '(("personal"
     (mu4e-sent-folder "/personal/Sent")
     (mu4e-drafts-folder "/personal/Drafts")
     (mu4e-trash-folder "/personal/Trash")
     (mu4e-compose-signature
       (concat
         "Robin Oude Vrielink\n"
         "robin@oudevrielink.net\n"))
     (user-mail-address "robin@oudevrielink.net")
     (smtpmail-default-smtp-server "smtp.fastmail.com")
     (smtpmail-smtp-server "smtp.fastmail.com")
     (smtpmail-smtp-user "robin@oudevrielink.net")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    ("work"
     (mu4e-sent-folder "/work/Sent")
     (mu4e-drafts-folder "/work/Drafts")
     (mu4e-trash-folder "/work/Trash")
     (mu4e-compose-signature
       (concat
         "Robin Oude Vrielink\n"
         "r.oudevrielink@nerds.company\n"))
     (user-mail-address "r.oudevrielink@nerds.company")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-user "r.oudevrielink@nerds.company")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;;; MULTIPLE CURSORS
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
