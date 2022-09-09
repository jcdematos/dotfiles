;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Julio Cesar de Oliveira Matos"
      user-mail-address "contact@jcdematos.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; <Color theme initialization code>
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

(defun toggle-html-export-on-save ()
  "Enable or disable export HTML when saving current buffer."
  (interactive)
  (when (not (eq major-mode 'org-mode))
    (error "Not an org-mode file!"))
  (if (memq 'org-html-export-to-html after-save-hook)
      (progn (remove-hook 'after-save-hook 'org-html-export-to-html t)
             (message "Disabled org html export on save"))
    (add-hook 'after-save-hook 'org-html-export-to-html nil t)
    (set-buffer-modified-p t)
    (message "Enabled org html export on save")))

;; Projectile configuration
(setq
 projectile-project-search-path '("~/github" "~/org"))

;; Deft configuration
(after! deft
        (setq deft-directory "~/org"
        deft-extensions '("org" "md" "txt")
        deft-recursive t) ;; Deft is not recursive by default
)

;; Org journal configuration
;;(setq org-journal-file-format "%Y-%m-%d.org"
(setq org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org")

;; General Configuration
(setq confirm-kill-emacs nil) ;; Disable exit confirmation

;; Set options on dashboard menu
;;(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 2))

;;;; Editing configuration
(setq kill-whole-line t) ;; Ctrl-K removes whole line
;; Respect visual line in j k
(use-package-hook! evil
  :pre-init
  (setq evil-respect-visual-line-mode t)
  t)

(after! evil
  (setq evil-move-cursor-back nil )) ;; Do not move cursor back toggling insert

;;;; Enables auto save and backup files
(setq auto-save-default t
      delete-by-moving-to-trash t)

;; Ask which buffer to show in a new window
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

;; Some config for the mode line
(setq doom-modeline-enable-word-count t) ;; Word count in mode line
(display-time-mode 1) ;; Displat time in modeline

;; New buffers names
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

;; Faster help
(setq which-key-idle-delay 0.5) ;; I need the help, I really do

(defun zz/org-download-paste-clipboard (&optional use-default-filename)
  (interactive "P")
  (require 'org-download)
  (let ((file
         (if (not use-default-filename)
             (read-string (format "Filename [%s]: "
                                  org-download-screenshot-basename)
                          nil nil org-download-screenshot-basename)
           nil)))
    (org-download-clipboard file)))

(after! org
  (setq org-download-method 'directory)
  (setq org-download-image-dir "images")
  (setq org-download-heading-lvl nil)
  (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  (setq org-image-actual-width 300)
  (map! :map org-mode-map
        "C-c l a y" #'zz/org-download-paste-clipboard
        "C-M-y" #'zz/org-download-paste-clipboard))
