;;; term/bran-eshell/config.el -*- lexical-binding: t; -*-

(use-package! aweshell
  :after eshell)

(use-package! piper
  :after elisp-mode
  :bind (("C-c C-|" . piper)))

(add-hook! 'eshell-mode-hook #'setup-eshell-ivy-completion #'expand-eshell-password-cache-expiry)
