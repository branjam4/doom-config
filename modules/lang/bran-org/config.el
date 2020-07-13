;;; lang/bran-org/config.el -*- lexical-binding: t; -*-

(use-package! org-tanglesync
  :after (org-mode)
  :hook ((org-mode . org-tanglesync-mode)
         ;; enable watch-mode globally:
         ((prog-mode text-mode) . '(org-tanglesync-watch-mode)))
  :custom
  (org-tanglesync-watch-files '("~/projects/projects.org"))
  :bind
  (( "C-c M-i" . org-tanglesync-process-buffer-interactive)
   ( "C-c M-a" . org-tanglesync-process-buffer-automatic)))

(after! org
  (add-to-list 'org-modules 'ol-w3m)
  (add-to-list 'org-modules 'ol-info)
  (add-hook 'before-save-hook 'org-update-all-dblocks))

(when (featurep! :app browse)
  (use-package! org-web-tools
    :commands (org-web-tools-insert-web-page-as-entry org-web-tools-read-url-as-org org-web-tools-insert-link-for-url)
    :preface
    (map! :leader "L" #'link-hint-copy-link)
    (map! :leader
          (:prefix "o"
           :desc "Org-Webpage (with link hint)" "w" #'copy-link-read-as-org
           :desc "Org-Webpage (from clipboard)" "W" #'org-web-tools-read-url-as-org)
          (:map org-mode-map
           :leader
           (:prefix "i"
            :desc "Insert link hint as org-heading" "w" #'copy-link-insert-org-web-entry
            :desc "Webpage org-heading from clipboard" "W" #'org-web-tools-insert-web-page-as-entry)
           (:localleader
            :prefix "l"
            :desc "Insert link hint as org-link" "w" #'org-web-tools-insert-link-for-url
            :desc "Webpage as org-link from clipboard" "W" #'copy-link-insert-org-link))))
  )

(when (featurep! :editor snippets)
  (use-package! yankpad
    :commands (yankpad-map yankpad-expand yankpad-insert)
    :custom
    (yankpad-file "~/org/yankpad.org")
    :config
    ;; If you want to complete snippets using company-mode
    (after! yas
      (add-to-list 'company-backends #'company-yankpad))
    :init
    (map! :leader
          :desc "Yankpad map" "Y" #'yankpad-map
          ;; TODO map function for quick yankpad special property
          ;; (i.e. regular expression transform)
          (:prefix-map ("y" . "yankpad")
            :desc "Append yankpad category" "a" #'yankpad-append-category
            :desc "Yankpad capture snippet" "c" #'yankpad-capture-snippet
            :desc "Edit yankpad.org" "e" #'yankpad-edit
            :desc "Insert yankpad snippet" "i" #'yankpad-insert
            :desc "Set yankpad category" "s" #'yankpad-set-category
            :desc "Expand word at point" "x" #'yankpad-expand
            :desc "Clear yankpad cache" "r" #'yankpad-reload
            :desc "Repeat last used snippet" "'" #'yankpad-repeat))))

(when (featurep! +ref)
  (after! org-ref
    (when (featurep! :completion ivy)
      (setq org-ref-completion-library 'org-ref-ivy-cite)))
  ;; manage citations
  (use-package! org-bibtex
    :commands (org-bibtex org-bibtex-check doi-utils-doi-to-org-bibtex org-bibtex-yank) )
  ;; export citations
  (use-package! ox-bibtex
    :after ox
    :init
    (setq org-bibtex-file (expand-file-name "~/org/roam/papers.org")))
  )

(when (featurep! +repl)
  ;; TODO investigate config options
  ;## Usage and recommended config (optional):
  (after! eval-in-repl
    (setq eir-jump-after-eval nil)
    (define-key org-mode-map (kbd "C-<return>") 'ober-eval-in-repl)
    (define-key org-mode-map (kbd "C-c C-c") 'ober-eval-block-in-repl)))
