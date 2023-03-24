(with-eval-after-load 'org
  (setq org-hide-emphasis-markers t)
  (defun org-toggle-emphasis ()
    "Toggle hiding/showing of org emphasize markers."
    (interactive)
    (if org-hide-emphasis-markers
        (set-variable 'org-hide-emphasis-markers nil)
      (set-variable 'org-hide-emphasis-markers t))
    (org-mode-restart))
  (bind-key (kbd "C-c e") 'org-toggle-emphasis org-mode-map))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.0)))))

(setq main-font (font-spec :family "Iosevkoi" :size 16))

(setq variable-pitch-font (font-spec :family "Ubuntu mono"))

(setq big-font (font-spec :family "Iosevkoi" :size 20))
;; Serif
(setq serif-font (font-spec :family "Noto Serif"))
