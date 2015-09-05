(deftheme rfnash
  "Created 2015-09-04.")

(custom-theme-set-variables
 'rfnash)

(custom-theme-set-faces
 'rfnash
 '(default ((t (:family "Liberation Mono for Powerline" :foundry "unknown" :slant normal :weight normal :height 143 :width normal))))
 '(org-habit-ready-face ((((background light)) (:background "#4df946")) (((background dark)) (:background "forestgreen"))))
 '(org-habit-alert-face ((((background light)) (:background "#f5f946")) (((background dark)) (:background "gold"))))
 '(org-habit-clear-future-face ((((background light)) (:background "#d6e4fc")) (((background dark)) (:background "midnightblue"))))
 '(org-habit-ready-future-face ((((background light)) (:background "#acfca9")) (((background dark)) (:background "darkgreen"))))
 '(org-habit-overdue-face ((((background light)) (:background "#f9372d")) (((background dark)) (:background "firebrick"))))
 '(org-habit-clear-face ((((background light)) (:background "#8270f9")) (((background dark)) (:background "blue"))))
 '(org-habit-overdue-future-face ((((background light)) (:background "#fc9590")) (((background dark)) (:background "darkred"))))
 '(org-habit-alert-future-face ((((background light)) (:background "#fafca9")) (((background dark)) (:background "darkgoldenrod")))))

(provide-theme 'rfnash)
