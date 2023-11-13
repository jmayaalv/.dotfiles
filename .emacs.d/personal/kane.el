;; Atlas
(defvar *atlas-home* "/Users/jmayaalv/Developer/db-support")

(defun atlas-migration-name (path client branch)
  "New migration with `PATH` name on the given `CLIENT` using the `BRANCH` and current time."
  (format "%s/sql/%s/%s-%s.up.sql" path client (format-time-string "%Y%m%d%H%M%S") branch))

(defun atlas-migration (client branch)
  "Create a new migration on the given `CLIENT` in the new `BRANCH` and outputs the migration on a new buffer."
  (interactive "sclient? \nsbranch? ")
  (let ((migration-file-path (atlas-migration-name *atlas-home* client branch)))
    (switch-to-buffer (generate-new-buffer migration-file-path))
    (write-file migration-file-path)
    (message (format "new migration: %s on branch: %s" migration-file-path branch))))


;; SQL servers
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

        (nav.prod
         (sql-name "nav.prod")
          (sql-default-directory "/ssh:devel.jmayaalv@navdb:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsnavprod")
         (sql-database "imsnavproddb"))

       (axonic.test
         (sql-name "axonic.test")
         (sql-default-directory "/ssh:devel.jmayaalv@axonictest1:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsaxonict1")
         (sql-database "imsaxonict1db"))

       (axonic.test2
        (sql-name "axonic.test2")
        (sql-default-directory "/ssh:devel.jmayaalv@axonictest2:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imsaxonict2")
        (sql-database "imsaxonict2db"))

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

        (oic.test2
         (sql-name "oic.test2")
         (sql-default-directory "/ssh:devel.jmayaalv@oictest2:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsoictest2")
         (sql-database "imsoictest2db"))

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
         (sql-postgres-program "/usr/local/postgresql-12.2/bin/psql")
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

       (sanlam.test
         (sql-name "sanlam.test")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@sanlamtest1:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imssgist1")
         (sql-database "imssgist1db"))

       (glacier.test
         (sql-name "glacier.test1")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@glaciertest1:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsglaciertest1")
         (sql-database "imsglaciertest1db"))

       (glacier.test2
         (sql-name "glacier.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@glaciertest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsglaciertest2")
         (sql-database "imsglaciertest2db"))

       (glacier.test3
        (sql-name "glacier.test3")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-default-directory "/ssh:devel.jmayaalv@glaciertest3:")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imsglaciert3")
        (sql-database "imsglaciert3db"))

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
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@omniaprod:")
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

        (agl.test1
         (sql-name "agl.test1")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@agltest1:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsdartatest1")
         (sql-database "imsdartatest1db"))

        (agl.test2
         (sql-name "agl.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@agltest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsdartatest2")
         (sql-database "imsdartatest2db"))

        (agl.test3
         (sql-name "agl.test3")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@agltest3:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsdartatest3")
         (sql-database "imsdartatest3db"))

        (argus.prod
         (sql-name "argus.prod")
         (sql-postgres-program "/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@argusprod:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsargusprod")
         (sql-database "imsargusproddb"))

       (argus.test2
         (sql-name "argus.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@argustest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsargust2")
         (sql-database "imsargust2db"))

        (providence.prod
         (sql-name "providence.prod")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@providenceprod:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsprovidenceprod")
         (sql-database "imsprovidenceproddb"))

       (allangray.test1
         (sql-name "allangray.test1")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@allangraytest1:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsagrayt1")
         (sql-database "imsagrayt1db"))

       (allangray.test2
         (sql-name "allangray.test2")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@allangraytest2:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsagrayt2")
         (sql-database "imsagrayt2db"))

       (allangray.prod
        (sql-name "allangray.prod")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-default-directory "/ssh:devel.jmayaalv@allangraydb:")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imsagrayprod")
        (sql-database "imsagrayproddb"))

       (providence.test
         (sql-name "providence.test")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-default-directory "/ssh:devel.jmayaalv@providencetest:")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsprovidencetest")
         (sql-database "imsprovidencetestdb"))

       (prospero.test
         (sql-name "nextgen.test")
         (sql-default-directory "/ssh:devel.jmayaalv@nextgentest1:")
         (sql-postgres-program "/usr/local/pgsql/bin/psql")
         (sql-product 'postgres)
         (sql-port 5432)
         (sql-server "localhost")
         (sql-user "imsngt1")
         (sql-database "imsngt1db"))

       (prospero.prod
        (sql-name "prospero.prod")
        (sql-default-directory "/ssh:devel.jmayaalv@prosperodb:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imsprosprod")
        (sql-database "imsprosproddb"))

       (secura.test1
        (sql-name "secura.test1")
        (sql-default-directory "/ssh:devel.jmayaalv@securatest1:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imssecurat1")
        (sql-database "imssecurat1db"))

       (secura.prod
        (sql-name "secura.prod")
        (sql-default-directory "/ssh:devel.jmayaalv@securaprod:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imssecuraprod")
        (sql-database "imssecuraproddb"))

       (lic.test
        (sql-name "lic.test")
        (sql-default-directory "/ssh:devel.jmayaalv@lictest1:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imslict1")
        (sql-database "imslict1db"))

       (lic.prod
        (sql-name "lic.prod")
        (sql-default-directory "/ssh:devel.jmayaalv@licprod:")
        (sql-postgres-program "/usr/local/pgsql/bin/psql")
        (sql-product 'postgres)
        (sql-port 5432)
        (sql-server "localhost")
        (sql-user "imslicprod")
        (sql-database "imslicproddb"))
       ))

 (defun sql-localhost.dev ()
   "Create a new sql connection to the local dev db."
   (interactive)
   (my-sql-connect  'postgres 'localhost.dev))

 (defun sql-allangray.test1 ()
   "Create a new sql connection to allan gray test1 db."
   (interactive)
   (my-sql-connect  'postgres 'allangray.test1))

