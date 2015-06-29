Written in Ruby

##First Iteration of CRM app##

OOP was used to create a Customer Relationship Management (CRM) application.

Create way to practice object oriented programming concepts.

*No database available so data is not persisted*

##Second Iteration of CRM app##

Added sqlite3 database along with schema file, seed file, and supporting files.

*Data is now persisted*

##Third Iteration##

Rearranged filing to reflect a Model/Controller setup.

Added Rake task and separated the connecting to database, schema and seed functionality.

Added Rspec and setup testing with test database and test database log.

##Forth Iteration##
Rearranged filing to add views; Text is now formatted to display various colours.

*Run Application:*
Application is run by using the rake commands
rake db:setup - to set up database and seed data;
rake run - to run the application

*Run Entire Test Suite*
rake or Rspec spec



**See the Requirements.md file for more details**


**Further documentation in application and database folders**