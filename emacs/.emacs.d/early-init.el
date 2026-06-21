;; Force pixel-wise sizing to eliminate background padding gaps
(setq frame-resize-pixelwise t)

;; Global rule forcing AppKit to draw borderless windows with rounded corners
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; Increase the overall internal padding around the entire frame
(add-to-list 'default-frame-alist '(internal-border-width . 8))
