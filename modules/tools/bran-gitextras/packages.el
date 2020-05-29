;; -*- no-byte-compile: t; -*-
;;; tools/bran-gitextras/packages.el

(when (featurep! +github)
  (package! github-clone)
  (package! github-search))
