;;; term/bran-eshell/autoload.el -*- lexical-binding: t; -*-
;;;###autoload
(defun setup-eshell-ivy-completion ()
  (define-key eshell-mode-map [remap eshell-pcomplete] 'completion-at-point)
  ;; only if you want to use the minibuffer for completions instead of the
  ;; in-buffer interface
  (setq-local ivy-display-functions-alist
              (remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
                    ivy-display-functions-alist)))

;;;###autoload
(defun expand-eshell-password-cache-expiry ()
  (setq password-cache-expiry 3600))
