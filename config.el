;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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

;;; Add to ~/.doom.d/config.el
(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Fira Code") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Fira Code" :size 20)
      doom-big-font (font-spec :family "Fira Code" :size 20))

(prefer-coding-system 'utf-8)
(setq default-input-method "korean-hangul390")
(setq default-korean-keyboard "390")


(after! evil
  (map!
        :n  "[" #'evil-scroll-up
        :n  "]" #'evil-scroll-down
        :v  "[" #'evil-scroll-up
        :v  "]" #'evil-scroll-down
        )
  ;; (define-key evil-normal-state-map (kbd "[") 'evil-scroll-up)
  ;; (define-key evil-normal-state-map (kbd "]") 'evil-scroll-down)
  ;; (define-key evil-visual-state-map (kbd "[") 'evil-scroll-up)
  ;; (define-key evil-visual-state-m p (kbd "]") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  (define-key evil-visual-state-map (kbd "0") 'evil-first-non-blank)
  (global-set-key (kbd "C-h") 'evil-window-left)
  (global-set-key (kbd "C-l") 'evil-window-right)
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "C-SPC") 'toggle-korean-input-method)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map "_" 'comment-line)
  (define-key evil-visual-state-map "_" 'comment-dwim)
  (define-key evil-normal-state-map (kbd ", w") 'buffer-menu)
  (define-key evil-normal-state-map (kbd "<up>") 'evil-window-increase-height)
  (define-key evil-normal-state-map (kbd "<down>") 'evil-window-decrease-height)
  (define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
  (define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)
  (define-key evil-normal-state-map (kbd "<f2>") 'neotree)
  (define-key evil-normal-state-map (kbd "g r") 'rgrep)
  (define-key evil-normal-state-map (kbd "; a") 'ff-find-other-file)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map ";a" 'ff-find-other-file)
  (define-key evil-normal-state-map (kbd "C-S-b") 'cmake-ide-compile)
  )

(after! evil-snipe
  (evil-snipe-mode -1)

  )


(after! company
  (set-company-backend! 'prog-mode 'company-dabbrev)
  )


;; key_word jdlksjlf

(after! smartparens
  (setq smartparens-global-mode -1)
  (smartparens-global-mode -1)
  )

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (smartparens-global-mode -1)
            )
          )
