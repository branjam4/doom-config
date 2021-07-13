;; -*- no-byte-compile: t; -*-
;;; app/browse/packages.el

(when (featurep! +w3m)
  (package! w3m :pin "e522a44b15")
  (package! inherit-org :recipe (:host github :repo "chenyanming/inherit-org")))

(when (featurep! +hnreader)
  (package! hnreader))
