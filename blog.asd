; first blog test
(in-package :cl-user)
(defpackage :blog-asd
  (:use :cl :asdf))
(in-package :blog-asd)

(defsystem :blog
  :version "0.1"
  :author "Cody Sun"
  :licence "MIT"
  :depends-on (:drakma :cl-json)
  :components ((:file "main"))
  :description "lisp blog example")
