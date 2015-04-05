---
title: Clone and migrate your WordPress blog to a new server
author: Lineker Tomazeli
layout: post
permalink: clone-and-migrate-your-wordpress-blog-to-a-new-server
---
Hereâ€™s how you can clone and migrate your WordPress blog to a new server  
1. Download the wp-db-backup plugin.  
2. Upload to your existing server and activate it via the â€˜Pluginsâ€˜ menu.  
3. Go to the â€˜Manageâ€˜ -> â€˜Backupâ€˜ menu. Select all the tables (including those tables created by the plugins) and click the Backup button to download the gzip file to your computer.  
4.In your computer, extract the gzip backup file. You should now have a sql file.  
5. Open the sql file with a text editor. Search for your old url (&#8220;http://www.your-old-url.com&#8221;)  
Replace the url with your new URL. Save and exit.

Using a FTP program, download the whole WordPress folder from your current server to your computer. Keep the folder structure intact, especially the wp-content folder.  
Log in to the PhpMyAdmin in the new server  
Create a new database for your wordpress and import or run the sql file to the database  
Change the database configuration in the wp-config file in the WordPress folder that you have downloaded  
Upload the whole WordPress folder to the new server.

Done. You can now proceed to your wp-login page at the new server and login with the same username and password. All the configuration and settings will be the same as before.  
If your WordPress database (the sql file you have created) is more than 2MB, the above method might not work since PhpMyAdmin only allows a maximum of 2MB file import.

source : http://maketecheasier.com/clone-and-migrate-wordpress-blog-to-new-server/2008/01/30
