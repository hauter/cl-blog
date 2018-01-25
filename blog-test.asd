(in-package :cl-user)
(defpackage blog-test-asd
  (:use :cl :asdf))
(in-package :blog-test-asd)

(defsystem blog-test
  :author "Cody Sun"
  :license ""
  :depends-on (:blog
               :prove)
  :components ((:module "t"
                :components
                ((:file "blog"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
