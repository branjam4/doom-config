;;; lang/bran-org/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun copy-link-read-as-org ()
  "Copy a link with link-hint-copy-link,
   then use org-web-tools to download the page content
   and display it in an org-buffer"
  (interactive)
  (org-web-tools-read-url-as-org (or (thing-at-point-url-at-point)
                                     (link-hint-copy-link)
                                     (org-web-tools--read-url))))

;;;###autoload
(defun copy-link-insert-org-web-entry ()
  "Copy a link with link-hint-copy-link,\n then use org-web-tools to download the page content
   and display it as a sibling of the current org heading"
  (interactive)
  (org-web-tools-insert-web-page-as-entry (or (thing-at-point-url-at-point)
                                              (link-hint-copy-link)
                                              (org-web-tools--read-url))))

;;;###autoload
(defun copy-link-insert-org-link ()
  "Copy a link with link-hint-copy-link,\n then use org-web-tools to download the page content
   and display it as a sibling of the current org heading"
  (interactive)
  (org-web-tools-insert-link-for-url (or (thing-at-point-url-at-point)
                                         (link-hint-copy-link)
                                         (org-web-tools--read-url))))
