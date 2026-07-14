(defun hello-user (name)
  (message "Hello %s!" name))

(defun my/add-tax (price)
  (let ((tax (* price 0.05)))
    (+ price tax)))


