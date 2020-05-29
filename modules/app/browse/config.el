;;; app/browse/config.el -*- lexical-binding: t; -*-

(when (featurep! +w3m)
  (use-package! w3m
    :commands (w3m)
    :init
    (setq w3m-display-mode 'plain))
  (use-package! inherit-org
    :commands (inherit-org-mode inherit-org-w3m-headline-fontify))
  
    (after! info
      (add-hook 'Info-mode-hook 'inherit-org-mode))
  
    (after! helpful
      (add-hook 'helpful-mode-hook 'inherit-org-mode))
  
    (after! w3m
      (add-hook 'w3m-fontify-before-hook 'inherit-org-w3m-headline-fontify) ;only one level is supported
      (add-hook 'w3m-fontify-after-hook 'inherit-org-mode))
  
  (map! :map w3m-mode-map
        :after w3m
        :n "<tab>" 'org-cycle
        :n "<S-iso-lefttab>" 'org-shifttab
        :n "&" 'w3m-external-view-current-url)
  (after! browse-url
    (setq browse-url-browser-function 'w3m-browse-url
          browse-url-new-window-flag 't)))
