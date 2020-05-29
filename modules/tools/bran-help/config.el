;;; tools/bran-help/config.el -*- lexical-binding: t; -*-

(use-package! asx
  :commands (asx)
  :preface
  (map! :leader
        :prefix "s"
        :desc "Search Stackexchange" "x" #'asx))

(use-package! wiki-summary
  :commands (wiki-summary wiki-summary-insert)
  :init
  (map! :leader
        (:prefix "s"
         :desc "Fetch wiki summary" "w" #'wiki-summary
         :desc "Insert wiki summary at point" "W" #'wiki-summary-insert)))
