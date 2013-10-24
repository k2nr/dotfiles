;; projectile
(require 'projectile)
(projectile-global-mode)
;(setq projectile-enable-caching t)
(setq projectile-indexing-method 'git)
(setq projectile-project-root-files '("project.clj" ".git" ".hg" ".bzr" "_darcs" ".projectile" "Makefile"))
(setq projectile-ignored-files '("TAGS" ".DS_Store"))
(setq projectile-ignored-file-extensions '("class" "o" "so" "elc" "jar" "a" "lib"))
(setq projectile-ignored-directories '(".idea" ".git" "Music" "Movies" "Documents" "Desktop" "Pictures"))
