## Notes Backend - Laravel

### Description

This is a simple task/time management.
 1. User must be able to create an account and log in.
 2. User can add (and edit and delete) a row what he has worked on, what date, for how long.
 3. Implement two roles with different permission levels: a regular user would only be able to CRUD on their owned records, and an admin would be able to CRUD all records and users.
 4. Filter entries by date from-to.
 5. Export the filtered times to a sheet in a CSV:

### Technologies used 
• Frontend – ReactJS (Which is used here https://github.com/shejza/notes-react.git)

• Backend – Laravel

• Database – MySQL

### Installation
• Clone repo: git clone https://github.com/shejza/notes-react.git

• Install laravel dependencies: composer install

• Import db which is in this folder name notesdb.sql

• Starting the app: php artisan serve 
