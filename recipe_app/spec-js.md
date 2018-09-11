# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  On (view/ingredients/show.html.erb) e.g /ingredients/1 we are using “Next Ingredient <<” and “ >> Previous Ingredient” buttons to sift through the ingredients and display recipes associated with that ingredient using ingredients.js file e.g while on ingredients/3 show page if you click “Next Ingredient <<” button you will navigate to ingredients/4 and if you click “>> Previous Ingredient” button you will navigate to ingredients/2.

- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  On / index page we have "Read More" link, when clicked will append  entire description, link will change to "Read Less" and when this is clicked it will append only 30 characters to description
  On user's /recipes index page we again have "Read More" link, when clicked will append  entire description, link will change to "Read Less" and when this is clicked it will append only 30 characters to description

- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  Recipe has many comments new form on recipe show page is rendered without page refresh and appended to the DOM.

- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
  On e.g. recipe/1 show page new comment is created by submiting a comment form. Then new comment is appended to the DOM without page refresh.

- [X] Translate JSON responses into js model objects.
  When comment form is submitted on recipe/1 show page, the comment's id, content, recipe_id and user of new comment is used to create a JS comment object.

- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
  The data of a comment is passed into the createCommentsDiv() comment’s prototype function to create a “DIV” and then “DIV” is appended to the DOM.
  The form input fields are cleared by clearFormFields() comment’s prototype function.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
