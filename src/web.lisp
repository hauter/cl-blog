(in-package :cl-user)
(defpackage blog.web
  (:use :cl
        :caveman2
        :blog.config
        :blog.view
        :blog.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :blog.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

@route GET "/users"
(defun users-list ()
  (render "users/list.html"))

@route POST "/users"
(defun users-list (&key _parsed)
  (format t "~a" _parsed)
  (render "users/list.html"))


@route GET "/users/create"
(defun users-detail ()
  (render "users/detail.html"))

@route GET "/users/:user-id"
(defun users-detail (&key user-id is-edit)
  (render "users/detail.html"))

@route PUT "/users/:user-id"
(defun users-detail (&key user-id is-edit)
  (render "users/detail.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
