#CRM Controller#

This is not a controller in the traditional MVC architecture. However for organization sake, or preference, the `crm.rb` file was placed in the controllers folder. This is the main file and runs the application.

At the bottom of the `crm.rb` file is the command `CRM.run`. This is a call to the class method `.run` which in turn creates a CRM instance and calls the instance method `#run`. The creation of the CRM instance initializes an instance of the Rolodex class. (See `rolodex.rb' file for details on the Rolodex class.)

`#run`

The #run method is the heart of the application where an infinite while loop is executed.

`#menu`

The application menu is numeric based, so instead of entering text for select a task, the user enters the number equivalent. This method returns an integer.

`#prompt_contact_info`

Method prompts user (via stdout) for first name, last name, email address, and notes. After every prompt a gets command is issue to collect user input via the stdin (keyboard entry into the terminal).

The method returns a hash of contact info which can be conveniently passed to an ActiveRecord method.

`#prompt_contact_id`

Method prompts user for the contact's I.D. number and returns an integer.

`#prompt_for_attribute`

Method prompts user for the attribute they want to modify or search by. The method returns an integer.

`#collect_attribute_value`

Prompts user for the attribute value and reads the value entered by the user.

`#sanitize_name, #sanitize_email, #sanitize_notes`

Methods used to validate user input