(defun sql-allangray.prod ()
  "Create a new sql connection to allan gray prod db."
  (interactive)
  (my-sql-connect  'postgres 'allangray.prod))

(defun sql-axonic.test ()
  "Create a new sql connection to axonic test db."
  (interactive)
  (my-sql-connect  'postgres 'axonic.test))

(defun sql-axonic.test2 ()
  "Create a new sql connection to axonic test 2db."
  (interactive)
  (my-sql-connect  'postgres 'axonic.test2))

(defun sql-agl.test1 ()
  "Create a new sql connection to agl test1 db."
  (interactive)
  (my-sql-connect  'postgres 'agl.test1))

(defun sql-agl.test2 ()
  "Create a new sql connection to agl test2 db."
  (interactive)
  (my-sql-connect  'postgres 'agl.test2))

(defun sql-agl.test3 ()
  "Create a new sql connection to agl test3 db."
  (interactive)
  (my-sql-connect  'postgres 'agl.test3))

 (defun sql-allangray.test2 ()
  "Create a new sql connection to allan gray test2 db."
  (interactive)
  (my-sql-connect  'postgres 'allangray.test2))

 (defun sql-nav.prod ()
   "Create a new sql connection to nav  db."
   (interactive)
   (my-sql-connect  'postgres 'nav.prod))

 (defun sql-localhost.test ()
   "Create a new sql connection to the local test db."
   (interactive)
   (my-sql-connect  'postgres 'localhost.test))

 (defun sql-prospero.test ()
   "Create a new sql connection to the next geokn test db"
   (interactive)
   (my-sql-connect  'postgres 'prospero.test))

(defun sql-prospero.prod ()
  "Create a new sql connection to prospero db."
  (interactive)
  (my-sql-connect  'postgres 'prospero.prod))

(defun sql-lic.test ()
  "Create a new sql connection to lic test1"
  (interactive)
  (my-sql-connect  'postgres 'lic.test))

