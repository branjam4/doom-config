;; -*- no-byte-compile: t; -*-
;;; tools/bran-pack/packages.el

(package! helm-system-packages)

(when (featurep! +aur)
  (package! aurel))
