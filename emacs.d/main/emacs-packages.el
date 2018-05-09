(require 'package)

(setq package-list '(
                     monokai-alt-theme
                     nlinum
                     neotree
                     monokai-theme
                     airline-themes
                     powerline
                     evil
                     projectile
                     ))


(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defun ensure-packages ()
  (interactive)
  (unless package-archive-contents (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (message "Installing: %s" package)
      (package-install package))))

(ensure-packages)



(provide 'emacs-packages)