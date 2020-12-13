# DB Support

This repository contains migration files to be run remotely.

## Installation

Clone this repository locally and add executions permissions to the `migration` script

_mac only_
```
chmod +x migration.sh
```


## Structure

### Migration Files
The migration files follow the following format: `YYYYMMddHHmmss-name.up.sql` where `name` is a descriptive name for a migration.

### Branches
Target branches should correspond to branch names. Only `admin` users should create target branches.

### Fix Branches
Feature branches can have any name, ideally they should correspond to a jira ticket. example: OIC-102

### Directory
The `sql` directory contains subdirectory for each client. Migrations would only run if they are inside one of the client folders.

## Usage
1. Clone this repository (only required first time)

2. Checkout to the client you want to apply the migrations. Ex: `git checkout oic`

2.1. If the branch doesn't exist run `git fetch origin` to get the latest branches and run `git checkout` again. If branch still does
nt' exist contact the admin to create the branch.

3. Create a fix branch. Ex: `git checkout -b branch_name`

4. Once in the fix branch create a migration file. Easiest way is to run the migration script:

  *mac:* `./migration oic migration_name`
  *win:* `migration.bat oic migration_name`

This will create a new file with a valid migration name on the correct folder. The script will inform the name of the file. ex:
`#=> ~/migrations/sql/oic/20190514020318-migration-name.up.sql is ready.`

5. Open the file and add the sql to execute.

6. Create a new pull request against the client branch. Ex: oic

7. Once the pull request has been approved and merged the migration will be schedule for execution. After execution a comment will be posted with the command output.

## Restrictions

There are cases where we want to restrict the rows that are modified by a sql script. Atlas supports adding metadata for this purpose.
To add metadata to a sql expression add a comment above it and use the prefix `:!` to start a metadata expression, after you can add the number of columns that sql needs to modified.

Examples:

Verify that only 1 row has been inserted
``` sql
-- :! 1
insert into atlas_test values ('hello')`;
```

Verify that only 2 row have been updated
``` sql
-- :! 2
update atlas_test set name = 'changing';
```

If a migration has a restriction that doesn't pass then the migration file will be rollback and the migration has to be fixed in a new pull request.

## Troubleshooting

If there is a comment informing there was an error then a new pull request would need to be created modifying the file that caused the error. This applies for restriction validations and sql errors.

Once the new pull request has been created all pending migrations will applied.

## License

Copyright © 2019

Propery of Kane LPI
