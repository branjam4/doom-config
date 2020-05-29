;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;; programming enhancement config



;; for python
(set-lookup-handlers! 'python-mode
  :definition #'anaconda-mode-find-definitions
  :references #'anaconda-mode-find-references
  :documentation #'anaconda-mode-show-doc)



;;; emacs enhancement config



(use-package! adoc-mode
  :defer 10
  :init
  (add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode)))

;;; org or org-related configs



(after! ox-latex
  (setq org-latex-prefer-user-labels t
    org-latex-packages-alist '(("newfloat" "minted"))
    org-latex-pdf-process
    '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "bibtex %b"
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (setq org-latex-minted-options '(("frame" "lines") ("linenos" "true")("breaklines" "true"))))

(after! org-roam
  (map! :leader
        :prefix "n"
        :desc "Org-Roam-Insert" "i" #'org-roam-insert
        :desc "Org-Roam-Find"   "/" #'org-roam-find-file))





;;export options
(after! org-pandoc
  (setq org-pandoc-options '((template . "~/.local/share/pandoc/templates/eisvogel.latex"))))
