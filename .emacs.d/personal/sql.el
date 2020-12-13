;; Known SQL connections
(setq sql-connection-alist
            '((localhost.dev
               (sql-name "localhost.dev")
               (sql-default-directory nil)
               (sql-postgres-program "psql")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsdev")
               (sql-database "imsdb_dev"))

              (localhost.test
               (sql-name "localhost.test")
               (sql-postgres-program "psql")
               (sql-default-directory nil)
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imstest")
               (sql-database "imsdb_test"))

              (oic.prod
               (sql-name "oic.prod")
               (sql-default-directory "/ssh:devel.jmayaalv@oicdb:")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsoicprod")
               (sql-database "imsoicproddb"))

              (omi.prod
               (sql-name "omi.prod")
               (sql-default-directory "/ssh:devel.jmayaalv@omidb:")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsomiprod")
               (sql-database "imsomiproddb"))

               (omnia.test
               (sql-name "omnia.test")
               (sql-default-directory "/ssh:devel.jmayaalv@omniatest:")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsombps")
               (sql-database "imsombpsdb"))

              (oic.test3
               (sql-name "oic.test3")
               (sql-default-directory "/ssh:devel.jmayaalv@oictest3:")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsoictest3")
               (sql-database "imsoictest3db"))

              (veritas.test
               (sql-name "veritas.test")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@veritastest:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsveritastest1")
               (sql-database "imsveritastest1db"))

              (veritas.prod
               (sql-name "veritas.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@veritasprod:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsveritasprod")
               (sql-database "imsveritasproddb"))

              (omi.test1
               (sql-name "omi.test1")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@omitest:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsomitest1")
               (sql-database "imsomitest1db"))

             (omi.test2
               (sql-name "omi.test2")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@omitest2:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsomitest2")
               (sql-database "imsomitest2db"))

            (omi.test4
               (sql-name "omi.test4")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@omitest4:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsomitest4")
               (sql-database "imsomitest4db"))

              (northstar.prod
               (sql-name "northstar.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@nsdb:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsbcgprod")
               (sql-database "imsbcgproddb"))


             (northstar.test
               (sql-name "northstar.test")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@nstest1:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsnfstest1db")
               (sql-database "imsnfstest1"))

              (sanlam.prod
               (sql-name "sanlam.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@sanlamdb:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imssanlamprod")
               (sql-database "imssanlamproddb"))

              (glacier.test
               (sql-name "glacier.test1")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@glaciertest:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsombprod")
               (sql-database "imsombproddb"))

             (glacier.test2
               (sql-name "glacier.test2")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@glaciertest2:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsglaciertest2")
               (sql-database "imsglaciertest2db"))

              (glacier.prod
               (sql-name "glacier.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@glacierdb:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsglacierprod")
               (sql-database "imsglacierproddb"))

              (omnia.prod
               (sql-name "omnia.prod")
               (sql-postgres-program "/usr/local/postgresql-12.2/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@omniadb:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsombprod")
               (sql-database "imsombproddb"))

              (agl.prod
               (sql-name "agl.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@agldb:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsdartaprod")
               (sql-database "imsdartaproddb"))
              (argus.prod
               (sql-name "argus.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@argusprod:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsargusprod")
               (sql-database "imsargusproddb"))
              (providence.prod
               (sql-name "providence.prod")
               (sql-postgres-program "/usr/local/pgsql/bin/psql")
               (sql-default-directory "/ssh:devel.jmayaalv@providenceprod:")
               (sql-product 'postgres)
               (sql-port 5432)
               (sql-server "localhost")
               (sql-user "imsprovidenceprod")
               (sql-database "imsprovidenceproddb"))))


;; Sql connection functions
(defun sql-localhost.dev ()
  (interactive)
  (my-sql-connect  'postgres 'localhost.dev))

(defun sql-localhost.test ()
  (interactive)
  (my-sql-connect  'postgres 'localhost.test))

(defun sql-oic.prod ()
  (interactive)
  (my-sql-connect 'postgres 'oic.prod))

(defun sql-omnia.prod ()
  (interactive)
  (my-sql-connect 'postgres 'omnia.prod))

(defun sql-agl.prod ()
  (interactive)
  (my-sql-connect 'postgres 'agl.prod))

(defun sql-omi.prod ()
  (interactive)
  (my-sql-connect 'postgres 'omi.prod))

(defun sql-oic.test3 ()
  (interactive)
  (my-sql-connect 'postgres 'oic.test3))

(defun sql-glacier.prod ()
  (interactive)
  (my-sql-connect 'postgres 'glacier.prod))

(defun sql-argus.prod ()
  (interactive)
  (my-sql-connect 'postgres 'argus.prod))

(defun sql-providence.prod ()
  (interactive)
  (my-sql-connect 'postgres 'providence.prod))

(defun sql-glacier.test ()
  (interactive)
  (my-sql-connect 'postgres 'glacier.test))

(defun sql-glacier.test2 ()
  (interactive)
  (my-sql-connect 'postgres 'glacier.test2))

(defun sql-veritas.test ()
  (interactive)
  (my-sql-connect 'postgres 'veritas.test))

(defun sql-veritas.prod ()
  (interactive)
  (my-sql-connect 'postgres 'veritas.prod))

(defun sql-sanlam.prod ()
  (interactive)
  (my-sql-connect 'postgres 'sanlam.prod))

(defun sql-northstar.prod ()
  (interactive)
  (my-sql-connect 'postgres 'northstar.prod))

(defun sql-northstar.test ()
  (interactive)
  (my-sql-connect 'postgres 'northstar.test))

(defun sql-omi.test1 ()
  (interactive)
  (my-sql-connect 'postgres 'omi.test1))

(defun sql-omi.test2 ()
  (interactive)
  (my-sql-connect 'postgres 'omi.test2))

(defun sql-omi.test4 ()
  (interactive)
  (my-sql-connect 'postgres 'omi.test4))

(defun sql-omnia.test ()
  (interactive)
  (my-sql-connect 'postgres 'omnia.test))

(defun my-sql-connect (product connection)
  (setq sql-product product)
  (sql-connect connection))

(defun sql-connect-preset (product name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (setq sql-product product)
   (eval `(let ,(cdr (assoc name sql-connection-alist))
            (flet ((sql-get-login (&rest what)))
              (sql-product-interactive sql-product)))))

;; set buffer to use the name of the pool *SQL: <host>_<db>, which is easier to  find when you M-x list-buffers, or C-x C-b

(defun sql-make-smart-buffer-name ()
  "Return a string that can be used to rename a SQLi buffer.
        This is used to set `sql-alternate-buffer-name' within
        `sql-interactive-mode'."
  (or (and (boundp 'sql-name) sql-name)
      (concat (if (not(string= "" sql-server))
                  (concat
                   (or (and (string-match "[0-9.]+" sql-server) sql-server)
                       (car (split-string sql-server "\\.")))
                   "/"))
              sql-database)))


;; Hooks for sql mode: not truncate lines, better buffer name

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (setq sql-alternate-buffer-name (sql-make-smart-buffer-name))
            (sql-rename-buffer)))

(defun sql-add-newline-first (output)
  "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
  (concat "\n" output))

(defun sqli-add-hooks ()
  "Add hooks to `sql-interactive-mode-hook'."
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)
