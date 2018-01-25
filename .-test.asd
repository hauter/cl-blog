(in-package :cl-user)
(defpackage .-test-asd
  (:use :cl :asdf))
(in-package :.-test-asd)

(defsystem .-test
  :author "Cody Sun"
  :license ""
  :depends-on (:.
               :prove)
  :components ((:module "t"
                :components
                ((:file "."))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