(defun sql-lic.prod ()
  "Create a new sql connection to lic prod"
  (interactive)
  (my-sql-connect  'postgres 'lic.prod))

 (defun sql-oic.prod ()
   "Create a new sql connection to the oic prod db."
    (interactive)
    (my-sql-connect 'postgres 'oic.prod))

 (defun sql-omnia.prod ()
   "Create a new sql connection to the omnia prod db."
   (interactive)
   (my-sql-connect 'postgres 'omnia.prod))

 (defun sql-agl.prod ()
   "Create a new sql connection to the agl prod db."
   (interactive)
   (my-sql-connect 'postgres 'agl.prod))

 (defun sql-omi.prod ()
   "Create a new sql connection to the omi prod db."
   (interactive)
   (my-sql-connect 'postgres 'omi.prod))

 (defun sql-oic.test2 ()
   "Create a new sql connection to the oic test2 db."
    (interactive)
    (my-sql-connect 'postgres 'oic.test2))

 (defun sql-oic.test3 ()
   "Create a new sql connection to the oic test3 db."
    (interactive)
    (my-sql-connect 'postgres 'oic.test3))

 (defun sql-glacier.prod ()
   "Create a new sql connection to the glacier prod db."
   (interactive)
   (my-sql-connect 'postgres 'glacier.prod))

 (defun sql-argus.prod ()
   "Create a new sql connection to the argus prod db."
    (interactive)
    (my-sql-connect 'postgres 'argus.prod))

 (defun sql-argus.test2 ()
   "Create a new sql connection to the argus prod db."
    (interactive)
    (my-sql-connect 'postgres 'argus.test2))

 (defun sql-providence.prod ()
   "Create a new sql connection to the providence prod db."
    (interactive)
    (my-sql-connect 'postgres 'providence.prod))

 (defun sql-providence.test ()
   "Create a new sql connection to the providence test db."
    (interactive)
    (my-sql-connect 'postgres 'providence.test))

 (defun sql-glacier.test ()
   "Create a new sql connection to the glacier test db."
    (interactive)
    (my-sql-connect 'postgres 'glacier.test))

 (defun sql-glacier.test2 ()
   "Create a new sql connection to the glacier test2 db."
    (interactive)
    (my-sql-connect 'postgres 'glacier.test2))

 (defun sql-glacier.test3 ()
  "Create a new sql connection to the glacier test3 db."
  (interactive)
  (my-sql-connect 'postgres 'glacier.test3))

 (defun sql-veritas.test ()
   "Create a new sql connection to the veritas test db."
    (interactive)
    (my-sql-connect 'postgres 'veritas.test))

 (defun sql-veritas.prod ()
   "Create a new sql connection to the veritas prod db."
    (interactive)
    (my-sql-connect 'postgres 'veritas.prod))

 (defun sql-sanlam.prod ()
   "Create a new sql connection to the sanlam prod db."
    (interactive)
    (my-sql-connect 'postgres 'sanlam.prod))

(defun sql-sanlam.test ()
   "Create a new sql connection to the sanlam test 1 db."
    (interactive)
    (my-sql-connect 'postgres 'sanlam.test))

 (defun sql-northstar.prod ()
   "Create a new sql connection to the sanlam prod db."
    (interactive)
    (my-sql-connect 'postgres 'northstar.prod))

 (defun sql-northstar.test ()
   "Create a new sql connection to the northstar test db."
    (interactive)
    (my-sql-connect 'postgres 'northstar.test))

 (defun sql-omi.test1 ()
   "Create a new sql connection to the omi test1 db."
    (interactive)
    (my-sql-connect 'postgres 'omi.test1))

 (defun sql-omi.test2 ()
   "Create a new sql connection to the omi test2 db."
    (interactive)
    (my-sql-connect 'postgres 'omi.test2))

 (defun sql-omi.test4 ()
   "Create a new sql connection to the omi test4 db."
    (interactive)
    (my-sql-connect 'postgres 'omi.test4))

 (defun sql-omnia.test ()
   "Create a new sql connection to the omnia test db."
    (interactive)
    (my-sql-connect 'postgres 'omnia.test))

(defun sql-secura.test1 ()
  "Create a new sql connection to the secura test 1 db."
  (interactive)
  (my-sql-connect  'postgres 'secura.test1))

(defun sql-secura.prod ()
  "Create a new sql connection to the secura prod  db."
  (interactive)
  (my-sql-connect  'postgres 'secura.prod))

 (defun my-sql-connect (product connection)
   "Create a new sql CONNECTION with a given PRODUCT."
    (setq sql-product product)
    (sql-connect connection))

  (defun sql-connect-preset (product name)
    "Connect to a predefined SQL connection listed in `sql-connection-alist'"
    (setq sql-product product)
    (eval `(let ,(cdr (assoc name sql-connection-alist))
             (flet ((sql-get-login (&rest what)))
               (sql-product-interactive sql-product)))))
