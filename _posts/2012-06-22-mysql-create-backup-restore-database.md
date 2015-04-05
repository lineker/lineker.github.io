---
title: MySQL Create, Backup, Restore database
author: Lineker Tomazeli
layout: post
permalink: mysql-create-backup-restore-database
---
Just for reference.

Backup:  
$ mysqldump -u root -p -v DB_NAME > BkpDB.sql

Restore:  
$ mysql -u root -p DB_NAME < BkpDB.sql

To create a database:  
$ mysqladmin -u root -p create DB_NAME
