;; -*- no-byte-compile: t; -*-
;;; lang/bran-org/packages.el

(package! org-tanglesync)

(when (featurep! :app browse)
  (package! org-web-tools)
  (package! org-ql))

(when (featurep! :editor snippets)
  (package! yankpad))

(when (featurep! :tools docker)
  (package! ob-docker-build :recipe (:host github :repo "ifitzpat/ob-docker-build")))

(when (featurep! +preview)
  (package! org-ehtml))

(when (featurep! +ref)
  (package! org-ref))

(when (featurep! +repl)
  (package! org-babel-eval-in-repl))
