;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find information about all of Doom's modules
;;      and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c g k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c g d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input

       :completion
       bran-ivy
       company
       (ivy
        +prescient
        +icons)

       :ui
       doom
       doom-dashboard
       doom-quit
       fill-column
       hl-todo
       hydra
       indent-guides
       modeline
       nav-flash
       ophints
       (popup
        +defaults)
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       lispy
       multiple-cursors
       parinfer
       rotate-text
       snippets
       word-wrap

       :emacs
       (dired +icons)
       electric
       (ibuffer +icons)
       vc

       :term
       eshell
       bran-eshell
       vterm

       :checkers
       syntax
       spell
       grammar

       :tools
       biblio
       bran-help
       (bran-gitextras
        +github)
       (:if (string-equal (system-name) "manjaro")
        (bran-pack +aur)
        (bran-pack))
       bran-term
       debugger
       direnv
       docker
       (eval +overlay)
       gist
       (lookup
        +docsets)
       make
       (magit +forge)
       pass
       pdf
       rgb

       :lang
       data
       emacs-lisp
       (latex
        +cdlatex)
       markdown
       python
       sh
       web
       (org
        +gnuplot
        +jupyter
        +pandoc
        +pomodoro
        +present
        +noter
        +roam
        
        )
       bran-org

       :app
       (browse
        +w3m)

       :config
       ; literate
       (default +bindings +smartparens))
