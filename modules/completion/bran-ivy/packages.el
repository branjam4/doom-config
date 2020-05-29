;; -*- no-byte-compile: t; -*-
;;; completion/bran-ivy/packages.el

(package! counsel-web)
(package! counsel-css)
(package! counsel-org-capture-string)
(package! counsel-org-clock)
(package! counsel-jq)
(when (featurep! +youtube)
  (package! ivy-youtube))
(package! counsel-ffdata)
(package! counsel-notmuch)
