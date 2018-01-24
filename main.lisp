(in-package :cl-user)
(defpackage :blog-main
  (:use :cl :drakma :cl-json)
  (:export :main :parse-json))
(in-package :blog-main)


(defun send-request (url)
  (let ((stream (drakma:http-request url)))
    (flexi-streams:octets-to-string stream)))

(defun parse-json (json)
  (with-input-from-string (s json)
    (json:decode-json s)))


(defun main (url)
  (let ((res (send-request url)))
    (parse-json res)))

