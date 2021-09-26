; tell it who I am
(setq user-mail-address	"s.j.hawes@btinternet.com"
      user-full-name	"Stephen J Hawes")

; bt mail
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port "imaps")
				  (nnimap-stream ssl)))

(setq gnus-secondary-select-methods
      '((nnimap "bt"
	       (nnimap-address "mail.btinternet.com")  
	       (nnimap-server-port 993)
	       (nnimap-stream ssl))
      (nnimap "ucl"
	       (nnimap-address "outlook.office365.com") 
	       (nnimap-server-port 993)
	       (nnimap-stream ssl))))

(setq smtp-accounts
      '(("s.j.hawes@btinternet.com" "mail.btinternet.com" 587 "s.j.hawes@btinternet.com")
	("ucqhhaw@ucl.ac.uk" "smtp.office365.com" 587 "ucqhhaw@ucl.ac.uk")))

;; Set the SMTP Server according to the mail address we use for sending
(defun set-smtp-server-message-send-and-exit ()
    "Set SMTP server from list of multiple ones and send mail."
    (interactive)
    (message-remove-header "X-Message-SMTP-Method") ;; Remove. We always determine it by the From field
    (let ((sender
           (message-fetch-field "From")))
      (cl-loop for (addr server port usr) in smtp-accounts
            when (string-match addr sender)
            do (message-add-header (format "X-Message-SMTP-Method: smtp %s %d %s" server port usr)))
      (let ((xmess
             (message-fetch-field "X-Message-SMTP-Method")))
        (if xmess
            (progn
              (message (format "Sending message using '%s' with config '%s'" sender xmess))
              (message-send-and-exit))
          (error "Could not find SMTP Server for this Sender address: %s. You might want to correct it or add it to the SMTP Server list 'smtp-accounts'" sender)))))
  
  ;; Send emails via multiple servers
  (defun local-gnus-compose-mode ()
    "Keys."
    (local-set-key (kbd "C-c C-c")  'set-smtp-server-message-send-and-exit))
  
  ;; set in group mode hook
  (add-hook 'gnus-message-setup-hook 'local-gnus-compose-mode)
;(setq smtpmail-smtp-server "mail.btinternet.com"
 ;     smtpmail-smtp-service 465
  ;    gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;(setq smtpmail-smtp-server "smtp.office365.com"
;      smtpmail-smtp-service 587
;      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
