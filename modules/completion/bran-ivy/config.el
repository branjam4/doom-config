;;; completion/bran-ivy/config.el -*- lexical-binding: t; -*-

(use-package! counsel-web
  :commands (counsel-search counsel-web-suggest)
  :init
  (map! :leader
        :prefix "s"
        :desc "Web search with counsel" "c" #'counsel-web-suggest))

(after! counsel-web
  (setq! counsel-web-search-action #'org-web-tools-read-url-as-org))

(when (featurep! +youtube)
  (use-package! ivy-youtube
    :commands (ivy-youtube)))
