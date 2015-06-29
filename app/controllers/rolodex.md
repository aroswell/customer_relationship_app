#Rolodex Class

Rolodex#add_contact
Method receives contact_info hash and creates a new contact in the database.

Rolodex#modify_contact
Method finds contact by I.D.  and then modifies a particular attribute. Method returns a hash.

Rolodex#display_all_contacts
Method uses ActiveRecord .all method to retrieve all contacts in the database. The contact record objects are converted into an array of strings and returned.

Rolodex#display_particular_contact
Method displays contact by contact's I.D.

Rolodex#display_info_by_attribute
Method to display contacts by their attribute. Returns a hash with status and an array of contact info as a string and not a record object. In the case of an error, the hash contains a status of false and an error message.

Rolodex#delete_contact
Method removes a contact fromt the contacts database table via the ActiveRecord #destroy method. The method returns a hash indicating the status (true or false) and the contact info the person removed from the database, or in the case of an error, an error message.

Rolodex#load_people
This is a private method with the responsibility of building an array of contact info strings.