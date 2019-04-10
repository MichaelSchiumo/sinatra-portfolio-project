Specs:

 x. Use Sinatra to build the app: the entire application runs on the Sinatra server.

 x. Use ActiveRecord for storing information in a database - ActiveRecord is required throughout the project, and is capable of persisting data pertaining to users and exercises.

x.  Include more than one model class (e.g. User, Post, Category) - the project contains a User and an Exercise model.

x. Include at least one has_many relationship on your User model (e.g. User has_many Posts) - for this project, the User model has_many Exercises.

x. Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - for this project, the Exercise model belongs_to the User model.

x. Include user accounts with unique login attribute (username or email) - each user is required to sign up and login with unique attributes, including a proper email address.

x. Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - users are able to perform all CRUD actions on the exercise data.

 x. Ensure that users can't modify content created by other users - a user must be logged in to view or edit content, and cannot access another account's information.

 x. Include user input validations - the has_secure_password and presence validations were used. Additionally, passwords are concealed using password_digest and the input type "password."

 x. BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - the application has several flash messages and data validations that signal to a user that the information is either incorrect, or missing.

 x. Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - others may find all of the above information in the README.md file.
Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message
