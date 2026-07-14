;;; test.el --- Demo -*- lexical-binding: t; -*-

(defun hello-user (name)
  "向 NAME 打招呼。"
  (message "Hello %s!" name))

(defun greet-twice (name)
  "呼叫 hello-user 兩次。"
  (hello-user name)
  (hello-user name))

(setq my-user-name "Annie")

(greet-twice my-user-name)


