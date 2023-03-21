(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(eval-and-compile
  (setq use-package-always-ensure t))

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; --------
;;; Settings
(setq inhibit-startup-message t)

(tool-bar-mode -1)
(scroll-bar-mode)
 (menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(load-theme 'wombat)
(setq default-tab-width 4)
(setq tab-width 4)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

;; (set-fringe-mode 10)
(global-unset-key (kbd "C-z"))
(delete-selection-mode t)
(setq-default smooth-scroll-margin 0)

(setq-default cursor-type 'box)  ;; (box, bar, hbar)

(set-face-attribute 'default nil :font "Iosevkoi" :height 110)
(pixel-scroll-mode 1)

;; Above the function:: C-h v :: Shows the definition of this variable/function/whatever

;; Função para criar um novo buffer
(defun debmx-new-buffer ()
  "Cria um novo buffer `sem nome'."
  (interactive)
  (let ((debmx/buf (generate-new-buffer "none")))
    (switch-to-buffer debmx/buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    debmx/buf))

;; Modo inicial
(setq initial-major-mode 'prog-mode)
(setq initial-buffer-choice 'debmx-new-buffer)
(setq lexical-binding t)

(defvar my-todo "~/personal/notes/todo.org")
(defvar cache-dir "~/.emacs.d/tmp/")
(defvar sc-step 8)

(defun buffer/insert-filename ()
  "Insert file name of current buffer at current point."
  (interactive
   (insert (buffer-file-name (current-buffer)))))

(ffap-bindings)


;; C-h-k keys
;; C-h-b bindings
;;Global flags
(setq
 backup-directory-alist `((".*" . "~/.emacs.saves"))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 column-number-mode t	   ;show the column number
 mouse-yank-at-point t	   ;middle click with the mouse yanks at point
 history-length 300		   ;default is 30
 locale-coding-system 'utf-8			  ;utf-8 is default
 confirm-nonexistent-file-or-buffer nil ;don't ask to create a buffer
 vc-follow-symlinks t                   ;follow symlinks automatically
 eval-expression-print-length nil ;do not truncate printed expressions
 eval-expression-print-level nil  ;print nested expressions
 mouse-wheel-progressive-speed nil
 scroll-margin sc-step
 hscroll-margin sc-step
 scroll-conservatively 10
 fast-but-imprecise-scrolling nil
 jit-lock-defer-time 0
 scroll-preserve-screen-position 1
 send-mail-function 'sendmail-send-it
 kill-ring-max 5000			   ;truncate kill ring after 5000 entries
 mark-ring-max 5000			   ;truncate mark ring after 5000 entries
 mouse-autoselect-window -.1   ;window focus follows the mouse pointer
 mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))) ;make mouse scrolling smooth
 ;; indicate-buffer-boundaries 'right       ;fringe markers (on the left side)
 enable-recursive-minibuffers t	 ;whatever...
 show-paren-delay 0				 ;show the paren immediately
 load-prefer-newer t			 ;prefer newer .el instead of the .elc
 gc-cons-percentage 0.3			 ;increase garbage collection limit
 switch-to-buffer-preserve-window-point t ;this allows operating on the same buffer in diff. positions
 initial-buffer-choice my-todo)

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/tmp/savehist")

(defalias 'yes-or-no-p 'y-or-n-p)
;;; Plugins
;;;
(use-package recentf
  :init
  (recentf-mode 1)
  :config
  (setq recentf-max-saved-items 500)
  (setq recentf-max-menu-items 60))

(use-package paredit
  :config
  (paredit-mode t))
(use-package rainbow-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Manual -> C-h r
;; Keymaps-> C-h k
;; Tutorial -> C-h t
;; Customize -> M-x customize
;; Variables -> C

;; Disable line numbers for specific modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		vterm-mode
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package ranger)
(use-package beacon
  :config
  (beacon-mode 1))

;; Libraries
(use-package dash)
(use-package s)

;; folding
(use-package origami)
(use-package vimish-fold)
;;adding(use-package focus)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))

  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
  (prescient-persist-mode 1)
  (ivy-prescient-mode 1))

(use-package hydra
  :defer t)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes
  :init (load-theme 'doom-moonlight t))
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package vimish-fold)
(use-package nix-mode)
(use-package eglot)
(add-to-list 'eglot-server-programs '(nix-mode . ("rnix-lsp")))

(use-package no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package general
  :config
  (general-create-definer koi/leader-keys
	:prefix "C-c")

  (koi/leader-keys
   "t" '(:ignore t :which-key "Toggles")
   "ts" '(hydra-text-scale/body :which-key "Scale text")
   "tt" '(counsel-load-theme :which-key "Choose theme")))

(use-package evil
  :init
  (setq evil-want-fine-undo nil)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile

  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc")))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-project-root
             projectile-project-name
             projectile-project-p
             projectile-locate-dominating-file
             projectile-relevant-known-projects)
  :init
  (setq projectile-cache-file (concat cache-dir "projectile.cache")
        ;; Auto-discovery is slow to do by default. Better to update the list
        ;; when you need to (`projectile-discover-projects-in-search-path').
        projectile-auto-discover nil
        projectile-enable-caching (not noninteractive)
        projectile-globally-ignored-files '(".DS_Store" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".yc" ".o")
        projectile-kill-buffers-filter 'kill-only-files
        projectile-known-projects-file (concat cache-dir "projectile.projects")
        projectile-ignored-projects '("~/")
        projectile-ignored-project-function #'doom-project-ignored-p)
  :custom ((projectile-completion-system 'ivy))
  :config
  (projectile-mode)
  (koi/leader-keys
    "p" '(projectile-command-map :which-key "Projects")))

(setq projectile-project-root-files-bottom-up
      (append '(".projectile"  ; projectile's root marker
                ".project"     ; doom project marker
                ".git")        ; Git VCS root dir
              (when (executable-find "hg")
                '(".hg"))      ; Mercurial VCS root dir
              (when (executable-find "bzr")
                '(".bzr")))    ; Bazaar VCS root dir
      ;; This will be filled by other modules. We build this list manually so
      ;; projectile doesn't perform so many file checks every time it resolves
      ;; a project's root -- particularly when a file has no project.
      projectile-project-root-files '()
      projectile-project-root-files-top-down-recurring '("Makefile"))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit)
(use-package forge)

(defun koi/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . koi/lsp-mode-setup)
	 (lsp-mode . lsp-enable-which-key-integration)))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; (koi/leader-keys
;;   "l" '(:ignore t :which-key "Lsp"))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom)
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t))


(use-package lsp-treemacs
  :after lsp)
(use-package lsp-ivy)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
(add-hook 'after-init-hook 'global-company-mode)

(use-package company-box
  :hook (company-mode . company-box-mode))
(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1))

(use-package tree-sitter
  :config
  (global-tree-sitter-mode))

(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell "fish")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000))


(defun koi/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell
  :hook (eshell-first-time-mode . koi/configure-eshell)
  :config
  (setq eshell-rc-script "~/.dotfiles/emacs/eshell/profile"
      eshell-aliases-file "~/.dotfiles/emacs/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh")))
(use-package eshell-git-prompt)

;;;
;;;
;;
;;   :config (god-mode))

;; (defun my-god-mode-update-cursor-type ()
;;   (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))
;; (defun select-line ()
;;   "Select current line. If region is active, extend selection downward by line."
;;   (interactive)
;;   (if (region-active-p)
;;       (progn
;;         (forward-line 1)
;;         (end-of-line))
;;     (progn
;;       (end-of-line)
;;       (set-mark (line-beginning-position)))))


;; (defun skip ()
;;   (interactive)
;; 	(god-mode-activate) (keyboard-escape-quit))

;; (global-set-key (kbd "C-l") #'select-line)

;; (add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

;; (global-set-key (kbd "<esc>") #'skip)
;; (define-key god-local-mode-map (kbd "i") #'god-local-mode)
;; (define-key god-local-mode-map (kbd ".") #'repeat)
;; (define-key god-local-mode-map (kbd "[") #'backward-paragraph)
;; (define-key god-local-mode-map (kbd "]") #'forward-paragraph)

;; (global-set-key (kbd "C-x C-1") #'delete-other-windows)
;; (global-set-key (kbd "C-x C-2") #'split-window-below)
;; (global-set-key (kbd "C-x C-3") #'split-window-right)
;; (global-set-key (kbd "C-x C-0") #'delete-window)

;; (add-to-list 'god-exempt-major-modes 'dired-mode)
;; (add-to-list 'god-exempt-major-modes 'magit-mode)

;; (defun my-god-mode-self-insert ()
;;   (interactive)
;;   (if (and (bolp)
;;            (eq major-mode 'org-mode))
;;       (call-interactively 'org-self-insert-command)
;;     (call-interactively 'god-mode-self-insert)))

;; (define-key god-local-mode-map [remap self-insert-command] #'my-god-mode-self-insert)

;; ;;; init.el end of file
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(evil-collection evil which-key vterm vimish-fold tree-sitter restclient ranger rainbow-mode rainbow-delimiters quelpa-use-package paredit origami no-littering nix-mode lsp-ui lsp-treemacs lsp-ivy ivy-rich ivy-prescient helpful helm god-mode general forge eshell-git-prompt eglot doom-themes doom-modeline diminish counsel-projectile company-quickhelp company-box beacon auto-package-update all-the-icons)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
